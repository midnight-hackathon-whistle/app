function createWallet() {
  // create keys for a new midnight wallet
  // store the keys in the app's local storage
  // return the public key / address for simplicity
  return "0x1234567890abcdef";
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
