// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:midnight_hackathon_project/routing/app_router.dart';
import 'package:midnight_hackathon_project/state/headless_web_view_provider.dart';
import 'package:midnight_hackathon_project/widgets/async_value_widget.dart';

class OrganisationInformationScreen extends ConsumerWidget {
  const OrganisationInformationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organisation Information'),
      ),
      body: AsyncValueWidget(
        value: ref.watch(createCompanyFutureProvider),
        data: (company) {
          return AsyncValueWidget(
            value: ref.watch(createEmployeeFutureProvider),
            data: (employee) {
              return ListView(
                children: [
                  ListTile(
                    title: const Text('Name'),
                    subtitle: Text(company.name),
                  ),
                  ListTile(
                    title: const Text('Domain'),
                    subtitle: Text(company.domain),
                  ),
                  ListTile(
                    title: const Text('Membership Number'),
                    subtitle: Text(employee.personalId),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Enter secret pin'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: FilledButton(
                      onPressed: () async {
                        await ref.read(requestSignFutureProvider.future);

                        while (GoRouter.of(context).canPop()) {
                          GoRouter.of(context).pop();
                        }
                        context.pushReplacementNamed(
                            AppRoute.membershipCertificate.name);
                      },
                      child: const Text('Confirm and request sign'),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
