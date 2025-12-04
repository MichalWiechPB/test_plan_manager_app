import 'package:test_plan_manager_app/core/config/graph_client.dart';
import 'package:test_plan_manager_app/database/datasources/teststep/remote/teststep_remote_datasource.dart';
import 'package:test_plan_manager_app/features/test_step_list/data/models/dtos/test_step_dto.dart';

class TestStepRemoteDataSourceImpl implements TestStepRemoteDataSource {
  final GraphClient graphClient;

  TestStepRemoteDataSourceImpl({
    required this.graphClient,
  });

  static const _testStepsListId = "7c8bed07-f4a9-4133-bf78-f0fcfe1dd72a";

  @override
  Future<List<TestStepDto>> fetchStepsForCase(String testCaseId) async {
    final items = await graphClient.getListItems(
      listId: _testStepsListId,
      withConsistencyLevel: true,
    );

    return items
        .map((e) => TestStepDto.fromGraphJson(e as Map<String, dynamic>))
        .where((s) => s.testCaseId == testCaseId)
        .toList();
  }

  @override
  Future<TestStepDto> createStep(TestStepDto dto) async {
    final json = await graphClient.createListItem(
      listId: _testStepsListId,
      body: dto.toGraphCreateJson(),
    );

    return TestStepDto.fromGraphJson(json);
  }

  @override
  Future<TestStepDto> updateStep(TestStepDto dto) async {
    if (dto.id == null) {
      throw Exception("TestStepDto.id cannot be null");
    }

    final json = await graphClient.updateListItemRaw(
      listId: _testStepsListId,
      itemId: dto.id!,
      body: dto.toGraphUpdateJson(),
    );

    return TestStepDto.fromGraphFieldsJson(json, dto);
  }

  @override
  Future<void> deleteStep(String id) async {
    await graphClient.deleteListItem(
      listId: _testStepsListId,
      itemId: id,
    );
  }
}
