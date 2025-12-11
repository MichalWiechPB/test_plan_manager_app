import 'package:dartz/dartz.dart';

import '../../../features/test_step_list/domain/repository/test_step_repository.dart';
import '../../../features/test_plan_list/domain/repositories/test_case_repository.dart';
import '../../error/failures.dart';

class RecalculateTestCaseProgress {
  final TestStepRepository stepRepo;
  final TestCaseRepository caseRepo;

  RecalculateTestCaseProgress({
    required this.stepRepo,
    required this.caseRepo,
  });

  Future<Either<Failure, void>> call(String testCaseId) async {
    final stepsStream = stepRepo.getStepsForCase(testCaseId);

    final stepsResult = await stepsStream.first;

    return stepsResult.fold(
          (failure) => Left(failure),
          (steps) async {
        if (steps.isEmpty) {
          return await caseRepo.updateStepsAndStatus(
            testCaseId,
            0,
            0,
            'NotRun',
          );
        }

        final total = steps.length;
        final passed = steps.where((s) => s.status == 'Passed').length;
        final failed = steps.where((s) => s.status == 'Failed').length;
        final blocked = steps.where((s) => s.status == 'Blocked').length;

        String status;

        if (passed == total) {
          status = 'Passed';
        } else if (failed > 0) {
          status = 'Failed';
        } else if (blocked > 0) {
          status = 'Blocked';
        } else if (passed > 0) {
          status = 'InProgress';
        } else {
          status = 'NotRun';
        }

        return await caseRepo.updateStepsAndStatus(
          testCaseId,
          total,
          passed,
          status,
        );
      },
    );
  }
}
