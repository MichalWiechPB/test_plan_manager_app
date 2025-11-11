import 'package:bloc/bloc.dart';
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
    emit(state.copyWith(status: TestPlanStatus.loading));

    final result = await getTestCasesForPlan(PlanIdParams(event.planId));

    result.fold(
          (failure) => emit(state.copyWith(
        status: TestPlanStatus.failure,
        errorMessage: failure.message ?? 'Nie udało się pobrać test case\'ów',
      )),
          (cases) => emit(state.copyWith(
        status: TestPlanStatus.success,
        testCases: cases,
      )),
    );
  }

  Future<void> _onCreateTestCase(
      CreateTestCaseEvent event,
      Emitter<TestPlanState> emit,
      ) async {
    await createTestCase(CreateTestCaseParams(event.testCase));
    add(GetTestCasesForPlanEvent(event.testCase.planId));
  }

  Future<void> _onUpdateTestCase(
      UpdateTestCaseEvent event,
      Emitter<TestPlanState> emit,
      ) async {
    await updateTestCase(UpdateTestCaseParams(event.testCase));
    add(GetTestCasesForPlanEvent(event.testCase.planId));
  }

  Future<void> _onDeleteTestCase(
      DeleteTestCaseEvent event,
      Emitter<TestPlanState> emit,
      ) async {
    final currentPlanId = state.testCases.isNotEmpty ? state.testCases.first.planId : '';
    await deleteTestCase(DeleteTestCaseParams(event.id));
    if (currentPlanId.isNotEmpty) {
      add(GetTestCasesForPlanEvent(currentPlanId));
    }
  }
}
