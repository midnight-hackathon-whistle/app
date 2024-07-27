import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:midnight_hackathon_project/routing/app_router.dart';

class MembershipDetailsScreen extends StatelessWidget {
  const MembershipDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rowing Airlines'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            onTap: () {},
            title: const Text('Submit Vote'),
          ),
          ListTile(
            onTap: () {
              context.pushNamed(AppRoute.submitReport.name);
            },
            title: const Text('Submit Report'),
          ),
          ListTile(
            onTap: () {},
            title: const Text('See your previous Submissions'),
          ),
        ],
      ),
    );
  }
}
