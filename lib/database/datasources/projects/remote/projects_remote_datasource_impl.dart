import 'package:dio/dio.dart';
import 'package:test_plan_manager_app/database/datasources/projects/remote/projects_remote_datasource.dart';
import 'package:test_plan_manager_app/features/project_list/data/models/dtos/project_dto.dart';

class ProjectsRemoteDataSourceImpl implements ProjectsRemoteDataSource {
  final Dio httpClient;
  final Future<String> Function() tokenProvider;

  ProjectsRemoteDataSourceImpl({
    required this.httpClient,
    required this.tokenProvider,
  });

  static const _siteId =
      "wiechmichal01gmail.sharepoint.com,"
      "53d02a82-2aa5-49bf-abd9-0edf67d7e2e7,"
      "cac5f5b6-314f-43f2-a373-48ffb18f5d0a";

  static const _projectsListId = "e85cd967-7468-4d44-85db-501d3a57af15";

  String get _itemsUrl =>
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_projectsListId/items?expand=fields";

  String _updateUrl(String id) =>
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_projectsListId/items/$id/fields";

  String _deleteUrl(String id) =>
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_projectsListId/items/$id";

  @override
  Future<List<ProjectDto>> fetchProjects() async {
    final token = await tokenProvider();

    final res = await httpClient.get(
      _itemsUrl,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "ConsistencyLevel": "eventual",
        },
      ),
    );

    final List data = res.data["value"];
    return data.map((e) => ProjectDto.fromGraphJson(e)).toList();
  }

  @override
  Future<ProjectDto> createProject(ProjectDto dto) async {
    final token = await tokenProvider();

    final response = await httpClient.post(
      _itemsUrl,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      ),
      data: dto.toGraphCreateJson(),
    );

    return ProjectDto.fromGraphJson(response.data);
  }

  @override
  Future<ProjectDto> updateProject(ProjectDto dto) async {
    final token = await tokenProvider();

    if (dto.id == null) {
      throw Exception("ProjectDto.id nie może być null dla update");
    }
    final res = await httpClient.patch(
      _updateUrl(dto.id!),
      data: dto.toGraphUpdateJson(),
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
          "If-Match": "*",
        },
      ),
    );

    return ProjectDto.fromGraphJson(res.data);
  }

  @override
  Future<void> deleteProject(String id) async {
    final token = await tokenProvider();

    await httpClient.delete(
      _deleteUrl(id), // np. /items/5
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "If-Match": "*",
        },
      ),
    );
  }
}
