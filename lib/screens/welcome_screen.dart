import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:midnight_hackathon_project/routing/app_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Image.asset('assets/whistle.png'),
          const SizedBox(
            height: 100,
          ),
          const Text(
            'Scan a QR Code to get started',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              context.pushNamed(AppRoute.scanQRCode.name);
            },
            child: const Text('Scan'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save_alt),
      ),
    );
  }
}
