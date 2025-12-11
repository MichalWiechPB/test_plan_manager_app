import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/test_case.dart';

abstract class TestCaseRepository {
  Stream<Either<Failure, List<TestCaseEntity>>> getCasesForPlan(String planId);

  Future<Either<Failure, TestCaseEntity>> createTestCase(TestCaseEntity entity);

  Future<Either<Failure, TestCaseEntity>> updateTestCase(TestCaseEntity entity);

  Future<Either<Failure, void>> deleteTestCase(String id);

  Future<Either<Failure, void>> updateStepsAndStatus(
      String id,
      int totalSteps,
      int passedSteps,
      String status,
      );
}
