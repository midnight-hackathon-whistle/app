import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
            handlerName: "mySum",
            callback: (args) {
              print("From the JavaScript side:");
              print(args);
              return args.reduce((curr, next) => curr + next);
            });
      },
      onConsoleMessage: (controller, consoleMessage) {
        print(consoleMessage);
      },
      onLoadStop: (controller, url) async {
        await controller.injectJavascriptFileFromAsset(
            assetFilePath: 'assets/lodash.js');
        await controller.injectJavascriptFileFromAsset(
            assetFilePath: 'assets/certificate.js');
        await controller.evaluateJavascript(source: """
        console.log("LODASH");
  
        console.log(_.now());
   """);
      },
    );
  }

  void dispose() {
    state.webViewController?.dispose();
  }
}
