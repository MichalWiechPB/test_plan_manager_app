import '../../../../features/project_list/data/models/dtos/project_dto.dart';

abstract class ProjectsRemoteDataSource {
  Future<List<ProjectDto>> fetchProjects();
  Future<ProjectDto> createProject(ProjectDto dto);
  Future<ProjectDto> updateProject(ProjectDto dto);
  Future<void> deleteProject(String id);
}
