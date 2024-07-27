import 'package:flutter/material.dart';

class MembershipDetailsScreen extends StatelessWidget {
  const MembershipDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membership Details'),
      ),
      body: const Center(
        child: Text('Membership Details Screen'),
      ),
    );
  }
}
