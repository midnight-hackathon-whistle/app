import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:midnight_hackathon_project/routing/app_router.dart';

class SubmitReportScreen extends StatelessWidget {
  const SubmitReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit a new Report'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: 'Title',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Pick the report file'),
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () {
              while (GoRouter.of(context).canPop()) {
                GoRouter.of(context).pop();
              }
              context.pushReplacementNamed(AppRoute.submitReportSuccess.name);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
