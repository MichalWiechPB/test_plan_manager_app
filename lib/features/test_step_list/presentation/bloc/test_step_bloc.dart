import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_plan_manager_app/features/test_step_list/domain/entities/test_step.dart';
import '../../../../core/usecases/impl/recalculate_testcase_progress.dart';
import '../../domain/usecases/get_teststeps_for_case.dart';
import '../../domain/usecases/create_test_step.dart';
import '../../domain/usecases/update_test_step.dart';
import '../../domain/usecases/delete_test_step.dart';
import '../../domain/usecases/update_test_step_order.dart';
import 'test_step_event.dart';
import 'test_step_state.dart';

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
    emit(const TestStepState.loading());

    (await getTestStepsForCase(event.testCaseId)).fold(
          (f) => emit(TestStepState.failure(errorMessage: f.message ?? 'Błąd pobierania kroków')),
          (steps) => emit(TestStepState.success(steps: steps)),
    );
  }

  Future<void> _onCreate(
      CreateTestStepEvent event,
      Emitter<TestStepState> emit,
      ) async {
    (await createTestStep(event.step)).fold(
          (f) => emit(TestStepState.failure(errorMessage: f.message ?? 'Nie udało się dodać kroku')),
          (_) async {
        final current = state.maybeWhen<List<TestStepEntity>>(
          success: (steps) => steps,
          orElse: () => const [],
        );

        final newList = [...current, event.step]
          ..sort((a, b) => a.stepNumber.compareTo(b.stepNumber));

        emit(TestStepState.success(steps: newList));
        await recalcProgress(event.step.testCaseId);
      },
    );
  }

  Future<void> _onUpdate(
      UpdateTestStepEvent event,
      Emitter<TestStepState> emit,
      ) async {
    (await updateTestStep(event.step)).fold(
          (f) => emit(TestStepState.failure(errorMessage: f.message ?? 'Nie udało się zaktualizować kroku')),
          (_) async {
        final updated = state.maybeWhen<List<TestStepEntity>>(
          success: (steps) => [
            for (final s in steps) s.id == event.step.id ? event.step : s,
          ],
          orElse: () => const [],
        );

        emit(TestStepState.success(steps: updated));
        await recalcProgress(event.step.testCaseId);
      },
    );
  }

  Future<void> _onDelete(
      DeleteTestStepEvent event,
      Emitter<TestStepState> emit,
      ) async {
    (await deleteTestStep(event.stepId)).fold(
          (f) => emit(TestStepState.failure(errorMessage: f.message ?? 'Nie udało się usunąć kroku')),
          (_) async {
        final filtered = state.maybeWhen<List<TestStepEntity>>(
          success: (steps) => steps.where((s) => s.id != event.stepId).toList(),
          orElse: () => const [],
        );

        final renumbered = [
          for (int i = 0; i < filtered.length; i++)
            filtered[i].copyWith(stepNumber: i + 1),
        ];

        emit(TestStepState.success(steps: renumbered));

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
    (await updateTestStepOrder(event.reorderedSteps)).fold(
          (f) => emit(TestStepState.failure(errorMessage: f.message ?? 'Nie udało się zmienić kolejności')),
          (_) async {
        emit(TestStepState.success(steps: event.reorderedSteps));
        await recalcProgress(event.reorderedSteps.first.testCaseId);
      },
    );
  }
}
