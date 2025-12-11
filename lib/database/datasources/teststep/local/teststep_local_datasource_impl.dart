import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart' as drift;

import '../../../../../core/error/failures.dart';
import '../../../../../database/daos/test_steps_dao.dart';
import '../../../../../database/drift_database/data.dart';
import 'teststep_local_datasource.dart';

class TestStepLocalDataSourceImpl implements TestStepLocalDataSource {
  final TestStepsDao dao;

  TestStepLocalDataSourceImpl(this.dao);

  @override
  Future<Either<Failure, List<TestStep>>> getTestStepsForCase(String testCaseId) async {
    try {
      final rows = await dao.getStepsForCase(testCaseId);
      return Right(rows);
    } catch (e) {
      return Left(DatabaseFailure("Nie udało się pobrać kroków testu: $e"));
    }
  }

  @override
  Future<Either<Failure, void>> createTestStep(TestStepsCompanion step) async {
    try {
      await dao.insertStep(step);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Nie udało się dodać kroku: $e"));
    }
  }

  @override
  Future<Either<Failure, void>> updateTestStep(TestStepsCompanion step) async {
    try {
      await dao.updateStep(step);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Nie udało się zaktualizować kroku: $e"));
    }
  }

  @override
  Future<Either<Failure, void>> upsertTestStep(TestStepsCompanion step) async {
    try {
      await dao.upsertStep(step);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Nie udało się zapisać kroku (upsert): $e"));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTestStep(String id) async {
    try {
      await dao.deleteStep(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Nie udało się usunąć kroku: $e"));
    }
  }

  @override
  Future<Either<Failure, void>> updateTestStepOrder(
      List<TestStepsCompanion> steps,
      ) async {
    try {
      for (final s in steps) {
        await dao.updateStepOrder(
          s.id.value,
          s.stepNumber.value,
        );
      }
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Nie udało się zaktualizować kolejności kroków: $e"));
    }
  }
}
