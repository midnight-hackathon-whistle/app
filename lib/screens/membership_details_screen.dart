import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:midnight_hackathon_project/routing/app_router.dart';

class MembershipDetailsScreen extends StatelessWidget {
  const MembershipDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Name'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            onTap: () {},
            title: const Text('Submit vote'),
          ),
          ListTile(
            onTap: () {
              context.pushNamed(AppRoute.submitReport.name);
            },
            title: const Text('Submit report'),
          ),
          ListTile(
            onTap: () {},
            title: const Text('See your submissions'),
          ),
        ],
      ),
    );
  }
}
