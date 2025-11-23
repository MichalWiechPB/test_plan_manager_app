import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/global/navigation/domain/usecases/get_visited_modules.dart';
import '../../../../core/global/navigation/domain/usecases/save_visited_modules.dart';
import '../../domain/entities/module.dart';
import '../../domain/entities/test_plan.dart';
import '../../domain/usecases/create_module.dart';
import '../../domain/usecases/create_test_plan.dart';
import '../../domain/usecases/delete_module.dart';
import '../../domain/usecases/delete_test_plan.dart';
import '../../domain/usecases/get_modules_for_project.dart';
import '../../domain/usecases/get_submodules_for_module.dart';
import '../../domain/usecases/get_test_plan_for_modules.dart';
import '../../domain/usecases/update_module.dart';
import '../../domain/usecases/update_test_plan.dart';
import 'module_event.dart';
import 'module_state.dart';

class ModuleBloc extends Bloc<ModuleEvent, ModuleState> {
  final GetModulesForProject getModulesForProject;
  final GetSubmodulesForModule getSubmodulesForModule;
  final GetTestPlansForModule getTestPlansForModule;
  final SaveVisitedModules saveVisitedModules;
  final GetVisitedModules getVisitedModules;
  final CreateModule createModule;
  final UpdateModule updateModule;
  final DeleteModule deleteModule;
  final CreateTestPlan createTestPlan;
  final UpdateTestPlan updateTestPlan;
  final DeleteTestPlan deleteTestPlan;

  ModuleBloc({
    required this.getModulesForProject,
    required this.getSubmodulesForModule,
    required this.getTestPlansForModule,
    required this.saveVisitedModules,
    required this.getVisitedModules,
    required this.createModule,
    required this.updateModule,
    required this.deleteModule,
    required this.createTestPlan,
    required this.updateTestPlan,
    required this.deleteTestPlan,
  }) : super(const ModuleState.initial()) {
    on<GetModulesForProjectEvent>(_onGetModulesForProject);
    on<GetSubmodulesForModuleEvent>(_onGetSubmodulesForModule);
    on<LoadPreviewForModuleEvent>(_onLoadPreviewForModule);
    on<NavigateBackEvent>(_onNavigateBack);
    on<SetVisitedPathEvent>(_onSetVisitedPath);
    on<CreateModuleEvent>(_onCreateModule);
    on<UpdateModuleEvent>(_onUpdateModule);
    on<DeleteModuleEvent>(_onDeleteModule);
    on<CreateTestPlanEvent>(_onCreateTestPlan);
    on<UpdateTestPlanEvent>(_onUpdateTestPlan);
    on<DeleteTestPlanEvent>(_onDeleteTestPlan);
  }

  Future<void> _onGetModulesForProject(
      GetModulesForProjectEvent event,
      Emitter<ModuleState> emit,
      ) async {
    emit(const ModuleState.loading());

    (await getModulesForProject(ProjectIdParams(event.projectId))).fold(
          (failure) {
        emit(
          ModuleState.failure(
            errorMessage: failure.message ?? 'Wystąpił nieznany błąd',
          ),
        );
      },
          (modules) {
        final visited = getVisitedModules(event.projectId);

        emit(
          ModuleState.success(
            modules: modules,
            submodules: const {},
            testPlans: const {},
            visitedModules: visited,
            currentProjectId: event.projectId,
            projectName: event.projectName,
          ),
        );
      },
    );
  }

