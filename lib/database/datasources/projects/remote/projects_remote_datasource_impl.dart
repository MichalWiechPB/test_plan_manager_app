import 'package:test_plan_manager_app/core/config/graph_client.dart';
import 'package:test_plan_manager_app/database/datasources/projects/remote/projects_remote_datasource.dart';
import 'package:test_plan_manager_app/features/project_list/data/models/dtos/project_dto.dart';

class ProjectsRemoteDataSourceImpl implements ProjectsRemoteDataSource {
  final GraphClient graphClient;

  ProjectsRemoteDataSourceImpl({
    required this.graphClient,
  });

  static const _projectsListId = "e85cd967-7468-4d44-85db-501d3a57af15";

  @override
  Future<List<ProjectDto>> fetchProjects() async {
    final items = await graphClient.getListItems(
      listId: _projectsListId,
    );

    return items
        .map((e) => ProjectDto.fromGraphJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<ProjectDto> createProject(ProjectDto dto) async {
    final json = await graphClient.createListItem(
      listId: _projectsListId,
      body: dto.toGraphCreateJson(),
    );

    return ProjectDto.fromGraphJson(json);
  }

  @override
  Future<ProjectDto> updateProject(ProjectDto dto) async {
    if (dto.id == null) {
      throw Exception("ProjectDto.id cannot be null");
    }

    final json = await graphClient.updateListItemRaw(
      listId: _projectsListId,
      itemId: dto.id!,
      body: dto.toGraphUpdateJson(),
    );

    return ProjectDto.fromGraphJson(json);
  }

  @override
  Future<void> deleteProject(String id) async {
    await graphClient.deleteListItem(
      listId: _projectsListId,
      itemId: id,
    );
  }
}
