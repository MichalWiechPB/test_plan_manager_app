import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../project_list/domain/entities/project.dart';
import '../../domain/entities/project_structure.dart';

part 'test_execution_event.freezed.dart';

@freezed
sealed class TestExecutionEvent with _$TestExecutionEvent {
  const factory TestExecutionEvent.getAllProjectsForTests() =
  GetAllProjectsForTestsEvent;

  const factory TestExecutionEvent.getProjectStructure({
    required String projectId,
  }) = GetProjectStructureEvent;

  const factory TestExecutionEvent.updateStepTempStatus({
    required StepStatusPathEntity stepStatus,
  }) = UpdateStepTempStatusEvent;

  const factory TestExecutionEvent.exportToFile() = ExportToFileEvent;
}
