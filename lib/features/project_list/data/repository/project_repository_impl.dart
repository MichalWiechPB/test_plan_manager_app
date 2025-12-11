import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../database/datasources/projects/local/projects_local_datasource.dart';
import '../../../../database/datasources/projects/remote/projects_remote_datasource.dart';
import '../../../../database/drift_database/mappers/project_mapper.dart';
import '../../domain/entities/project.dart';
import '../../domain/repository/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectLocalDataSource local;
  final ProjectsRemoteDataSource remote;

  ProjectRepositoryImpl({
    required this.local,
    required this.remote,
  });

  @override
  Stream<Either<Failure, List<ProjectEntity>>> getAllProjects() async* {
    final localResult = await local.getAllProjects();

    if (localResult.isRight()) {
      yield Right(
        localResult.getOrElse(() => []).map((p) => p.toEntity()).toList(),
      );
    }

    try {
      final remoteDtos = await remote.fetchProjects();
      for (final dto in remoteDtos) {
        await local.upsertProject(dto.toDbModel());
      }

      final refreshed = await local.getAllProjects();
      yield refreshed.map((projects) => projects.map((p) => p.toEntity()).toList());
    } catch (e) {
      yield Left(DatabaseFailure("Nie udało się pobrać projektów z serwera."));
    }
  }

  @override
  Future<Either<Failure, ProjectEntity>> createProject(ProjectEntity project) async {
    try {
      final dto = project.toDto();
      final createdDto = await remote.createProject(dto);
      await local.upsertProject(createdDto.toDbModel());
      return Right(createdDto.toEntity());
    } catch (e) {
      return Left(DatabaseFailure("Nie udało się utworzyć projektu."));
    }
  }

  @override
  Future<Either<Failure, ProjectEntity>> updateProject(ProjectEntity project) async {
    try {
      final dto = project.toDto();
      final updatedDto = await remote.updateProject(dto);
      await local.upsertProject(updatedDto.toDbModel());
      return Right(updatedDto.toEntity());
    } catch (e) {
      return Left(DatabaseFailure("Nie udało się zaktualizować projektu."));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProject(String id) async {
    try {
      await remote.deleteProject(id);
      await local.deleteProject(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Nie udało się usunąć projektu."));
    }
  }
}
