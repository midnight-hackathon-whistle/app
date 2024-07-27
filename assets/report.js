function submitReport(title, blob, certificate, companyPubKey) {
  if (verifyCertificate(certificate, companyPubKey) == false) {
    return {
      message: "Certificate verification failed",
      status: "error"
    };
  }

  response = uploadBlob(blob).then((response) => {
    // indicate partial success and store the submitted report in the local storage in case of an error;
    // submit the hash to the midnight blockchain
    const contractResponse = submitReportToMidnight(response.hash, response.url, certificate);
  });
}

function uploadBlob(blob) {
  // upload blob to IAGON / IPFS / whatsoever
  return new Promise((resolve, reject) => {
    resolve(
      {
        hash: "bafybeihkoviema7g3gxyt6la7vd5ho32ictqbilu3wnlo3rs7ewhnp7lly",
        url: "https://ipfs.io/ipfs/bafybeihkoviema7g3gxyt6la7vd5ho32ictqbilu3wnlo3rs7ewhnp7lly"
      }
    );
  });
}

function submitReportToMidnight(hash, url, certificate) {
  // store the report hash and it's location on the midnight blockchain, referencing the company by the publicKey
  return new Promise((resolve, reject) => {
    resolve(
      {
        txHash: "a7b3c96d1f54e293a4d8b1f0c2e5f7a389c2d4e5f9a1b7c3d4e8a9f2b3c6d8a",
        status: "success",
        message: "Report submitted successfully"
      }
    );
  });
}

const report = submitReport("Foobar leaks", new Blob(["Foobar leaks confidential data"], { type: "text/plain" }));
