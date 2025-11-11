import 'package:equatable/equatable.dart';

import '../../domain/entities/module.dart';
import '../../domain/entities/test_plan.dart';

abstract class ModuleEvent extends Equatable {
  const ModuleEvent();

  @override
  List<Object?> get props => [];
}

/// 🔹 Pobiera moduły główne dla danego projektu
class GetModulesForProjectEvent extends ModuleEvent {
  final String projectId;
  const GetModulesForProjectEvent(this.projectId);

  @override
  List<Object?> get props => [projectId];
}

/// 🔹 Pobiera submoduły i plany testowe dla danego modułu
class GetSubmodulesForModuleEvent extends ModuleEvent {
  final String moduleId;
  const GetSubmodulesForModuleEvent(this.moduleId);

  @override
  List<Object?> get props => [moduleId];
}

/// 🔹 Ładuje podgląd (maks. 3 elementy) dla modułu — do kafelka
class LoadPreviewForModuleEvent extends ModuleEvent {
  final String moduleId;
  const LoadPreviewForModuleEvent(this.moduleId);

  @override
  List<Object?> get props => [moduleId];
}

/// 🔹 Cofnięcie o jeden poziom w strukturze modułów (zachowuje się jak „Back”)
class NavigateBackEvent extends ModuleEvent {
  final String projectId;
  const NavigateBackEvent(this.projectId);

  @override
  List<Object?> get props => [projectId];
}
class SetVisitedPathEvent extends ModuleEvent {
  final String projectId;
  final List<String> visited;
  const SetVisitedPathEvent(this.projectId, this.visited);

  @override
  List<Object?> get props => [projectId, visited];
}
// CRUD Modules
class CreateModuleEvent extends ModuleEvent {
  final ModuleEntity module;
  const CreateModuleEvent(this.module);
  @override List<Object?> get props => [module];
}

class UpdateModuleEvent extends ModuleEvent {
  final ModuleEntity module;
  const UpdateModuleEvent(this.module);
  @override List<Object?> get props => [module];
}

class DeleteModuleEvent extends ModuleEvent {
  final String moduleId;
  const DeleteModuleEvent(this.moduleId);
  @override List<Object?> get props => [moduleId];
}

// CRUD TestPlans
class CreateTestPlanEvent extends ModuleEvent {
  final TestPlanEntity plan;
  const CreateTestPlanEvent(this.plan);
  @override List<Object?> get props => [plan];
}

class UpdateTestPlanEvent extends ModuleEvent {
  final TestPlanEntity plan;
  const UpdateTestPlanEvent(this.plan);
  @override List<Object?> get props => [plan];
}

class DeleteTestPlanEvent extends ModuleEvent {
  final String testPlanId;
  const DeleteTestPlanEvent(this.testPlanId);
  @override List<Object?> get props => [testPlanId];
}


