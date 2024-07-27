
// -----------------------------
// Wallet mock data

const walletAddress = createWallet();


// -----------------------------
// Company mock data

const issuerKeyPair = generateKeyPair()
  .then((keyPair) => { return keyPair })
  .catch((err) => { console.error(err) });

const createCompany = function() {
  return {
    name: 'Medical ABC',
    domain: 'abc.med',
    pubKey: '9c2f1b4e7a5d3c8f1e6b2d4a9f3c7b1e5a4d8f2e1c9b3a7d5e6f8c4b2a1d3f7',
    keyPair: issuerKeyPair,
  }
}


// -----------------------------
// Employee mock data

const employeeKeyPair = generateKeyPair()
  .then((keyPair) => { return keyPair })
  .catch((err) => { console.error(err) });

const createEmployee = function() {
  return {
    firstName: 'John',
    lastName: 'Doe',
    email: `john.doe@domain.com`,
    personalId: '67245',
    pin: '3863',
    keyPair: employeeKeyPair,
  }
}

// -----------------------------

// const company = createCompany();
// const employee = createEmployee();
// const qrCode = parseQrCode(company.name, company.pubKey, employee.personalId);
// const cert = await newCertificate(employeeKeyPair.publicKey, employee.firstName, employee.lastName, employee.email, issuerKeyPair, company.name);
// const verified = await verifyCertificate(cert, issuerKeyPair.publicKey);
