import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:midnight_hackathon_project/routing/app_router.dart';

class SubmitReportSuccessScreen extends StatelessWidget {
  const SubmitReportSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Success!',
          style: TextStyle(fontSize: 40),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Icon(
            Icons.check_circle,
            size: 100,
            color: Colors.green,
          ),
          const SizedBox(height: 20),
          const Text(
            'Your report has been submitted successfully.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const SizedBox(
              width: 50,
            ),
            title: const SelectableText(
              'Link to uploaded file',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
              ),
            ),
            trailing:
                IconButton(icon: const Icon(Icons.download), onPressed: () {}),
          ),
          const SizedBox(height: 450),
          FilledButton(
            onPressed: () {
              context.pushNamed(AppRoute.membershipList.name);
            },
            child: const Text('Okay'),
          )
        ],
      ),
    );
  }
}
