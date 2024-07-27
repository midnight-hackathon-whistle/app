import 'package:midnight_hackathon_project/models/employee.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'employee_state_provider.g.dart';

@Riverpod(keepAlive: true)
class EmployeeState extends _$EmployeeState {
  @override
  Employee? build() {
    return null;
  }

  void update(Employee employee) {
    state = employee;
  }
}
