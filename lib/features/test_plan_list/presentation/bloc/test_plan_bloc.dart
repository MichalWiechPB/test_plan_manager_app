import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/core/error/failures.dart';
import 'package:test_plan_manager_app/features/test_plan_list/domain/entities/test_case.dart';
import '../../domain/usecases/create_test_case.dart';
import '../../domain/usecases/update_test_case.dart';
import '../../domain/usecases/delete_test_case.dart';
import '../../domain/usecases/get_test_cases_for_plan.dart';
import 'test_plan_event.dart';
import 'test_plan_state.dart';

class TestPlanBloc extends Bloc<TestPlanEvent, TestPlanState> {
  final GetTestCasesForPlan getTestCasesForPlan;
  final CreateTestCase createTestCase;
  final UpdateTestCase updateTestCase;
  final DeleteTestCase deleteTestCase;

  StreamSubscription<Either<Failure, List<TestCaseEntity>>>?
  _testCasesSubscription;

  TestPlanBloc({
    required this.getTestCasesForPlan,
    required this.createTestCase,
    required this.updateTestCase,
    required this.deleteTestCase,
  }) : super(const TestPlanState.initial()) {
    on<GetTestCasesForPlanEvent>(_onGetTestCasesForPlan);
    on<CreateTestCaseEvent>(_onCreateTestCase);
    on<UpdateTestCaseEvent>(_onUpdateTestCase);
    on<DeleteTestCaseEvent>(_onDeleteTestCase);
  }

  Future<void> _onGetTestCasesForPlan(
      GetTestCasesForPlanEvent event,
      Emitter<TestPlanState> emit,
      ) async {
    emit(const TestPlanState.loading());

    await emit.forEach(
      getTestCasesForPlan(PlanIdParams(event.planId)),
      onData: (either) => either.fold(
            (failure) => TestPlanState.failure(
          errorMessage: failure.message ?? 'Wystąpił nieznany błąd',
        ),
            (cases) => TestPlanState.success(testCases: cases),
      ),
    );
  }


  Future<void> _onCreateTestCase(
      CreateTestCaseEvent event,
      Emitter<TestPlanState> emit,
      ) async {
    await createTestCase(
      CreateTestCaseParams(event.testCase),
    );

    add(
      TestPlanEvent.getTestCasesForPlan(
        planId: event.testCase.planId,
      ),
    );
  }

  Future<void> _onUpdateTestCase(
      UpdateTestCaseEvent event,
      Emitter<TestPlanState> emit,
      ) async {
    await updateTestCase(
      UpdateTestCaseParams(event.testCase),
    );

    add(
      TestPlanEvent.getTestCasesForPlan(
        planId: event.testCase.planId,
      ),
    );
  }

  Future<void> _onDeleteTestCase(
      DeleteTestCaseEvent event,
      Emitter<TestPlanState> emit,
      ) async {
    final planId = state.maybeWhen(
      success: (cases) => cases.isNotEmpty ? cases.first.planId : null,
      orElse: () => null,
    );

    await deleteTestCase(
      DeleteTestCaseParams(event.id),
    );

    if (planId != null) {
      add(
        TestPlanEvent.getTestCasesForPlan(
          planId: planId,
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    await _testCasesSubscription?.cancel();
    return super.close();
  }
}
