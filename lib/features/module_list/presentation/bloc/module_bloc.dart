import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_plan_manager_app/features/module_list/data/models/visited_module.dart';

import '../../domain/entities/module.dart';
import '../../domain/entities/test_plan.dart';

import '../../domain/usecases/get_modules_for_project.dart';
import '../../domain/usecases/get_submodules_for_module.dart';
import '../../domain/usecases/get_test_plan_for_modules.dart';

import '../../domain/usecases/create_module.dart';
import '../../domain/usecases/update_module.dart';
import '../../domain/usecases/delete_module.dart';

import '../../domain/usecases/create_test_plan.dart';
import '../../domain/usecases/update_test_plan.dart';
import '../../domain/usecases/delete_test_plan.dart';

import 'module_event.dart';
import 'module_state.dart';

class ModuleBloc extends Bloc<ModuleEvent, ModuleState> {
  final GetModulesForProject getModulesForProject;
  final GetSubmodulesForModule getSubmodulesForModule;
  final GetTestPlansForModule getTestPlansForModule;

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
    required this.createModule,
    required this.updateModule,
    required this.deleteModule,
    required this.createTestPlan,
    required this.updateTestPlan,
    required this.deleteTestPlan,
  }) : super(const ModuleState.initial()) {
    on<GetModulesForProjectEvent>(_onGetModules);
    on<GetSubmodulesForModuleEvent>(_onGetSubmodules);

    on<PushVisitedEvent>(_onPushVisited);
    on<PopVisitedEvent>(_onPopVisited);
    on<ResetVisitedEvent>(_onResetVisited);

    on<CreateModuleEvent>(_onCreateModule);
    on<UpdateModuleEvent>(_onUpdateModule);
    on<DeleteModuleEvent>(_onDeleteModule);

    on<CreateTestPlanEvent>(_onCreateTestPlan);
    on<UpdateTestPlanEvent>(_onUpdateTestPlan);
    on<DeleteTestPlanEvent>(_onDeleteTestPlan);

    on<LoadPreviewForModuleEvent>(_onPreviewForModule);
  }

  Future<void> _onGetModules(
      GetModulesForProjectEvent event,
      Emitter<ModuleState> emit,
      ) async {
    emit(const ModuleState.loading());

    await emit.forEach<List<ModuleEntity>>(
      getModulesForProject(ProjectIdParams(event.projectId)),
      onData: (modules) => ModuleState.success(
        modules: modules,
        submodules: const {},
        testPlans: const {},
        visitedModules: const [],
        currentProjectId: event.projectId,
        projectName: event.projectName,
      ),
      onError: (e, _) => ModuleState.failure(errorMessage: e.toString()),
    );
  }

  Future<void> _onGetSubmodules(
      GetSubmodulesForModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final current = state;
    if (current is! ModuleSuccess) return;

    final subs = await getSubmodulesForModule(ParentModuleIdParams(event.moduleId));

    String? error;
    List<ModuleEntity> list = [];

    subs.fold(
          (f) => error = f.message,
          (modules) => list = modules,
    );

    if (error != null) {
      emit(ModuleState.failure(errorMessage: error!));
      return;
    }

    final updatedSubs = Map<String, List<ModuleEntity>>.from(current.submodules);
    updatedSubs[event.moduleId] = list;

    await emit.forEach<List<TestPlanEntity>>(
      getTestPlansForModule(ModuleIdParams(event.moduleId)),
      onData: (plans) => current.copyWith(
        submodules: updatedSubs,
        testPlans: {...current.testPlans, event.moduleId: plans},
      ),
      onError: (e, _) => ModuleState.failure(errorMessage: e.toString()),
    );
  }

  Future<void> _onPreviewForModule(
      LoadPreviewForModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final current = state;
    if (current is! ModuleSuccess) return;

    await emit.forEach<List<TestPlanEntity>>(
      getTestPlansForModule(ModuleIdParams(event.moduleId)),
      onData: (plans) {
        final updated = Map.of(current.testPlans);
        updated[event.moduleId] = plans.take(3).toList();
        return current.copyWith(testPlans: updated);
      },
      onError: (err, _) => ModuleState.failure(errorMessage: err.toString()),
    );
  }


  void _onPushVisited(PushVisitedEvent event, Emitter<ModuleState> emit) {
    final current = state;
    if (current is ModuleSuccess) {
      emit(current.copyWith(visitedModules: [...current.visitedModules, event.module]));
    }
  }

  void _onPopVisited(PopVisitedEvent event, Emitter<ModuleState> emit) {
    final current = state;
    if (current is ModuleSuccess) {
      final updated = [...current.visitedModules];
      if (updated.isNotEmpty) updated.removeLast();
      emit(current.copyWith(visitedModules: updated));
    }
  }

  void _onResetVisited(ResetVisitedEvent event, Emitter<ModuleState> emit) {
    final current = state;
    if (current is ModuleSuccess) {
      emit(current.copyWith(visitedModules: []));
    }
  }

  void _refresh({String? parentModuleId}) {
    final current = state;
    if (current is! ModuleSuccess) return;

    if (parentModuleId == null) {
      add(GetModulesForProjectEvent(
        projectId: current.currentProjectId!,
        projectName: current.projectName,
      ));
    } else {
      add(GetSubmodulesForModuleEvent(moduleId: parentModuleId));
    }
  }

  Future<void> _onCreateModule(
      CreateModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final res = await createModule(CreateModuleParams(event.module));
    res.fold(
          (f) => emit(ModuleState.failure(errorMessage: f.message ?? 'error')),
          (_) => _refresh(parentModuleId: event.module.parentModuleId),
    );
  }

  Future<void> _onUpdateModule(
      UpdateModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final res = await updateModule(UpdateModuleParams(event.module));

    res.fold(
          (f) => emit(ModuleState.failure(errorMessage: f.message ?? 'error')),
          (_) {
        final parentId = event.parentModuleId ?? event.module.parentModuleId;

        if (parentId == null) {
          _refresh(); // root
        } else {
          _refresh(parentModuleId: parentId); // submodules
        }
      },
    );
  }


  Future<void> _onDeleteModule(
      DeleteModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final res = await deleteModule(DeleteModuleParams(event.moduleId));

    res.fold(
          (f) => emit(ModuleState.failure(errorMessage: f.message ?? 'error')),
          (_) {
        final current = state;
        if (current is! ModuleSuccess) return;

        final parentId = event.parentModuleId;

        if (parentId == null) {
          _refresh(); // root
        } else {
          _refresh(parentModuleId: parentId);
        }
      },
    );
  }


  Future<void> _onCreateTestPlan(
      CreateTestPlanEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final res = await createTestPlan(CreateTestPlanParams(event.plan));
    res.fold(
          (f) => emit(ModuleState.failure(errorMessage: f.message ?? 'error')),
          (_) => _refresh(parentModuleId: event.plan.moduleId),
    );
  }

  Future<void> _onUpdateTestPlan(
      UpdateTestPlanEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final res = await updateTestPlan(UpdateTestPlanParams(event.plan));
    res.fold(
          (f) => emit(ModuleState.failure(errorMessage: f.message ?? 'error')),
          (_) => _refresh(parentModuleId: event.plan.moduleId),
    );
  }

  Future<void> _onDeleteTestPlan(
      DeleteTestPlanEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final res = await deleteTestPlan(DeleteTestPlanParams(event.testPlanId));

    res.fold(
          (f) => emit(ModuleState.failure(errorMessage: f.message ?? 'error')),
          (_) {
        final current = state;
        if (current is! ModuleSuccess) return;

        final parentModuleId = event.moduleId;

        if (parentModuleId.isEmpty) {
          _refresh();
        } else {
          _refresh(parentModuleId: parentModuleId);
        }
      },
    );
  }

}
