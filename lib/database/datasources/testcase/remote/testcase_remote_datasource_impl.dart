import 'package:test_plan_manager_app/core/config/graph_client.dart';
import 'package:test_plan_manager_app/database/datasources/testcase/remote/testcase_remote_datasource.dart';
import 'package:test_plan_manager_app/features/test_plan_list/data/models/dtos/test_case_dto.dart';

class TestCasesRemoteDataSourceImpl implements TestCasesRemoteDataSource {
  final GraphClient graphClient;

  TestCasesRemoteDataSourceImpl({
    required this.graphClient,
  });

  static const _testCasesListId = "b8fa6ea1-bc98-4e03-8e60-70a7d7053548";

  @override
  Future<List<TestCaseDto>> fetchTestCasesForPlan(String planId) async {
    final items = await graphClient.getListItems(
      listId: _testCasesListId,
      withConsistencyLevel: true,
    );

    return items
        .map((e) => TestCaseDto.fromGraphJson(e as Map<String, dynamic>))
        .where((dto) => dto.planId == planId)
        .toList();
  }

  @override
  Future<TestCaseDto> createTestCase(TestCaseDto dto) async {
    final json = await graphClient.createListItem(
      listId: _testCasesListId,
      body: dto.toGraphCreateJson(),
    );

    return TestCaseDto.fromGraphJson(json);
  }

  @override
  Future<TestCaseDto> updateTestCase(TestCaseDto dto) async {
    if (dto.id == null) {
      throw Exception("TestCaseDto.id cannot be null");
    }

    final json = await graphClient.updateListItemRaw(
      listId: _testCasesListId,
      itemId: dto.id!,
      body: dto.toGraphUpdateJson(),
    );

    return TestCaseDto.fromGraphFieldsJson(json, dto);
  }

  @override
  Future<void> deleteTestCase(String id) async {
    await graphClient.deleteListItem(
      listId: _testCasesListId,
      itemId: id,
    );
  }
}
