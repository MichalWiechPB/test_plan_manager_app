import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/impl/recalculate_testcase_progress.dart';
import '../../domain/usecases/get_teststeps_for_case.dart';
import '../../domain/usecases/create_test_step.dart';
import '../../domain/usecases/update_test_step.dart';
import '../../domain/usecases/delete_test_step.dart';
import '../../domain/usecases/update_test_step_order.dart';

import 'test_case_event.dart';
import 'test_case_state.dart';

class TestStepBloc extends Bloc<TestStepEvent, TestStepState> {
  final GetTestStepsForCase getTestStepsForCase;
  final CreateTestStep createTestStep;
  final UpdateTestStep updateTestStep;
  final DeleteTestStep deleteTestStep;
  final UpdateTestStepOrder updateTestStepOrder;
  final RecalculateTestCaseProgress recalcProgress;

  TestStepBloc({
    required this.getTestStepsForCase,
    required this.createTestStep,
    required this.updateTestStep,
    required this.deleteTestStep,
    required this.updateTestStepOrder,
    required this.recalcProgress,
  }) : super(const TestStepState.initial()) {
    on<GetTestStepsForCaseEvent>(_onGet);
    on<CreateTestStepEvent>(_onCreate);
    on<UpdateTestStepEvent>(_onUpdate);
    on<DeleteTestStepEvent>(_onDelete);
    on<ReorderTestStepsEvent>(_onReorder);
  }

  Future<void> _onGet(
      GetTestStepsForCaseEvent event,
      Emitter<TestStepState> emit,
      ) async {
    emit(state.copyWith(status: TestStepStatus.loading));

    final result = await getTestStepsForCase(event.testCaseId);
    result.fold(
          (failure) => emit(state.copyWith(
        status: TestStepStatus.failure,
        errorMessage: failure.message,
      )),
          (steps) => emit(state.copyWith(
        status: TestStepStatus.success,
        steps: steps,
      )),
    );
  }

  Future<void> _onCreate(
      CreateTestStepEvent event,
      Emitter<TestStepState> emit,
      ) async {
    final result = await createTestStep(event.step);

    await result.fold(
          (failure) async => emit(state.copyWith(errorMessage: failure.message)),
          (_) async {
        final updated = [...state.steps, event.step]..sort((a, b) => a.stepNumber.compareTo(b.stepNumber));
        emit(state.copyWith(steps: updated));

        await recalcProgress(event.step.testCaseId);
      },
    );
  }

  Future<void> _onUpdate(
      UpdateTestStepEvent event,
      Emitter<TestStepState> emit,
      ) async {
    final result = await updateTestStep(event.step);

    await result.fold(
          (failure) async => emit(state.copyWith(errorMessage: failure.message)),
          (_) async {
        final updated = [
          for (final s in state.steps) if (s.id == event.step.id) event.step else s
        ];
        emit(state.copyWith(steps: updated));

        await recalcProgress(event.step.testCaseId);
      },
    );
  }

  Future<void> _onDelete(
      DeleteTestStepEvent event,
      Emitter<TestStepState> emit,
      ) async {
    final result = await deleteTestStep(event.stepId);

    await result.fold(
          (failure) async => emit(state.copyWith(errorMessage: failure.message)),
          (_) async {
        final newSteps = state.steps.where((s) => s.id != event.stepId).toList();

        final renumbered = [
          for (int i = 0; i < newSteps.length; i++)
            newSteps[i].copyWith(stepNumber: i + 1)
        ];

        emit(state.copyWith(steps: renumbered));
        await updateTestStepOrder(renumbered);

        if (renumbered.isNotEmpty) {
          await recalcProgress(renumbered.first.testCaseId);
        }
      },
    );
  }

  Future<void> _onReorder(
      ReorderTestStepsEvent event,
      Emitter<TestStepState> emit,
      ) async {
    final result = await updateTestStepOrder(event.reorderedSteps);

    await result.fold(
          (failure) async => emit(state.copyWith(errorMessage: failure.message)),
          (_) async {
        emit(state.copyWith(steps: event.reorderedSteps));
        await recalcProgress(event.reorderedSteps.first.testCaseId);
      },
    );
  }
}
