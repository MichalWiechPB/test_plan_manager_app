import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_plan_manager_app/features/test_plan_list/domain/entities/test_case.dart';

part 'test_plan_state.freezed.dart';

@freezed
sealed class TestPlanState with _$TestPlanState {
  const factory TestPlanState.initial() = TestPlanInitial;

  const factory TestPlanState.loading() = TestPlanLoading;

  const factory TestPlanState.success({
    required List<TestCaseEntity> testCases,
  }) = TestPlanSuccess;

  const factory TestPlanState.failure({
    required String errorMessage,
  }) = TestPlanFailure;
}
