import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/test_step.dart';

part 'test_step_state.freezed.dart';

@freezed
sealed class TestStepState with _$TestStepState {
  const factory TestStepState.initial() = TestStepInitial;

  const factory TestStepState.loading() = TestStepLoading;

  const factory TestStepState.success({
    required List<TestStepEntity> steps,
  }) = TestStepSuccess;

  const factory TestStepState.failure({
    required String errorMessage,
  }) = TestStepFailure;
}
