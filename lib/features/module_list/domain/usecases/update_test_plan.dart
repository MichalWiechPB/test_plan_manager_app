import 'package:dartz/dartz.dart';
import '../../domain/entities/test_plan.dart';
import '../../domain/repository/module_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class UpdateTestPlan implements UseCase<void, UpdateTestPlanParams> {
  final ModuleRepository repository;
  UpdateTestPlan(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateTestPlanParams p) =>
      repository.updateTestPlan(p.plan);
}

class UpdateTestPlanParams {
  final TestPlanEntity plan;
  UpdateTestPlanParams(this.plan);
}
