# midnight hackathon project "whistle"

The basic (mocked) internal API

```
// 1. user gets a wallet on midnight
createWallet()

// 2. upon initial registration: extract information provided by your company
parseQrCode()

// 3. user claims membership in organisation and receives signed certificate
requestCertificate()

// 4. verify the signature of the certificate
verifyCertificate()

// 5. submit report
submitReport()
```

The uncompiled and untested compact contract for midnight can be found in the root folder `whistle_0.01.compact`.
