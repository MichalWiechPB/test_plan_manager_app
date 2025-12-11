import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/core/error/failures.dart';
import 'package:test_plan_manager_app/core/usecases/streamusecase.dart';
import 'package:test_plan_manager_app/features/module_list/domain/repository/module_repository.dart';
import '../entities/test_plan.dart';

class ModuleIdParams {
  final String moduleId;

  ModuleIdParams(this.moduleId);
}

class GetTestPlansForModule
    extends StreamUseCase<List<TestPlanEntity>, ModuleIdParams> {
  final ModuleRepository repository;

  GetTestPlansForModule(this.repository);

  @override
  Stream<List<TestPlanEntity>> call(ModuleIdParams params) {
    return repository.getPlansForModule(params.moduleId).asyncMap(
          (either) => either.fold(
              (failure) => throw Exception(failure.message ?? 'Unknown error'),
            (data) => data,
      ),
    );
  }
}

