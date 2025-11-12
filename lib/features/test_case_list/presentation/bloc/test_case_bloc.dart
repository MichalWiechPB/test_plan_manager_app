import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/test_step.dart';
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

  TestStepBloc({
    required this.getTestStepsForCase,
    required this.createTestStep,
    required this.updateTestStep,
    required this.deleteTestStep,
    required this.updateTestStepOrder,
  }) : super(const TestStepState.initial()) {
    on<GetTestStepsForCaseEvent>(_onGetTestStepsForCase);
    on<CreateTestStepEvent>(_onCreateTestStep);
    on<UpdateTestStepEvent>(_onUpdateTestStep);
    on<DeleteTestStepEvent>(_onDeleteTestStep);
    on<ReorderTestStepsEvent>(_onReorderTestSteps);
  }

  Future<void> _onGetTestStepsForCase(
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

  Future<void> _onCreateTestStep(
      CreateTestStepEvent event,
      Emitter<TestStepState> emit,
      ) async {
    final result = await createTestStep(event.step);
    result.fold(
          (failure) => emit(state.copyWith(errorMessage: failure.message)),
          (_) {
        final updatedSteps = List<TestStepEntity>.from(state.steps)
          ..add(event.step)
          ..sort((a, b) => a.stepNumber.compareTo(b.stepNumber));
        emit(state.copyWith(steps: updatedSteps, status: TestStepStatus.success));
      },
    );
  }

  Future<void> _onUpdateTestStep(
      UpdateTestStepEvent event,
      Emitter<TestStepState> emit,
      ) async {
    final result = await updateTestStep(event.step);
    result.fold(
          (failure) => emit(state.copyWith(errorMessage: failure.message)),
          (_) {
        final updatedSteps = state.steps.map((s) {
          return s.id == event.step.id ? event.step : s;
        }).toList();
        emit(state.copyWith(steps: updatedSteps, status: TestStepStatus.success));
      },
    );
  }

  Future<void> _onDeleteTestStep(
      DeleteTestStepEvent event,
      Emitter<TestStepState> emit,
      ) async {
    final result = await deleteTestStep(event.stepId);
    result.fold(
          (failure) => emit(state.copyWith(errorMessage: failure.message)),
          (_) {
        final updated = state.steps
            .where((s) => s.id != event.stepId)
            .toList();

        final renumbered = [
          for (int i = 0; i < updated.length; i++)
            updated[i].copyWith(stepNumber: i + 1)
        ];

        emit(state.copyWith(steps: renumbered, status: TestStepStatus.success));

        // aktualizacja w bazie
        updateTestStepOrder(renumbered);
      },
    );
  }

  Future<void> _onReorderTestSteps(
      ReorderTestStepsEvent event,
      Emitter<TestStepState> emit,
      ) async {
    // 🔹 zapis nowej kolejności
    final result = await updateTestStepOrder(event.reorderedSteps);

    result.fold(
          (failure) => emit(state.copyWith(errorMessage: failure.message)),
          (_) => emit(state.copyWith(
        steps: event.reorderedSteps,
        status: TestStepStatus.success,
      )),
    );
  }
}