  Future<void> _onLoadPreviewForModule(
      LoadPreviewForModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final current = state;
    if (current is! ModuleSuccess) return;

    final moduleId = event.moduleId;

    final alreadyLoaded =
        (current.submodules[moduleId]?.isNotEmpty ?? false) ||
            (current.testPlans[moduleId]?.isNotEmpty ?? false);

    if (alreadyLoaded) return;

    final updatedSubmodules =
    Map<String, List<ModuleEntity>>.from(current.submodules);
    final updatedTestPlans =
    Map<String, List<TestPlanEntity>>.from(current.testPlans);

    (await getSubmodulesForModule(ParentModuleIdParams(moduleId))).fold(
          (_) {},
          (subs) {
        updatedSubmodules[moduleId] = subs.take(3).toList();
      },
    );

    (await getTestPlansForModule(ModuleIdParams(moduleId))).fold(
          (_) {},
          (plans) {
        updatedTestPlans[moduleId] = plans.take(3).toList();
      },
    );

    emit(
      current.copyWith(
        submodules: updatedSubmodules,
        testPlans: updatedTestPlans,
      ),
    );
  }

  Future<void> _onGetSubmodulesForModule(
      GetSubmodulesForModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final current = state;
    if (current is! ModuleSuccess) return;

    final moduleId = event.moduleId;
    final projectId = current.currentProjectId;
    if (projectId == null) return;

    final alreadyCached = current.submodules.containsKey(moduleId);

    if (alreadyCached) {
      final visited = getVisitedModules(projectId);

      if (!visited.contains(moduleId)) {
        final updatedVisited = [...visited, moduleId];
        saveVisitedModules(projectId, updatedVisited);
        emit(current.copyWith(visitedModules: updatedVisited));
      } else {
        emit(current.copyWith(visitedModules: visited));
      }

      return;
    }

    final previousSubmodules =
    Map<String, List<ModuleEntity>>.from(current.submodules);
    final previousTestPlans =
    Map<String, List<TestPlanEntity>>.from(current.testPlans);

    emit(const ModuleState.loading());

    final updatedSubmodules = Map<String, List<ModuleEntity>>.from(
      previousSubmodules,
    );
    final updatedTestPlans = Map<String, List<TestPlanEntity>>.from(
      previousTestPlans,
    );

    String? errorMessage;

    (await getSubmodulesForModule(ParentModuleIdParams(moduleId))).fold(
          (failure) {
        errorMessage = failure.message ?? 'Wystąpił nieznany błąd';
      },
          (modules) {
        updatedSubmodules[moduleId] = modules;
      },
    );

    if (errorMessage != null) {
      emit(
        ModuleState.failure(errorMessage: errorMessage!),
      );
      return;
    }

    (await getTestPlansForModule(ModuleIdParams(moduleId))).fold(
          (failure) {
        errorMessage = failure.message ?? 'Wystąpił nieznany błąd';
      },
          (plans) {
        updatedTestPlans[moduleId] = plans;
      },
    );

    if (errorMessage != null) {
      emit(
        ModuleState.failure(errorMessage: errorMessage!),
      );
      return;
    }

    final currentVisited = getVisitedModules(projectId);
    final updatedVisited = [...currentVisited, moduleId];
    saveVisitedModules(projectId, updatedVisited);

    emit(
      ModuleState.success(
        modules: current.modules,
        submodules: updatedSubmodules,
        testPlans: updatedTestPlans,
        visitedModules: updatedVisited,
        currentProjectId: projectId,
        projectName: current.projectName,
      ),
    );
  }

  Future<void> _onNavigateBack(
      NavigateBackEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final current = state;
    if (current is! ModuleSuccess) return;

    final visited = getVisitedModules(event.projectId);

    if (visited.isNotEmpty) {
      final shortened = [...visited]..removeLast();
      saveVisitedModules(event.projectId, shortened);

      emit(
        current.copyWith(visitedModules: shortened),
      );
      return;
    }

    saveVisitedModules(event.projectId, []);

    emit(
      current.copyWith(visitedModules: const []),
    );
  }

  Future<void> _onSetVisitedPath(
      SetVisitedPathEvent event,
      Emitter<ModuleState> emit,
      ) async {
    saveVisitedModules(event.projectId, [...event.visited]);

    final current = state;
    if (current is ModuleSuccess) {
      emit(
        current.copyWith(visitedModules: [...event.visited]),
      );
    }
  }

