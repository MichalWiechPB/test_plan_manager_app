import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/test_case.dart';
import '../repositories/test_plan_repository.dart';

class CreateTestCase implements UseCase<void, CreateTestCaseParams> {
  final TestPlanRepository repository;
  CreateTestCase(this.repository);

  @override
  Future<Either<Failure, void>> call(CreateTestCaseParams p) =>
      repository.createTestCase(p.testCase);
}

class CreateTestCaseParams {
  final TestCaseEntity testCase;
  CreateTestCaseParams(this.testCase);
}
