import 'package:dartz/dartz.dart';
import '../../domain/entities/module.dart';
import '../../domain/repository/module_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class UpdateModule implements UseCase<void, UpdateModuleParams> {
  final ModuleRepository repository;
  UpdateModule(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateModuleParams p) =>
      repository.updateModule(p.module);
}

class UpdateModuleParams {
  final ModuleEntity module;
  UpdateModuleParams(this.module);
}