  Future<void> _refresh({String? moduleId}) async {
    final current = state;
    if (current is! ModuleSuccess) return;

    final projectId = current.currentProjectId;
    if (projectId == null) return;

    if (moduleId == null) {
      add(
        ModuleEvent.getModulesForProject(
          projectId: projectId,
          projectName: current.projectName,
        ),
      );
    } else {
      add(
        ModuleEvent.getSubmodulesForModule(moduleId: moduleId),
      );
    }
  }

  Future<void> _onCreateModule(
      CreateModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    emit(const ModuleState.loading());

    String? errorMessage;

    (await createModule(CreateModuleParams(event.module))).fold(
          (failure) {
        errorMessage = failure.message ?? 'Wystąpił nieznany błąd';
      },
          (_) {},
    );

    if (errorMessage != null) {
      emit(
        ModuleState.failure(errorMessage: errorMessage!),
      );
      return;
    }

    await _refresh(moduleId: event.module.parentModuleId);
  }

  Future<void> _onUpdateModule(
      UpdateModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    emit(const ModuleState.loading());

    String? errorMessage;

    (await updateModule(UpdateModuleParams(event.module))).fold(
          (failure) {
        errorMessage = failure.message ?? 'Wystąpił nieznany błąd';
      },
          (_) {},
    );

    if (errorMessage != null) {
      emit(
        ModuleState.failure(errorMessage: errorMessage!),
      );
      return;
    }

    await _refresh(moduleId: event.module.parentModuleId);
  }

  Future<void> _onDeleteModule(
      DeleteModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    emit(const ModuleState.loading());

    String? errorMessage;

    (await deleteModule(DeleteModuleParams(event.moduleId))).fold(
          (failure) {
        errorMessage = failure.message ?? 'Wystąpił nieznany błąd';
      },
          (_) {},
    );

    if (errorMessage != null) {
      emit(
        ModuleState.failure(errorMessage: errorMessage!),
      );
      return;
    }

    await _refresh(moduleId: event.moduleId);
  }

  Future<void> _onCreateTestPlan(
      CreateTestPlanEvent event,
      Emitter<ModuleState> emit,
      ) async {
    emit(const ModuleState.loading());

    String? errorMessage;

    (await createTestPlan(CreateTestPlanParams(event.plan))).fold(
          (failure) {
        errorMessage = failure.message ?? 'Wystąpił nieznany błąd';
      },
          (_) {},
    );

    if (errorMessage != null) {
      emit(
        ModuleState.failure(errorMessage: errorMessage!),
      );
      return;
    }

    await _refresh(moduleId: event.plan.moduleId);
  }

  Future<void> _onUpdateTestPlan(
      UpdateTestPlanEvent event,
      Emitter<ModuleState> emit,
      ) async {
    emit(const ModuleState.loading());

    String? errorMessage;

    (await updateTestPlan(UpdateTestPlanParams(event.plan))).fold(
          (failure) {
        errorMessage = failure.message ?? 'Wystąpił nieznany błąd';
      },
          (_) {},
    );

    if (errorMessage != null) {
      emit(
        ModuleState.failure(errorMessage: errorMessage!),
      );
      return;
    }

    await _refresh(moduleId: event.plan.moduleId);
  }

  Future<void> _onDeleteTestPlan(
      DeleteTestPlanEvent event,
      Emitter<ModuleState> emit,
      ) async {
    emit(const ModuleState.loading());

    String? errorMessage;

    (await deleteTestPlan(DeleteTestPlanParams(event.testPlanId))).fold(
          (failure) {
        errorMessage = failure.message ?? 'Wystąpił nieznany błąd';
      },
          (_) {},
    );

    if (errorMessage != null) {
      emit(
        ModuleState.failure(errorMessage: errorMessage!),
      );
      return;
    }

    final current = state;
    if (current is! ModuleSuccess) {
      await _refresh();
      return;
    }

    final lastModuleId =
    current.visitedModules.isNotEmpty ? current.visitedModules.last : null;

    await _refresh(moduleId: lastModuleId);
  }
}
