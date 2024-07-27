
import { generateKeyPair, newCertificate, verifyCertificate } from './certificate.js';
import { createWallet, parseQrCode } from './register.js';


// -----------------------------
// Wallet mock data

const walletAddress = createWallet();


// -----------------------------
// Company mock data

const issuerKeyPair = await generateKeyPair()
  .then((keyPair) => { return keyPair })
  .catch((err) => { console.error(err) });

const createCompany = function() {
  return {
    name: 'Medical ABC',
    domain: 'abc.med',
    pubKey: '0x1234567890abcdef',
    keyPair: issuerKeyPair,
  }
}


// -----------------------------
// Employee mock data

const employeeKeyPair = await generateKeyPair()
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
