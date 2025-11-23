import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/module.dart';
import '../../domain/entities/test_plan.dart';

part 'module_state.freezed.dart';

@freezed
sealed class ModuleState with _$ModuleState {
  const factory ModuleState.initial() = ModuleInitial;

  const factory ModuleState.loading() = ModuleLoading;

  const factory ModuleState.success({
    required List<ModuleEntity> modules,
    required Map<String, List<ModuleEntity>> submodules,
    required Map<String, List<TestPlanEntity>> testPlans,
    required List<String> visitedModules,
    String? currentProjectId,
    String? projectName,
  }) = ModuleSuccess;

  const factory ModuleState.failure({
    required String errorMessage,
  }) = ModuleFailure;
}
