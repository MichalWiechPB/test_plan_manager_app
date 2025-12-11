import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/core/error/failures.dart';
import 'package:test_plan_manager_app/database/drift_database/data.dart';

abstract class TestCaseLocalDataSource {
  Future<Either<Failure, List<TestCase>>> getCasesForPlan(String planId);
  Future<void> upsertTestCase(TestCasesCompanion testCase);
  Future<Either<Failure, void>> createTestCase(TestCasesCompanion testCase);
  Future<Either<Failure, void>> updateTestCase(TestCasesCompanion testCase);
  Future<Either<Failure, void>> deleteTestCase(String id);
  Future<Either<Failure, void>> updateStepsAndStatus(
      String id,
      int totalSteps,
      int passedSteps,
      String status,
      );
}
