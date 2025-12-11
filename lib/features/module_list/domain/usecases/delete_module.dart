import 'package:dartz/dartz.dart';
import '../../domain/repository/module_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class DeleteModule implements UseCase<void, DeleteModuleParams> {
  final ModuleRepository repository;
  DeleteModule(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteModuleParams p) =>
      repository.deleteModule(p.id);
}

class DeleteModuleParams {
  final String id;
  DeleteModuleParams(this.id);
}
