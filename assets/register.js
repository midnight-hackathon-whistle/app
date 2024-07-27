function createWallet() {
  // create keys for a new midnight wallet
  // store the keys in the app's local storage
  // return the public key / address for simplicity
  return "f13d2e4c7b9a8f1d2c3e5b6a4d1f8c2e7a4b9d6f3c1e2d4b8a7c5e9f2b3d6a1";
}

// takes these arguments as the QR code is just mocked for the demo.
// In the real world, the QR code would be scanned and the information would be extracted
function parseQrCode(companyName, companyPubKey, employeeId) {
  return {
    companyName: companyName,
    companyPubKey: companyPubKey,
    employeeId: employeeId,
  }
}
