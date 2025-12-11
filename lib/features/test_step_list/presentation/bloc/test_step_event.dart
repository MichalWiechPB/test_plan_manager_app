import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/test_step.dart';

part 'test_step_event.freezed.dart';

@freezed
sealed class TestStepEvent with _$TestStepEvent {
  const factory TestStepEvent.getTestStepsForCase({
    required String testCaseId,
  }) = GetTestStepsForCaseEvent;

  const factory TestStepEvent.createTestStep({
    required TestStepEntity step,
  }) = CreateTestStepEvent;

  const factory TestStepEvent.updateTestStep({
    required TestStepEntity step,
  }) = UpdateTestStepEvent;

  const factory TestStepEvent.deleteTestStep({
    required String stepId,
    required String testCaseId,
  }) = DeleteTestStepEvent;

  const factory TestStepEvent.reorderTestSteps({
    required List<TestStepEntity> reorderedSteps,
    required String testCaseId,
  }) = ReorderTestStepsEvent;
}
