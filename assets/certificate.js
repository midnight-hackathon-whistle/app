function generateKeyPair() {
  return window.crypto.subtle.generateKey(
    {
      name: "RSA-PSS",
      modulusLength: 4096,
      publicExponent: new Uint8Array([1, 0, 1]),
      hash: "SHA-256",
    },
    true,
    // ["encrypt", "decrypt", "sign", "verify"],
    ["sign", "verify"],
  );
}

function signCertificate(cert, privateKey) {
  return window.crypto.subtle.sign(
    {
      name: "RSA-PSS",
      saltLength: 64
    },
    privateKey,
    cert,
  );
}

async function newCertificate(employeePubKey, firstName, lastName, email, issuerKeyPair, issuerName) {
  let cert = {
    data: {
      "issuerName": issuerName,
      "issuerPubKey": issuerKeyPair.publicKey,
      "employeeName": `${firstName} ${lastName}`,
      "employeeEmail": email,
      "employeePubKey": employeePubKey,
      "issuedAt": new Date().toISOString(),
      "validUntil": new Date(new Date().setFullYear(new Date().getFullYear() + 1)).toISOString(),
    }
  }

  cert.encryptedData = new TextEncoder().encode(JSON.stringify(cert.data));
  cert.signature = await signCertificate(cert.encryptedData, issuerKeyPair.privateKey)
    .then((signature) => { return signature })
    .catch((err) => { console.error(err) });

  return cert;
}

function verifyCertificate(certificate, publicKey) {
  return window.crypto.subtle.verify(
    {
      name: "RSA-PSS",
      saltLength: 64
    },
    publicKey,
    certificate.signature,
    certificate.encryptedData,
  );
}
