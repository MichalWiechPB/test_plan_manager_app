import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/streamusecase.dart';
import '../entities/test_case.dart';
import '../repositories/test_case_repository.dart';

class GetTestCasesForPlan
    extends StreamUseCase<Either<Failure, List<TestCaseEntity>>, PlanIdParams> {
  final TestCaseRepository repository;

  GetTestCasesForPlan(this.repository);

  @override
  Stream<Either<Failure, List<TestCaseEntity>>> call(PlanIdParams params) {
    return repository.getCasesForPlan(params.planId);
  }
}

class PlanIdParams {
  final String planId;
  PlanIdParams(this.planId);
}
