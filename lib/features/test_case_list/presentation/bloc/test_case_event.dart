import 'package:equatable/equatable.dart';
import '../../domain/entities/test_step.dart';

abstract class TestStepEvent extends Equatable {
  const TestStepEvent();

  @override
  List<Object?> get props => [];
}

class GetTestStepsForCaseEvent extends TestStepEvent {
  final String testCaseId;
  const GetTestStepsForCaseEvent(this.testCaseId);
  @override
  List<Object?> get props => [testCaseId];
}

class CreateTestStepEvent extends TestStepEvent {
  final TestStepEntity step;
  const CreateTestStepEvent(this.step);
  @override
  List<Object?> get props => [step];
}

class UpdateTestStepEvent extends TestStepEvent {
  final TestStepEntity step;
  const UpdateTestStepEvent(this.step);
  @override
  List<Object?> get props => [step];
}

class DeleteTestStepEvent extends TestStepEvent {
  final String stepId;
  final String testCaseId;
  const DeleteTestStepEvent(this.stepId, this.testCaseId);
  @override
  List<Object?> get props => [stepId, testCaseId];
}
class ReorderTestStepsEvent extends TestStepEvent {
  final List<TestStepEntity> reorderedSteps;

  const ReorderTestStepsEvent(this.reorderedSteps);

  @override
  List<Object?> get props => [reorderedSteps];
}
