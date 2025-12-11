import 'package:dartz/dartz.dart';
import '../../domain/repository/module_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class DeleteTestPlan implements UseCase<void, DeleteTestPlanParams> {
  final ModuleRepository repository;
  DeleteTestPlan(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteTestPlanParams p) =>
      repository.deleteTestPlan(p.id);
}

class DeleteTestPlanParams {
  final String id;
  DeleteTestPlanParams(this.id);
}
