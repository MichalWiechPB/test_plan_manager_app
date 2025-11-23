import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart' as drift;
import 'package:test_plan_manager_app/features/module_list/data/models/dtos/module_dto.dart';
import 'package:test_plan_manager_app/features/module_list/data/models/dtos/test_plan_dto.dart';
import '../../../../core/error/failures.dart';
import '../../../../database/daos/module_dao.dart';
import '../../../../database/daos/test_plans_dao.dart';
import '../../../../database/drift_database/data.dart';
import '../../domain/entities/module.dart';
import '../../domain/entities/test_plan.dart';
import '../../domain/repository/module_repository.dart';

class ModuleRepositoryImpl implements ModuleRepository {
  final ModuleDao moduleDao;
  final TestPlansDao testPlansDao;

  ModuleRepositoryImpl(this.moduleDao, this.testPlansDao);

  // -----------------------------------------------------------
  // 🔹 Istniejące metody — pozostają bez zmian
  // -----------------------------------------------------------

  @override
  Future<Either<Failure, List<ModuleEntity>>> getAllModules() async {
    try {
      final result = await moduleDao.getAllModules();
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseFailure('Failed to load all modules: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ModuleEntity>>> getModulesForProject(
      String projectId) async {
    try {
      final result = await moduleDao.getModulesForProject(projectId);
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseFailure('Failed to load project modules: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ModuleEntity>>> getSubmodules(
      String moduleId) async {
    try {
      final result = await moduleDao.getSubmodules(moduleId);
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseFailure('Failed to load submodules: $e'));
    }
  }

  @override
  Future<Either<Failure, List<TestPlanEntity>>> getPlansForModule(
      String moduleId) async {
    try {
      final result = await testPlansDao.getPlansByModuleId(moduleId);
      return Right(result.map((p) => p.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseFailure('Failed to load test plans: $e'));
    }
  }

  // -----------------------------------------------------------
  // 🆕 CRUD modułów
  // -----------------------------------------------------------

  @override
  Future<Either<Failure, void>> createModule(ModuleEntity module) async {
    try {
      await moduleDao.insertModule(
        ModulesCompanion.insert(
          id: module.id,
          name: module.name,
          description: (module.description != null &&
              module.description!.trim().isNotEmpty)
              ? drift.Value(module.description!)
              : const drift.Value(null),
          projectId: module.projectId,
          parentModuleId: module.parentModuleId != null
              ? drift.Value(module.parentModuleId!)
              : const drift.Value(null),
        ),
      );
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Failed to create module: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateModule(ModuleEntity module) async {
    try {
      await moduleDao.updateModule(
        ModulesCompanion(
          id: drift.Value(module.id),
          name: drift.Value(module.name),
          description: (module.description != null &&
              module.description!.trim().isNotEmpty)
              ? drift.Value(module.description!)
              : const drift.Value(null),
          projectId: drift.Value(module.projectId),
          parentModuleId: module.parentModuleId != null
              ? drift.Value(module.parentModuleId!)
              : const drift.Value(null),
        ),
      );
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Failed to update module: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteModule(String id) async {
    try {
      await moduleDao.deleteModule(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Failed to delete module: $e'));
    }
  }

  // -----------------------------------------------------------
  // 🆕 CRUD planów testowych
  // -----------------------------------------------------------

  @override
  Future<Either<Failure, void>> createTestPlan(TestPlanEntity plan) async {
    try {
      await testPlansDao.insertPlan(
        TestPlansCompanion.insert(
          id: plan.id,
          name: plan.name,
          description: (plan.description != null &&
              plan.description!.trim().isNotEmpty)
              ? drift.Value(plan.description!)
              : const drift.Value(null),
          moduleId: plan.moduleId,
        ),
      );
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Failed to create test plan: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateTestPlan(TestPlanEntity plan) async {
    try {
      await testPlansDao.updatePlan(
        TestPlansCompanion(
          id: drift.Value(plan.id),
          name: drift.Value(plan.name),
          description: (plan.description != null &&
              plan.description!.trim().isNotEmpty)
              ? drift.Value(plan.description!)
              : const drift.Value(null),
          moduleId: drift.Value(plan.moduleId),
        ),
      );
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Failed to update test plan: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTestPlan(String id) async {
    try {
      await testPlansDao.deletePlan(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Failed to delete test plan: $e'));
    }
  }
}
