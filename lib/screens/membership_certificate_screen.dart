import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:midnight_hackathon_project/routing/app_router.dart';
import 'package:midnight_hackathon_project/state/company_state_provider.dart';
import 'package:midnight_hackathon_project/state/employee_state_provider.dart';

class MembershipCertificateScreen extends ConsumerWidget {
  const MembershipCertificateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final company = ref.watch(companyStateProvider)!;
    final employee = ref.watch(employeeStateProvider)!;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Confirmed!',
          style: TextStyle(fontSize: 40),
        ),
      ),
      body: ListView(
        children: [
          const Text(
            "Your membership Certificate",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListTile(
            title: const Text('Full Name'),
            subtitle: Text('${employee.firstName} ${employee.lastName}'),
          ),
          ListTile(
            title: const Text('Email'),
            subtitle: Text(employee.email),
          ),
          ListTile(
            title: const Text('Personal ID'),
            subtitle: Text(employee.personalId),
          ),
          const ListTile(
            title: Text('Please check that the information above is correct.'),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: FilledButton(
              onPressed: () {
                context.pushNamed(AppRoute.membershipList.name);
              },
              child: const Text('Okay'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: FilledButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.red),
              ),
              child: const Text('Something is wrong?'),
            ),
          ),
        ],
      ),
    );
  }
}
