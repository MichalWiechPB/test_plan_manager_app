import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart' as drift;
import 'package:test_plan_manager_app/features/project_list/data/models/dtos/project_dto.dart';
import '../../../../core/error/failures.dart';
import '../../../../database/data.dart';
import '../../../../database/daos/project_dao.dart';
import '../../domain/entities/project.dart';
import '../../domain/repository/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectDao dao;

  ProjectRepositoryImpl(this.dao);

  @override
  Future<Either<Failure, List<ProjectEntity>>> getAllProjects() async {
    try {
      final result = await dao.getAllProjects();
      final entities = result.map((p) => p.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(DatabaseFailure('Błąd pobierania projektów: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> createProject(ProjectEntity project) async {
    try {
      await dao.insertProject(
        ProjectsCompanion.insert(
          id: project.id,
          name: project.name,
          description: (project.description != null &&
              project.description!.trim().isNotEmpty)
              ? drift.Value(project.description!)
              : const drift.Value(null),
          createdAtUtc: drift.Value(project.createdAtUtc),
        ),
      );
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Błąd tworzenia projektu: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateProject(ProjectEntity project) async {
    try {
      await dao.updateProject(
        ProjectsCompanion(
          id: drift.Value(project.id),
          name: drift.Value(project.name),
          description: drift.Value(project.description ?? ''),
          createdAtUtc: drift.Value(project.createdAtUtc),
        ),
      );
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Błąd aktualizacji projektu: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProject(String id) async {
    try {
      await dao.deleteProject(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Błąd usuwania projektu: $e'));
    }
  }
}
