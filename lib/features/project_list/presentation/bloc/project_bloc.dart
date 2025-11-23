import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_plan_manager_app/features/project_list/presentation/bloc/project_event.dart';
import 'package:test_plan_manager_app/features/project_list/presentation/bloc/project_state.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/create_new_project.dart';
import '../../domain/usecases/delete_project.dart';
import '../../domain/usecases/get_all_projects.dart';
import '../../domain/usecases/update_project.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final GetAllProjects getAllProjects;
  final CreateProject createProject;
  final UpdateProject updateProject;
  final DeleteProject deleteProject;

  ProjectBloc(
      this.getAllProjects,
      this.createProject,
      this.updateProject,
      this.deleteProject,
      ) : super(const ProjectState.initial()) {
    on<GetAllProjectsEvent>(_onGetAllProjects);
    on<CreateProjectEvent>(_onCreateProject);
    on<UpdateProjectEvent>(_onUpdateProject);
    on<DeleteProjectEvent>(_onDeleteProject);
  }

  Future<void> _onGetAllProjects(
      GetAllProjectsEvent event,
      Emitter<ProjectState> emit,
      ) async {
    emit(const ProjectState.loading());

    (await getAllProjects(NoParams())).fold(
          (failure) => emit(ProjectState.failure(
        errorMessage: failure.message ?? 'Wystąpił nieznany błąd',
      )),
          (projects) => emit(ProjectState.success(
        projects: projects,
      )),
    );
  }

  Future<void> _onCreateProject(
      CreateProjectEvent event,
      Emitter<ProjectState> emit,
      ) async {
    emit(const ProjectState.loading());

    (await createProject(CreateProjectParams(event.project))).fold(
          (failure) => emit(ProjectState.failure(
        errorMessage: failure.message ?? 'Błąd tworzenia projektu',
      )),
          (_) => add(const ProjectEvent.getAll()),
    );
  }

  Future<void> _onUpdateProject(
      UpdateProjectEvent event,
      Emitter<ProjectState> emit,
      ) async {
    emit(const ProjectState.loading());

    (await updateProject(UpdateProjectParams(event.project))).fold(
          (failure) => emit(ProjectState.failure(
        errorMessage: failure.message ?? 'Błąd aktualizacji projektu',
      )),
          (_) => add(const ProjectEvent.getAll()),
    );
  }

  Future<void> _onDeleteProject(
      DeleteProjectEvent event,
      Emitter<ProjectState> emit,
      ) async {
    emit(const ProjectState.loading());

    (await deleteProject(DeleteProjectParams(event.id))).fold(
          (failure) => emit(ProjectState.failure(
        errorMessage: failure.message ?? 'Błąd usuwania projektu',
      )),
          (_) => add(const ProjectEvent.getAll()),
    );
  }
}
