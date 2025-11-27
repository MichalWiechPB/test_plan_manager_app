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
        localResult
            .getOrElse(() => [])
            .map((row) => row.toEntity())
            .toList(),
      );
    }

    try {
      final remoteDtos = await remote.fetchTestCasesForPlan(planId);
      for (final dto in remoteDtos) {
        await local.upsertTestCase(dto.toDbModel());
      }
      final refreshed = await local.getCasesForPlan(planId);
      yield refreshed.map((rows) => rows.map((e) => e.toEntity()).toList());
    } catch (e) {
      yield Left(DatabaseFailure("Błąd pobierania z remote: $e"));
    }
  }

  @override
  Future<Either<Failure, void>> createTestCase(TestCaseEntity testCase) async {
    final result = await local.createTestCase(testCase.toDbModel());
    return result;
  }

  @override
  Future<Either<Failure, void>> updateTestCase(TestCaseEntity testCase) async {
    final result = await local.updateTestCase(testCase.toDbModel());
    return result;
  }

  @override
  Future<Either<Failure, void>> deleteTestCase(String id) async {
    return local.deleteTestCase(id);
  }

  @override
  Future<Either<Failure, void>> updateStepsAndStatus(
      String id,
      int totalSteps,
      int passedSteps,
      String status,
      ) async {
    return local.updateStepsAndStatus(id, totalSteps, passedSteps, status);
  }
}
