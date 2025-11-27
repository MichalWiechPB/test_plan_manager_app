import 'package:dio/dio.dart';
import 'package:test_plan_manager_app/features/module_list/data/models/dtos/module_dto.dart';
import 'package:test_plan_manager_app/features/module_list/data/models/dtos/test_plan_dto.dart';
import 'modules_remote_datasource.dart';

class ModuleRemoteDataSourceImpl implements ModuleRemoteDataSource {
  final Dio httpClient;
  final Future<String> Function() tokenProvider;

  ModuleRemoteDataSourceImpl({
    required this.httpClient,
    required this.tokenProvider,
  });

  static const _siteId =
      "wiechmichal01gmail.sharepoint.com,"
      "53d02a82-2aa5-49bf-abd9-0edf67d7e2e7,"
      "cac5f5b6-314f-43f2-a373-48ffb18f5d0a";

  static const _modulesListId = "1eea8620-9100-4294-aba3-bc9392ff8286";
  static const _testPlansListId = "7cde5b25-71f8-4fd3-92b3-1cd7d2bb967a";

  String get _modulesItemsUrl =>
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_modulesListId/items?expand=fields";

  String get _testPlansItemsUrl =>
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_testPlansListId/items?expand=fields";

  @override
  Future<List<ModuleDto>> fetchModulesForProject(String projectId) async {
    final token = await tokenProvider();

    final res = await httpClient.get(
      _modulesItemsUrl,
      options: Options(headers: {
        "Authorization": "Bearer $token",
      }),
    );

    final List items = res.data["value"];
    final dtos = items.map((e) => ModuleDto.fromGraphJson(e)).toList();

    return dtos.where((m) => m.projectId == projectId).toList();
  }

  @override
  Future<List<TestPlanDto>> fetchTestPlansForModule(String moduleId) async {
    final token = await tokenProvider();

    final res = await httpClient.get(
      _testPlansItemsUrl,
      options: Options(headers: {
        "Authorization": "Bearer $token",
      }),
    );

    final List items = res.data["value"];
    final dtos = items.map((e) => TestPlanDto.fromGraphJson(e)).toList();

    return dtos.where((p) => p.moduleId == moduleId).toList();
  }

  @override
  Future<ModuleDto> createModule(ModuleDto dto) async {
    final token = await tokenProvider();

    final body = {
      "fields": {
        "Title": dto.name,
        "name": dto.name,
        "description": dto.description,
        "projectId": dto.projectId,
        "parentModuleId": dto.parentModuleId,
      }
    };

    final res = await httpClient.post(
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_modulesListId/items",
      data: body,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        validateStatus: (_) => true, // DEBUG
      ),
    );

    print("CREATE MODULE STATUS = ${res.statusCode}");
    print("CREATE MODULE BODY = ${res.data}");

    if (res.statusCode! >= 200 && res.statusCode! < 300) {
      return ModuleDto.fromGraphJson(res.data);
    }

    throw Exception("Graph create error: ${res.data}");
  }

  @override
  Future<TestPlanDto> createTestPlan(TestPlanDto dto) async {
    final token = await tokenProvider();

    final res = await httpClient.post(
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_testPlansListId/items",
      options: Options(headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      }),
      data: dto.toGraphCreateJson(),
    );

    return TestPlanDto.fromGraphJson(res.data);
  }

  @override
  Future<ModuleDto> updateModule(ModuleDto dto) async {
    final token = await tokenProvider();

    if (dto.id == null) {
      throw Exception("ModuleDto.id == null");
    }

    final body = <String, dynamic>{
      "Title": dto.name,
      "name": dto.name,
      "description": dto.description,
      "projectId": dto.projectId,
      "parentModuleId": dto.parentModuleId,
    };

    body.removeWhere((key, value) => value == null);

    final res = await httpClient.patch(
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_modulesListId/items/${dto.id}/fields",
      data: body,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
          "If-Match": "*",
        },
        validateStatus: (_) => true, // żeby zobaczyć error zamiast exception
      ),
    );

    print("UPDATE MODULE STATUS = ${res.statusCode}");
    print("UPDATE MODULE BODY = ${res.data}");

    if (res.statusCode != null && res.statusCode! >= 200 && res.statusCode! < 300) {
      return ModuleDto.fromGraphJson(res.data);
    }

    throw Exception("Graph update module error: ${res.statusCode} ${res.data}");
  }

  @override
  Future<TestPlanDto> updateTestPlan(TestPlanDto dto) async {
    final token = await tokenProvider();
    if (dto.id == null) throw Exception("TestPlanDto.id == null");

    final res = await httpClient.patch(
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_testPlansListId/items/${dto.id}/fields",
      data: dto.toGraphUpdateJson(),
      options: Options(headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
        "If-Match": "*",
      }),
    );

    return TestPlanDto.fromGraphJson(res.data);
  }

  @override
  Future<void> deleteModule(String id) async {
    final token = await tokenProvider();

    await httpClient.delete(
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_modulesListId/items/$id",
      options: Options(headers: {
        "Authorization": "Bearer $token",
        "If-Match": "*",
      }),
    );
  }

  @override
  Future<void> deleteTestPlan(String id) async {
    final token = await tokenProvider();

    await httpClient.delete(
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_testPlansListId/items/$id",
      options: Options(headers: {
        "Authorization": "Bearer $token",
        "If-Match": "*",
      }),
    );
  }
}
