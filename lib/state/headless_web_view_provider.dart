import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:midnight_hackathon_project/models/qr_code.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:midnight_hackathon_project/models/company.dart';
import 'package:midnight_hackathon_project/models/employee.dart';
import 'package:midnight_hackathon_project/state/company_state_provider.dart';
import 'package:midnight_hackathon_project/state/employee_state_provider.dart';

part 'headless_web_view_provider.g.dart';

@Riverpod(keepAlive: true)
class HeadlessWebView extends _$HeadlessWebView {
  @override
  HeadlessInAppWebView build() {
    return HeadlessInAppWebView(
      initialFile: "assets/index.html",
      initialSettings: InAppWebViewSettings(isInspectable: kDebugMode),
      onWebViewCreated: (controller) async {
        controller.addJavaScriptHandler(
            handlerName: "certificate",
            callback: (args) {
              // get the certificate back from javascript
            });
      },
      onLoadStop: (controller, _) async {
        await controller.injectJavascriptFileFromAsset(
            assetFilePath: 'assets/register.js');
        await controller.injectJavascriptFileFromAsset(
            assetFilePath: 'assets/certificate.js');
        await controller.injectJavascriptFileFromAsset(
            assetFilePath: 'assets/mocks.js');
      },
    );
  }

  Future<Company> createCompany() async {
    final company = await state.webViewController
        ?.evaluateJavascript(source: "createCompany();");

    return Company(
      name: company['name'],
      domain: company['domain'],
      publicKey: company['pubKey'],
    );
  }

  Future<Employee> createEmployee() async {
    final employee = await state.webViewController
        ?.evaluateJavascript(source: "createEmployee();");

    return Employee(
        firstName: employee['firstName'],
        lastName: employee['lastName'],
        email: employee['email'],
        personalId: employee['personalId'],
        pin: employee['pin'],
        keyPair: employee['keyPair']);
  }

  Future<void> parseQRCode(Company company, Employee employee) async {
    final qrCodeData = await state.webViewController?.evaluateJavascript(
        source:
            "parseQrCode('${company.name}', '${company.publicKey}', '${employee.personalId}');");

    final qrCode = QrCode(
      companyName: qrCodeData['companyName'],
      companyPubKey: qrCodeData['companyPubKey'],
      employeeId: qrCodeData['employeeId'],
    );

    // await state.webViewController?.evaluateJavascript(
    //     // issueCertificate(employeeKeyPair.publicKey, employee.firstName, employee.lastName, employee.email, issuerKeyPair, company.name)
    //     source:
    //         "issueCertificate('', '${employee.firstName}', '${employee.lastName}', '${employee.email}', '', '${qrCode.companyName}');");
  }

  Future<void> issueCertificate() async {}

  void dispose() {
    state.webViewController?.dispose();
  }
}

@Riverpod(keepAlive: true)
Future<Company> createCompanyFuture(CreateCompanyFutureRef ref) async {
  final company =
      await ref.watch(headlessWebViewProvider.notifier).createCompany();
  ref.read(companyStateProvider.notifier).update(company);
  return company;
}

@Riverpod(keepAlive: true)
Future<Employee> createEmployeeFuture(CreateEmployeeFutureRef ref) async {
  final employee =
      await ref.watch(headlessWebViewProvider.notifier).createEmployee();
  ref.read(employeeStateProvider.notifier).update(employee);
  return employee;
}

@Riverpod(keepAlive: true)
Future<void> requestSignFuture(RequestSignFutureRef ref) async {
  final company = ref.watch(companyStateProvider)!;
  final employee = ref.watch(employeeStateProvider)!;
  // Here we have to issue and verify certificate
  await ref
      .watch(headlessWebViewProvider.notifier)
      .parseQRCode(company, employee);
  await ref.watch(headlessWebViewProvider.notifier).issueCertificate();
}
