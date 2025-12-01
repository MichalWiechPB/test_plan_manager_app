import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/core/error/failures.dart';
import 'package:test_plan_manager_app/features/test_plan_list/domain/entities/test_case.dart';
import 'package:test_plan_manager_app/features/test_plan_list/domain/repositories/test_case_repository.dart';

class UpdateStepsAndStatusUseCase {
  final TestCaseRepository repo;

  UpdateStepsAndStatusUseCase(this.repo);

  Future<Either<Failure, TestCaseEntity>> call(
      TestCaseEntity entity,
      int total,
      int passed,
      String status,
      ) async {
    final updated = TestCaseEntity(
      id: entity.id,
      planId: entity.planId,
      title: entity.title,
      status: status,
      expectedResult: entity.expectedResult,
      assignedToUserId: entity.assignedToUserId,
      lastModifiedUtc: entity.lastModifiedUtc,
      parentCaseId: entity.parentCaseId,
      totalSteps: total,
      passedSteps: passed,
    );

    return repo.updateTestCase(updated);
  }
}
