import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/project_repository.dart';

class DeleteProject implements UseCase<void, DeleteProjectParams> {
  final ProjectRepository repository;

  DeleteProject(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteProjectParams params) async {
    return await repository.deleteProject(params.id);
  }
}

class DeleteProjectParams {
  final String id;
  DeleteProjectParams(this.id);
}
