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
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed(AppRoute.organisationInformation.name);
          },
          child: const Text('Organizational Information'),
        ),
      ),
    );
  }
}
