import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../database/drift_database/data.dart';

abstract class TestStepLocalDataSource {
  Future<Either<Failure, List<TestStep>>> getTestStepsForCase(String testCaseId);

  Future<Either<Failure, void>> createTestStep(TestStepsCompanion step);

  Future<Either<Failure, void>> updateTestStep(TestStepsCompanion step);

  Future<Either<Failure, void>> deleteTestStep(String id);

  Future<Either<Failure, void>> updateTestStepOrder(
      List<TestStepsCompanion> steps,
      );
  Future<Either<Failure, void>> upsertTestStep(TestStepsCompanion step);
}
