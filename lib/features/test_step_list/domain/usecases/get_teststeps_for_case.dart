import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/core/error/failures.dart';
import 'package:test_plan_manager_app/features/test_step_list/domain/entities/test_step.dart';
import 'package:test_plan_manager_app/features/test_step_list/domain/repository/test_step_repository.dart';

class GetTestStepsForCase {
  final TestStepRepository repository;
  GetTestStepsForCase(this.repository);

  Stream<Either<Failure, List<TestStepEntity>>> call(String caseId) {
    return repository.getStepsForCase(caseId);
  }
}
