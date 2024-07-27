import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:midnight_hackathon_project/routing/not_found_screen.dart';
import 'package:midnight_hackathon_project/screens/membership_certificate_screen.dart';
import 'package:midnight_hackathon_project/screens/membership_details_screen.dart';
import 'package:midnight_hackathon_project/screens/membership_list_screen.dart';
import 'package:midnight_hackathon_project/screens/organisation_information_screen.dart';
import 'package:midnight_hackathon_project/screens/scan_qr_code_screen.dart';
import 'package:midnight_hackathon_project/screens/submit_report_screen.dart';
import 'package:midnight_hackathon_project/screens/submit_report_success_screen.dart';
import 'package:midnight_hackathon_project/screens/welcome_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

enum AppRoute {
  welcome('welcome'),
  scanQRCode('scan-qr-code'),
  organisationInformation('organisation-information'),
  membershipCertificate('membership-certificate'),
  membershipList('membership-list'),
  membershipDetails('membership-details'),
  submitReport('submit-report'),
  submitReportSuccess('submit-report-success');

  const AppRoute(this.name);

  final String name;
}

final rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/welcome',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/welcome',
        name: AppRoute.welcome.name,
        builder: (context, state) => const WelcomeScreen(),
        routes: [
          GoRoute(
            path: 'scan-qr-code',
            name: AppRoute.scanQRCode.name,
            builder: (context, state) => const ScanQRCodeScreen(),
            routes: [
              GoRoute(
                path: 'organisation-information',
                name: AppRoute.organisationInformation.name,
                builder: (context, state) =>
                    const OrganisationInformationScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/membership-certificate',
        name: AppRoute.membershipCertificate.name,
        builder: (context, state) => const MembershipCertificateScreen(),
      ),
      GoRoute(
        path: '/membership-list',
        name: AppRoute.membershipList.name,
        builder: (context, state) => const MembershipListScreen(),
        routes: [
          GoRoute(
            path: 'membership-details',
            name: AppRoute.membershipDetails.name,
            builder: (context, state) => const MembershipDetailsScreen(),
            routes: [
              GoRoute(
                path: 'submit-report',
                name: AppRoute.submitReport.name,
                builder: (context, state) => const SubmitReportScreen(),
                routes: [
                  GoRoute(
                    path: 'submit-report-success',
                    name: AppRoute.submitReportSuccess.name,
                    builder: (context, state) =>
                        const SubmitReportSuccessScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
