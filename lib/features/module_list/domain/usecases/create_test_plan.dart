import 'package:dartz/dartz.dart';
import '../../domain/entities/test_plan.dart';
import '../../domain/repository/module_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class CreateTestPlan implements UseCase<void, CreateTestPlanParams> {
  final ModuleRepository repository;
  CreateTestPlan(this.repository);

  @override
  Future<Either<Failure, void>> call(CreateTestPlanParams p) =>
      repository.createTestPlan(p.plan);
}

class CreateTestPlanParams {
  final TestPlanEntity plan;
  CreateTestPlanParams(this.plan);
}
