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

// This function is supposed to run on the company server to issue new certificates for employees
// For demo purposes and simplicity we omit checks and validatiions and assume the requester is an employee of the company  
function issueCertificate(employeePubKey, firstName, lastName, email, issuerKeyPair, issuerName) {
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
  signCertificate(cert.encryptedData, issuerKeyPair.privateKey)
    .then((signature) => {
      cert.signature = signature;
      window.flutter_inappwebview.callHandler('certificate', cert);
    })
    .catch((err) => { console.error(err) });
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
