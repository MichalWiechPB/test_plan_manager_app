import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_plan_manager_app/features/module_list/data/models/visited_module.dart';

import '../../domain/entities/module.dart';
import '../../domain/entities/test_plan.dart';
import 'module_state.dart'; // zawiera VisitedModule

part 'module_event.freezed.dart';

@freezed
sealed class ModuleEvent with _$ModuleEvent {
  const factory ModuleEvent.getModulesForProject({
    required String projectId,
    String? projectName,
  }) = GetModulesForProjectEvent;

  const factory ModuleEvent.getSubmodulesForModule({
    required String moduleId,
  }) = GetSubmodulesForModuleEvent;

  const factory ModuleEvent.loadPreviewForModule({
    required String moduleId,
  }) = LoadPreviewForModuleEvent;

  const factory ModuleEvent.createModule({
    required ModuleEntity module,
  }) = CreateModuleEvent;

  const factory ModuleEvent.updateModule({
    required ModuleEntity module,
    String? parentModuleId,
  }) = UpdateModuleEvent;


  const factory ModuleEvent.deleteModule({
    required String moduleId,
    String? parentModuleId,
  }) = DeleteModuleEvent;


  const factory ModuleEvent.createTestPlan({
    required TestPlanEntity plan,
  }) = CreateTestPlanEvent;

  const factory ModuleEvent.updateTestPlan({
    required TestPlanEntity plan,
  }) = UpdateTestPlanEvent;

  const factory ModuleEvent.deleteTestPlan({
    required String testPlanId,
    required String moduleId, // ważne!
  }) = DeleteTestPlanEvent;


  const factory ModuleEvent.pushVisited({
    required VisitedModule module,
  }) = PushVisitedEvent;

  const factory ModuleEvent.popVisited() = PopVisitedEvent;

  const factory ModuleEvent.resetVisited() = ResetVisitedEvent;
}
