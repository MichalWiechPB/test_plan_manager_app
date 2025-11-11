import 'package:dartz/dartz.dart';
import '../../domain/entities/module.dart';
import '../../domain/repository/module_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class CreateModule implements UseCase<void, CreateModuleParams> {
  final ModuleRepository repository;
  CreateModule(this.repository);

  @override
  Future<Either<Failure, void>> call(CreateModuleParams p) =>
      repository.createModule(p.module);
}

class CreateModuleParams {
  final ModuleEntity module;
  CreateModuleParams(this.module);
}
