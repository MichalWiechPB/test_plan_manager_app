import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../core/error/failures.dart';
import '../../domain/entities/test_case.dart';
import '../../domain/repositories/test_plan_repository.dart';
import 'package:test_plan_manager_app/database/daos/test_cases_dao.dart';
import 'package:test_plan_manager_app/database/drift_database/data.dart';
import '../models/dtos/test_case_dto.dart';

class TestPlanRepositoryImpl implements TestPlanRepository {
  final TestCasesDao dao;

  TestPlanRepositoryImpl(this.dao);

  @override
  Future<Either<Failure, List<TestCaseEntity>>> getCasesForPlan(String planId) async {
    try {
      final testCases = await dao.getCasesForPlan(planId);
      return Right(testCases.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseFailure('Błąd pobierania test case\'ów: $e'));
    }
  }

  @override
  Future<Either<Failure, TestCaseEntity?>> getCaseById(String id) async {
    try {
      final result = await dao.getCaseById(id);
      return Right(result?.toEntity());
    } catch (e) {
      return Left(DatabaseFailure("Błąd pobierania test case o ID $id: $e"));
    }
  }

  @override
  Future<Either<Failure, void>> createTestCase(TestCaseEntity testCase) async {
    try {
      await dao.insertTestCase(
        TestCasesCompanion.insert(
          id: testCase.id,
          planId: testCase.planId,
          title: testCase.title,
          status: testCase.status,
          expectedResult: drift.Value(testCase.expectedResult),
          assignedToUserId: drift.Value(testCase.assignedToUserId),
          lastModifiedUtc: drift.Value(testCase.lastModifiedUtc),
          parentCaseId: drift.Value(testCase.parentCaseId),
          totalSteps: drift.Value(testCase.totalSteps),
          passedSteps: drift.Value(testCase.passedSteps),
        ),
      );
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Błąd tworzenia test case\'a: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateTestCase(TestCaseEntity testCase) async {
    try {
      await dao.updateTestCase(
        TestCasesCompanion(
          id: drift.Value(testCase.id),
          planId: drift.Value(testCase.planId),
          title: drift.Value(testCase.title),
          status: drift.Value(testCase.status),
          expectedResult: drift.Value(testCase.expectedResult),
          assignedToUserId: drift.Value(testCase.assignedToUserId),
          lastModifiedUtc: drift.Value(testCase.lastModifiedUtc),
          parentCaseId: drift.Value(testCase.parentCaseId),
          totalSteps: drift.Value(testCase.totalSteps),
          passedSteps: drift.Value(testCase.passedSteps),
        ),
      );
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Błąd aktualizacji test case\'a: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTestCase(String id) async {
    try {
      await dao.deleteTestCase(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Błąd usuwania test case\'a: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateStepsAndStatus(
      String id,
      int total,
      int passed,
      String status,
      ) async {
    try {
      await dao.updateStepsAndStatus(id, total, passed, status);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Błąd updateStepsAndStatus: $e"));
    }
  }
}
