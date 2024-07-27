import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:midnight_hackathon_project/routing/app_router.dart';
import 'package:midnight_hackathon_project/state/headless_web_view_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // turn off the # in the URLs on the web
  usePathUrlStrategy();

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }

  runApp(const ProviderScope(child: Myapp()));
}

class Myapp extends ConsumerWidget {
  const Myapp({super.key});

  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Starts the headless web view
    ref.read(headlessWebViewProvider).run();

    return MaterialApp.router(
      routerConfig: ref.watch(goRouterProvider),
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      onGenerateTitle: (BuildContext context) => 'Midnight Hackathon Project',
      darkTheme: ThemeData(brightness: Brightness.light),
      themeMode: ThemeMode.light,
      scaffoldMessengerKey: scaffoldMessengerKey,
    );
  }
}

class MidnightHeadlessWebView extends StatefulWidget {
  const MidnightHeadlessWebView({required this.child, super.key});

  final Widget? child;

  @override
  State<MidnightHeadlessWebView> createState() =>
      _MidnightHeadlessWebViewState();
}

class _MidnightHeadlessWebViewState extends State<MidnightHeadlessWebView> {
  HeadlessInAppWebView? headlessWebView;
  String url = "";

  @override
  void initState() {
    super.initState();

    headlessWebView = HeadlessInAppWebView(
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
        await controller.injectJavascriptFileFromUrl(
            urlFile: WebUri(
                'https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js'),
            scriptHtmlTagAttributes: ScriptHtmlTagAttributes(
                id: 'lodash',
                onLoad: () {
                  print("lodash loaded and ready to be used!");
                },
                onError: () {
                  print("lodash not available! Some error occurred.");
                }));

        await controller.injectJavascriptFileFromAsset(
            assetFilePath: 'assets/lodash.js');
        await controller.evaluateJavascript(source: """
        console.log("LODASH");

        console.log(_("hey"));
        console.log(_.now());
 """);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    headlessWebView?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          "HeadlessInAppWebView Example",
        )),
        body: SafeArea(
            child: Column(children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
                "URL: ${(url.length > 50) ? "${url.substring(0, 50)}..." : url}"),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  await headlessWebView?.dispose();
                  await headlessWebView?.run();
                },
                child: const Text("Run HeadlessInAppWebView")),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  if (headlessWebView?.isRunning() ?? false) {
                    await headlessWebView?.webViewController
                        ?.evaluateJavascript(
                            source: "console.log('Here is the message!');");
                  } else {
                    const snackBar = SnackBar(
                      content: Text(
                          'HeadlessInAppWebView is not running. Click on "Run HeadlessInAppWebView"!'),
                      duration: Duration(milliseconds: 1500),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: const Text("Send console.log message")),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  headlessWebView?.dispose();
                  setState(() {
                    url = '';
                  });
                },
                child: const Text("Dispose HeadlessInAppWebView")),
          )
        ])));
  }
}
