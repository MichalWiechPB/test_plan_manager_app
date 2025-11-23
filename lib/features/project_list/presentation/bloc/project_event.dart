import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_plan_manager_app/features/project_list/domain/entities/project.dart';

part 'project_event.freezed.dart';

@freezed
sealed class ProjectEvent with _$ProjectEvent {
  const factory ProjectEvent.getAll() = GetAllProjectsEvent;

  const factory ProjectEvent.create({
    required ProjectEntity project,
  }) = CreateProjectEvent;

  const factory ProjectEvent.update({
    required ProjectEntity project,
  }) = UpdateProjectEvent;

  const factory ProjectEvent.delete({
    required String id,
  }) = DeleteProjectEvent;
}

