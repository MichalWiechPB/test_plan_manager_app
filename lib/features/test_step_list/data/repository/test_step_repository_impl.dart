import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../database/datasources/teststep/local/teststep_local_datasource.dart';
import '../../../../database/datasources/teststep/remote/teststep_remote_datasource.dart';
import '../../../../database/drift_database/mappers/teststep_mapper.dart';
import '../../domain/entities/test_step.dart';
import '../../domain/repository/test_step_repository.dart';

class TestStepRepositoryImpl implements TestStepRepository {
  final TestStepLocalDataSource local;
  final TestStepRemoteDataSource remote;

  TestStepRepositoryImpl({required this.local, required this.remote});

  @override
  Stream<Either<Failure, List<TestStepEntity>>> getStepsForCase(
    String caseId,
  ) async* {
    final localResult = await local.getTestStepsForCase(caseId);

    if (localResult.isRight()) {
      yield Right(
        localResult.getOrElse(() => []).map((row) => row.toEntity()).toList(),
      );
    }
    try {
      final remoteDtos = await remote.fetchStepsForCase(caseId);

      for (final dto in remoteDtos) {
        await local.upsertTestStep(dto.toDbModel());
      }

      final refreshed = await local.getTestStepsForCase(caseId);

      yield refreshed.map((rows) => rows.map((e) => e.toEntity()).toList());
    } catch (e) {
      yield Left(DatabaseFailure('Nie udało się zsynchronizować kroków: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> createTestStep(TestStepEntity step) async {
    try {
      await local.upsertTestStep(step.toDbModel());
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Nie udało się utworzyć kroku: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateTestStep(TestStepEntity step) async {
    try {
      await local.upsertTestStep(step.toDbModel());
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Nie udało się zaktualizować kroku: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTestStep(String id) async {
    try {
      await local.deleteTestStep(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Nie udało się usunąć kroku: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateTestStepOrder(
    List<TestStepEntity> steps,
  ) async {
    try {
      await local.updateTestStepOrder(steps.map((s) => s.toDbModel()).toList());
      return const Right(null);
    } catch (e) {
      return Left(
        DatabaseFailure('Nie udało się zmienić kolejności kroków: $e'),
      );
    }
  }
}
