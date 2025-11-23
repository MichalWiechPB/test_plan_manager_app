import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/module.dart';
import '../../domain/entities/test_plan.dart';

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

  const factory ModuleEvent.navigateBack({
    required String projectId,
  }) = NavigateBackEvent;

  const factory ModuleEvent.setVisitedPath({
    required String projectId,
    required List<String> visited,
  }) = SetVisitedPathEvent;

  const factory ModuleEvent.createModule({
    required ModuleEntity module,
  }) = CreateModuleEvent;

  const factory ModuleEvent.updateModule({
    required ModuleEntity module,
  }) = UpdateModuleEvent;

  const factory ModuleEvent.deleteModule({
    required String moduleId,
  }) = DeleteModuleEvent;

  const factory ModuleEvent.createTestPlan({
    required TestPlanEntity plan,
  }) = CreateTestPlanEvent;

  const factory ModuleEvent.updateTestPlan({
    required TestPlanEntity plan,
  }) = UpdateTestPlanEvent;

  const factory ModuleEvent.deleteTestPlan({
    required String testPlanId,
  }) = DeleteTestPlanEvent;
}
