import 'package:flutter/material.dart';

class MembershipListScreen extends StatelessWidget {
  const MembershipListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membership List'),
      ),
      body: const Center(
        child: Text('Membership List Screen'),
      ),
    );
  }
}
