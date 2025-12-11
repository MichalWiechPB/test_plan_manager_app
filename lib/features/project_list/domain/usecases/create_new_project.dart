import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/project.dart';
import '../repository/project_repository.dart';

class CreateProject implements UseCase<void, CreateProjectParams> {
  final ProjectRepository repository;
  CreateProject(this.repository);

  @override
  Future<Either<Failure, void>> call(CreateProjectParams params) {
    return repository.createProject(params.project);
  }
}

class CreateProjectParams {
  final ProjectEntity project;
  CreateProjectParams(this.project);
}
