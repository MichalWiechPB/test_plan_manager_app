import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/test_case.dart';

part 'test_plan_event.freezed.dart';

@freezed
sealed class TestPlanEvent with _$TestPlanEvent {
  const factory TestPlanEvent.getTestCasesForPlan({
    required String planId,
  }) = GetTestCasesForPlanEvent;

  const factory TestPlanEvent.createTestCase({
    required TestCaseEntity testCase,
  }) = CreateTestCaseEvent;

  const factory TestPlanEvent.updateTestCase({
    required TestCaseEntity testCase,
  }) = UpdateTestCaseEvent;

  const factory TestPlanEvent.deleteTestCase({
    required String id,
  }) = DeleteTestCaseEvent;
}
