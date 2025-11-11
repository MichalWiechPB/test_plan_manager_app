import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/test_case.dart';

abstract class TestPlanRepository {
  Future<Either<Failure, List<TestCaseEntity>>> getCasesForPlan(String planId);

  Future<Either<Failure, void>> createTestCase(TestCaseEntity testCase);
  Future<Either<Failure, void>> updateTestCase(TestCaseEntity testCase);
  Future<Either<Failure, void>> deleteTestCase(String id);
}
