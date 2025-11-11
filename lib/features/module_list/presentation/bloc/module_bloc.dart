import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/global/navigation/domain/usecases/get_visited_modules.dart';
import '../../../../core/global/navigation/domain/usecases/save_visited_modules.dart';
import '../../../../dependency_injection/service_locator.dart';
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

  // ---------------------------------------------------------------------------
  // 1️⃣ Pobranie głównych modułów projektu
  // ---------------------------------------------------------------------------
  Future<void> _onGetModulesForProject(
      GetModulesForProjectEvent event,
      Emitter<ModuleState> emit,
      ) async {
    if (state.currentProjectId != event.projectId) {
      emit(const ModuleState.initial());
    }

    emit(state.copyWith(status: ModuleStatus.loading));

    final result = await getModulesForProject(ProjectIdParams(event.projectId));

    result.fold(
          (failure) => emit(state.copyWith(
        status: ModuleStatus.failure,
        errorMessage: failure.message,
      )),
          (modules) {
        // 🔹 Wczytaj poprzednią ścieżkę (jeśli istnieje)
        final visited = getVisitedModules(event.projectId);
        emit(state.copyWith(
          status: ModuleStatus.success,
          modules: modules,
          currentProjectId: event.projectId,
          visitedModules: visited,
        ));
      },
    );
  }

  // ---------------------------------------------------------------------------
  // 2️⃣ Podgląd dla kafelka (maks. 3 elementy)
  // ---------------------------------------------------------------------------
  Future<void> _onLoadPreviewForModule(
      LoadPreviewForModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final moduleId = event.moduleId;

    final alreadyLoaded = (state.submodules[moduleId]?.isNotEmpty ?? false) ||
        (state.testPlans[moduleId]?.isNotEmpty ?? false);
    if (alreadyLoaded) return;

    final submodulesResult =
    await getSubmodulesForModule(ParentModuleIdParams(moduleId));
    final testPlansResult =
    await getTestPlansForModule(ModuleIdParams(moduleId));

    final updatedSubmodules =
    Map<String, List<ModuleEntity>>.from(state.submodules);
    final updatedTestPlans =
    Map<String, List<TestPlanEntity>>.from(state.testPlans);

    submodulesResult.fold(
          (_) => null,
          (subs) => updatedSubmodules[moduleId] = subs.take(3).toList(),
    );
    testPlansResult.fold(
          (_) => null,
          (plans) => updatedTestPlans[moduleId] = plans.take(3).toList(),
    );

    emit(state.copyWith(
      submodules: updatedSubmodules,
      testPlans: updatedTestPlans,
    ));
  }

  // ---------------------------------------------------------------------------
  // 3️⃣ Pobranie submodułów i planów testowych
  // ---------------------------------------------------------------------------
  Future<void> _onGetSubmodulesForModule(
      GetSubmodulesForModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final moduleId = event.moduleId;
    final projectId = state.currentProjectId;
    if (projectId == null) return;

    // 🔹 Sprawdź cache
    final alreadyCached = state.submodules.containsKey(moduleId);
    if (alreadyCached) {
      final visited = getVisitedModules(projectId);
      if (!visited.contains(moduleId)) {
        final updatedVisited = [...visited, moduleId];
        saveVisitedModules(projectId, updatedVisited);
        emit(state.copyWith(visitedModules: updatedVisited));
      } else {
        emit(state.copyWith(visitedModules: visited));
      }
      return;
    }

    emit(state.copyWith(status: ModuleStatus.loading));

    final submodulesResult =
    await getSubmodulesForModule(ParentModuleIdParams(moduleId));
    final testPlansResult =
    await getTestPlansForModule(ModuleIdParams(moduleId));

    final updatedSubmodules =
    Map<String, List<ModuleEntity>>.from(state.submodules);
    final updatedTestPlans =
    Map<String, List<TestPlanEntity>>.from(state.testPlans);

    submodulesResult.fold(
          (failure) => emit(state.copyWith(
        status: ModuleStatus.failure,
        errorMessage: failure.message,
      )),
          (modules) => updatedSubmodules[moduleId] = modules,
    );

    testPlansResult.fold(
          (failure) => emit(state.copyWith(
        status: ModuleStatus.failure,
        errorMessage: failure.message,
      )),
          (plans) => updatedTestPlans[moduleId] = plans,
    );

    // 🔹 Aktualizacja ścieżki
    final currentVisited = getVisitedModules(projectId);
    final updatedVisited = [...currentVisited, moduleId];
    saveVisitedModules(projectId, updatedVisited);

    emit(state.copyWith(
      status: ModuleStatus.success,
      submodules: updatedSubmodules,
      testPlans: updatedTestPlans,
      visitedModules: updatedVisited,
    ));
  }

  Future<void> _onNavigateBack(
      NavigateBackEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final projectId = event.projectId;
    final visited = getVisitedModules(projectId);

    if (visited.isNotEmpty) {
      final shortened = List<String>.from(visited)..removeLast();
      saveVisitedModules(projectId, shortened);
      emit(state.copyWith(visitedModules: shortened));
    } else {
      saveVisitedModules(projectId, []);
      emit(state.copyWith(visitedModules: []));
    }
  }

  Future<void> _onSetVisitedPath(
      SetVisitedPathEvent event,
      Emitter<ModuleState> emit,
      ) async {
    // zapisz w repo
    saveVisitedModules(event.projectId, List<String>.from(event.visited));
    // odśwież UI stanem
    emit(state.copyWith(visitedModules: List<String>.from(event.visited)));
  }
  Future<void> _refreshAfterChange(Emitter<ModuleState> emit, {String? moduleId}) async {
    final projectId = state.currentProjectId;
    if (projectId == null) return;
    if (moduleId == null) {
      add(GetModulesForProjectEvent(projectId));
    } else {
      add(GetSubmodulesForModuleEvent(moduleId));
    }
  }

