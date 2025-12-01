import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../database/datasources/testcase/local/testcase_local_datasource.dart';
import '../../../../database/datasources/testcase/remote/testcase_remote_datasource.dart';
import '../../../../database/drift_database/mappers/testcase_mapper.dart';
import '../../domain/entities/test_case.dart';
import '../../domain/repositories/test_case_repository.dart';

class TestCaseRepositoryImpl implements TestCaseRepository {
  final TestCaseLocalDataSource local;
  final TestCasesRemoteDataSource remote;

  TestCaseRepositoryImpl({
    required this.local,
    required this.remote,
  });

  @override
  Stream<Either<Failure, List<TestCaseEntity>>> getCasesForPlan(String planId) async* {
    final localResult = await local.getCasesForPlan(planId);

    if (localResult.isRight()) {
      yield Right(
        localResult.getOrElse(() => []).map((e) => e.toEntity()).toList(),
      );
    }

    try {
      final remoteDtos = await remote.fetchTestCasesForPlan(planId);
      for (final dto in remoteDtos) {
        await local.upsertTestCase(dto.toDbModel());
      }

      final refreshed = await local.getCasesForPlan(planId);
      yield refreshed.map(
            (rows) => rows.map((e) => e.toEntity()).toList(),
      );
    } catch (_) {
      yield Left(
        DatabaseFailure("Nie udało się pobrać TestCase'ów z serwera."),
      );
    }
  }

  @override
  Future<Either<Failure, TestCaseEntity>> createTestCase(
      TestCaseEntity entity,
      ) async {
    try {
      final dto = entity.toDto();
      final createdDto = await remote.createTestCase(dto);
      await local.upsertTestCase(createdDto.toDbModel());
      return Right(createdDto.toEntity());
    } catch (e, s) {
      print("❌ createTestCase repo error:");
      print(e);
      print(s);
      return Left(DatabaseFailure(e.toString()));
    }

  }

  @override
  Future<Either<Failure, TestCaseEntity>> updateTestCase(
      TestCaseEntity entity,
      ) async {
    try {
      final dto = entity.toDto();
      final updatedDto = await remote.updateTestCase(dto);
      await local.upsertTestCase(updatedDto.toDbModel());
      return Right(updatedDto.toEntity());
    } catch (_) {
      return Left(
        DatabaseFailure("Nie udało się zaktualizować TestCase."),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteTestCase(String id) async {
    try {
      await remote.deleteTestCase(id);
      await local.deleteTestCase(id);
      return const Right(null);
    } catch (_) {
      return Left(
        DatabaseFailure("Nie udało się usunąć TestCase."),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateStepsAndStatus(
      String id,
      int totalSteps,
      int passedSteps,
      String status,
      ) {
    return local.updateStepsAndStatus(
      id,
      totalSteps,
      passedSteps,
      status,
    );
  }
}
