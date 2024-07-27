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
      themeMode: ThemeMode.light,
      theme: ThemeData(brightness: Brightness.light, useMaterial3: true),
      scaffoldMessengerKey: scaffoldMessengerKey,
    );
  }
}
