import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/test_plan_repository.dart';

class DeleteTestCase implements UseCase<void, DeleteTestCaseParams> {
  final TestPlanRepository repository;
  DeleteTestCase(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteTestCaseParams p) =>
      repository.deleteTestCase(p.id);
}

class DeleteTestCaseParams {
  final String id;
  DeleteTestCaseParams(this.id);
}
