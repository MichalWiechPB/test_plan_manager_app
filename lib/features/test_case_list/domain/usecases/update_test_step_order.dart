import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/test_step.dart';
import '../repository/test_case_repository.dart';

/// Używany do aktualizacji kolejności (numeracji) kroków testowych.
/// Wykorzystywany po przeciągnięciu lub usunięciu kroku.
class UpdateTestStepOrder {
  final TestCaseRepository repository;

  UpdateTestStepOrder(this.repository);

  Future<Either<Failure, void>> call(List<TestStepEntity> steps) {
    return repository.updateTestStepOrder(steps);
  }
}
