import 'package:equatable/equatable.dart';
import '../../domain/entities/test_case.dart';

abstract class TestPlanEvent extends Equatable {
  const TestPlanEvent();

  @override
  List<Object?> get props => [];
}

class GetTestCasesForPlanEvent extends TestPlanEvent {
  final String planId;
  const GetTestCasesForPlanEvent(this.planId);

  @override
  List<Object?> get props => [planId];
}

class CreateTestCaseEvent extends TestPlanEvent {
  final TestCaseEntity testCase;
  const CreateTestCaseEvent(this.testCase);

  @override
  List<Object?> get props => [testCase];
}

class UpdateTestCaseEvent extends TestPlanEvent {
  final TestCaseEntity testCase;
  const UpdateTestCaseEvent(this.testCase);

  @override
  List<Object?> get props => [testCase];
}

class DeleteTestCaseEvent extends TestPlanEvent {
  final String id;
  const DeleteTestCaseEvent(this.id);

  @override
  List<Object?> get props => [id];
}
