import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:midnight_hackathon_project/routing/app_router.dart';

class ScanQRCodeScreen extends StatelessWidget {
  const ScanQRCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
      ),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 100),
          child: Icon(
            Icons.qr_code,
            size: 300,
          ),
        ),
        const SizedBox(height: 200),
        FilledButton(
          onPressed: () {
            context.pushNamed(AppRoute.organisationInformation.name);
          },
          child: const Text('Next'),
        ),
      ]),
    );
  }
}
