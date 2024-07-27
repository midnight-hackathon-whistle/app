import 'package:midnight_hackathon_project/models/company.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'company_state_provider.g.dart';

@Riverpod(keepAlive: true)
class CompanyState extends _$CompanyState {
  @override
  Company? build() {
    return null;
  }

  void update(Company company) {
    state = company;
  }
}
