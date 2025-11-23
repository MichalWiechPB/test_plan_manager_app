import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_plan_manager_app/features/project_list/domain/entities/project.dart';

part 'project_state.freezed.dart';

@freezed
sealed class ProjectState with _$ProjectState {
  const factory ProjectState.initial() = ProjectInitial;

  const factory ProjectState.loading() = ProjectLoading;

  const factory ProjectState.success({
    required List<ProjectEntity> projects,
  }) = ProjectSuccess;

  const factory ProjectState.failure({
    required String errorMessage,
  }) = ProjectFailure;
}
