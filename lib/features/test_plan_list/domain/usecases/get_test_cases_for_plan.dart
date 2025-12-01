import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/streamusecase.dart';
import '../entities/test_case.dart';
import '../repositories/test_case_repository.dart';
import '../../../test_step_list/domain/repository/test_step_repository.dart';

class GetTestCasesForPlan
    extends StreamUseCase<Either<Failure, List<TestCaseEntity>>, PlanIdParams> {
  final TestCaseRepository testCaseRepo;
  final TestStepRepository stepRepo;

  GetTestCasesForPlan(this.testCaseRepo, this.stepRepo);

  @override
  Stream<Either<Failure, List<TestCaseEntity>>> call(PlanIdParams params) {
    return testCaseRepo.getCasesForPlan(params.planId).asyncMap(
          (eitherCases) async {
        return eitherCases.fold(
              (f) => left(f),
              (cases) => _mergeStepsAndStatus(cases),
        );
      },
    );
  }

  Future<Either<Failure, List<TestCaseEntity>>> _mergeStepsAndStatus(
      List<TestCaseEntity> cases,
      ) async {
    final output = <TestCaseEntity>[];

    for (final c in cases) {
      final stepsEither = await stepRepo.getStepsForCaseOnce(c.id);

      if (stepsEither.isLeft()) {
        output.add(
          TestCaseEntity(
            id: c.id,
            planId: c.planId,
            title: c.title,
            expectedResult: c.expectedResult,
            status: "NotRun",
            assignedToUserId: c.assignedToUserId,
            lastModifiedUtc: c.lastModifiedUtc,
            parentCaseId: c.parentCaseId,
            totalSteps: 0,
            passedSteps: 0,
          ),
        );
        continue;
      }

      final steps = stepsEither.getOrElse(() => []);
      final total = steps.length;
      final passed = steps.where((s) => s.status == "Passed").length;

      String status;

      if (total == 0) {
        status = "NotRun";
      } else if (passed == total) {
        status = "Passed";
      } else if (steps.any((s) => s.status == "Failed")) {
        status = "Failed";
      } else {
        status = "Pending";
      }

      output.add(
        TestCaseEntity(
          id: c.id,
          planId: c.planId,
          title: c.title,
          expectedResult: c.expectedResult,
          status: status,
          assignedToUserId: c.assignedToUserId,
          lastModifiedUtc: c.lastModifiedUtc,
          parentCaseId: c.parentCaseId,
          totalSteps: total,
          passedSteps: passed,
        ),
      );
    }

    return right(output);
  }
}

class PlanIdParams {
  final String planId;
  PlanIdParams(this.planId);
}
