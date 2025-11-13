import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/test_case.dart';
import '../repositories/test_plan_repository.dart';

// Params
class TestCaseIdParams {
  final String id;
  const TestCaseIdParams(this.id);
}

class GetTestCaseById implements UseCase<TestCaseEntity?, TestCaseIdParams> {
  final TestPlanRepository repository;

  GetTestCaseById(this.repository);

  @override
  Future<Either<Failure, TestCaseEntity?>> call(TestCaseIdParams params) {
    return repository.getCaseById(params.id);
  }
}
