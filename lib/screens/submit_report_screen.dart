import 'package:flutter/material.dart';

class SubmitReportScreen extends StatelessWidget {
  const SubmitReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Report'),
      ),
      body: const Center(
        child: Text('Submit Report Screen'),
      ),
    );
  }
}
