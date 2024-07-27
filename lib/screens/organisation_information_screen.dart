import 'package:flutter/material.dart';

class OrganisationInformationScreen extends StatelessWidget {
  const OrganisationInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organisation Information'),
      ),
      body: const Center(
        child: Text('Organisation Information Screen'),
      ),
    );
  }
}
