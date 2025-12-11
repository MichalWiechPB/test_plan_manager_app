import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/project.dart';
import '../repository/project_repository.dart';

class UpdateProject implements UseCase<void, UpdateProjectParams> {
  final ProjectRepository repository;

  UpdateProject(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateProjectParams params) async {
    return await repository.updateProject(params.project);
  }
}

class UpdateProjectParams {
  final ProjectEntity project;
  UpdateProjectParams(this.project);
}