// Modules
  Future<void> _onCreateModule(CreateModuleEvent e, Emitter<ModuleState> emit) async {
    emit(state.copyWith(status: ModuleStatus.loading));
    final res = await createModule(CreateModuleParams(e.module));
    res.fold(
          (f) => emit(state.copyWith(status: ModuleStatus.failure, errorMessage: f.message)),
          (_) => _refreshAfterChange(emit, moduleId: e.module.parentModuleId),
    );
  }
  Future<void> _onUpdateModule(UpdateModuleEvent e, Emitter<ModuleState> emit) async {
    emit(state.copyWith(status: ModuleStatus.loading));
    final res = await updateModule(UpdateModuleParams(e.module));
    res.fold(
          (f) => emit(state.copyWith(status: ModuleStatus.failure, errorMessage: f.message)),
          (_) => _refreshAfterChange(emit, moduleId: e.module.parentModuleId),
    );
  }
  Future<void> _onDeleteModule(DeleteModuleEvent e, Emitter<ModuleState> emit) async {
    emit(state.copyWith(status: ModuleStatus.loading));
    final res = await deleteModule(DeleteModuleParams(e.moduleId));
    res.fold(
          (f) => emit(state.copyWith(status: ModuleStatus.failure, errorMessage: f.message)),
          (_) => _refreshAfterChange(emit, moduleId: e.moduleId), // odśwież rodzica według twojej logiki
    );
  }

// Test plans
  Future<void> _onCreateTestPlan(CreateTestPlanEvent e, Emitter<ModuleState> emit) async {
    emit(state.copyWith(status: ModuleStatus.loading));
    final res = await createTestPlan(CreateTestPlanParams(e.plan));
    res.fold(
          (f) => emit(state.copyWith(status: ModuleStatus.failure, errorMessage: f.message)),
          (_) => _refreshAfterChange(emit, moduleId: e.plan.moduleId),
    );
  }
  Future<void> _onUpdateTestPlan(UpdateTestPlanEvent e, Emitter<ModuleState> emit) async {
    emit(state.copyWith(status: ModuleStatus.loading));
    final res = await updateTestPlan(UpdateTestPlanParams(e.plan));
    res.fold(
          (f) => emit(state.copyWith(status: ModuleStatus.failure, errorMessage: f.message)),
          (_) => _refreshAfterChange(emit, moduleId: e.plan.moduleId),
    );
  }
  Future<void> _onDeleteTestPlan(DeleteTestPlanEvent e, Emitter<ModuleState> emit) async {
    emit(state.copyWith(status: ModuleStatus.loading));
    final res = await deleteTestPlan(DeleteTestPlanParams(e.testPlanId));
    res.fold(
          (f) => emit(state.copyWith(status: ModuleStatus.failure, errorMessage: f.message)),
          (_) => _refreshAfterChange(emit, moduleId: state.visitedModules.isNotEmpty ? state.visitedModules.last : null),
    );
  }

}
