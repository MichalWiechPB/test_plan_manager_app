import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart' as drift;
import 'package:test_plan_manager_app/database/daos/test_cases_dao.dart';
import 'package:test_plan_manager_app/database/data.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/test_case.dart';
import '../../domain/repositories/test_plan_repository.dart';
import '../models/dtos/test_case_dto.dart';

class TestPlanRepositoryImpl implements TestPlanRepository {
  final TestCasesDao dao;

  TestPlanRepositoryImpl(this.dao);

  @override
  Future<Either<Failure, List<TestCaseEntity>>> getCasesForPlan(String planId) async {
    try {
      final testCases = await dao.getCasesForPlan(planId);
      final entities = testCases.map((e) => e.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(DatabaseFailure('Błąd pobierania test case\'ów: $e'));
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
          assignedToUserId: testCase.assignedToUserId != null
              ? drift.Value(testCase.assignedToUserId!)
              : const drift.Value(null),
          expectedResult: testCase.expectedResult != null
              ? drift.Value(testCase.expectedResult!)
              : const drift.Value(null),
          lastModifiedUtc: testCase.lastModifiedUtc != null
              ? drift.Value(testCase.lastModifiedUtc!)
              : const drift.Value(null),
          parentCaseId: testCase.parentCaseId != null
              ? drift.Value(testCase.parentCaseId!)
              : const drift.Value(null),
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
          assignedToUserId: testCase.assignedToUserId != null
              ? drift.Value(testCase.assignedToUserId!)
              : const drift.Value(null),
          expectedResult: testCase.expectedResult != null
              ? drift.Value(testCase.expectedResult!)
              : const drift.Value(null),
          lastModifiedUtc: testCase.lastModifiedUtc != null
              ? drift.Value(testCase.lastModifiedUtc!)
              : const drift.Value(null),
          parentCaseId: testCase.parentCaseId != null
              ? drift.Value(testCase.parentCaseId!)
              : const drift.Value(null),
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
}
