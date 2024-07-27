import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:midnight_hackathon_project/routing/app_router.dart';

class MembershipListScreen extends StatelessWidget {
  const MembershipListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memberships Certificates'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            dense: true,
            leading: const Text(
              'Rowing Airlines',
              style: TextStyle(fontSize: 20),
            ),
            trailing: const Text('Reports: 0', style: TextStyle(fontSize: 13)),
            onTap: () {
              context.pushNamed(AppRoute.membershipDetails.name);
            },
          ),
        ],
      ),
    );
  }
}
