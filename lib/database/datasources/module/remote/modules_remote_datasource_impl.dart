import 'package:test_plan_manager_app/core/config/graph_client.dart';
import 'package:test_plan_manager_app/features/module_list/data/models/dtos/module_dto.dart';
import 'package:test_plan_manager_app/features/module_list/data/models/dtos/test_plan_dto.dart';
import 'modules_remote_datasource.dart';

class ModuleRemoteDataSourceImpl implements ModuleRemoteDataSource {
  final GraphClient graphClient;

  ModuleRemoteDataSourceImpl({
    required this.graphClient,
  });

  static const _modulesListId = "1eea8620-9100-4294-aba3-bc9392ff8286";
  static const _testPlansListId = "7cde5b25-71f8-4fd3-92b3-1cd7d2bb967a";

  @override
  Future<List<ModuleDto>> fetchModulesForProject(String projectId) async {
    final items = await graphClient.getListItems(
      listId: _modulesListId,
    );

    return items
        .map((e) => ModuleDto.fromGraphJson(e as Map<String, dynamic>))
        .where((m) => m.projectId == projectId)
        .toList();
  }

  @override
  Future<List<TestPlanDto>> fetchTestPlansForModule(String moduleId) async {
    final items = await graphClient.getListItems(
      listId: _testPlansListId,
    );

    return items
        .map((e) => TestPlanDto.fromGraphJson(e as Map<String, dynamic>))
        .where((p) => p.moduleId == moduleId)
        .toList();
  }

  @override
  Future<ModuleDto> createModule(ModuleDto dto) async {
    final json = await graphClient.createListItem(
      listId: _modulesListId,
      body: {
        "fields": {
          "Title": dto.name,
          "name": dto.name,
          "description": dto.description,
          "projectId": dto.projectId,
          "parentModuleId": dto.parentModuleId,
        },
      },
    );

    return ModuleDto.fromGraphJson(json);
  }

  @override
  Future<TestPlanDto> createTestPlan(TestPlanDto dto) async {
    final json = await graphClient.createListItem(
      listId: _testPlansListId,
      body: dto.toGraphCreateJson(),
    );

    return TestPlanDto.fromGraphJson(json);
  }

  @override
  Future<ModuleDto> updateModule(ModuleDto dto) async {
    final json = await graphClient.updateListItemRaw(
      listId: _modulesListId,
      itemId: dto.id,
      body: dto.toGraphUpdateJson(),
    );

    return ModuleDto.fromGraphJson(json);
  }



  @override
  Future<TestPlanDto> updateTestPlan(TestPlanDto dto) async {
    if (dto.id == null) {
      throw Exception("TestPlanDto.id cannot be null");
    }

    final json = await graphClient.updateListItemRaw(
      listId: _testPlansListId,
      itemId: dto.id!,
      body: dto.toGraphUpdateJson(),
    );

    return TestPlanDto.fromGraphJson(json);
  }

  @override
  Future<void> deleteModule(String id) async {
    await graphClient.deleteListItem(
      listId: _modulesListId,
      itemId: id,
    );
  }

  @override
  Future<void> deleteTestPlan(String id) async {
    await graphClient.deleteListItem(
      listId: _testPlansListId,
      itemId: id,
    );
  }
}
