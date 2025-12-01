import 'package:dio/dio.dart';
import 'package:test_plan_manager_app/database/datasources/testcase/remote/testcase_remote_datasource.dart';
import 'package:test_plan_manager_app/features/test_plan_list/data/models/dtos/test_case_dto.dart';

class TestCasesRemoteDataSourceImpl implements TestCasesRemoteDataSource {
  final Dio httpClient;
  final Future<String> Function() tokenProvider;

  TestCasesRemoteDataSourceImpl({
    required this.httpClient,
    required this.tokenProvider,
  });

  static const _siteId =
      "wiechmichal01gmail.sharepoint.com,"
      "53d02a82-2aa5-49bf-abd9-0edf67d7e2e7,"
      "cac5f5b6-314f-43f2-a373-48ffb18f5d0a";

  static const _testCasesListId = "b8fa6ea1-bc98-4e03-8e60-70a7d7053548";

  String get _itemsUrl =>
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_testCasesListId/items?expand=fields";

  String _updateUrl(String id) =>
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_testCasesListId/items/$id/fields";

  String _deleteUrl(String id) =>
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_testCasesListId/items/$id";

  @override
  Future<List<TestCaseDto>> fetchTestCasesForPlan(String planId) async {
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
    return data
        .map((e) => TestCaseDto.fromGraphJson(e))
        .where((dto) => dto.planId == planId)
        .toList();
  }

  @override
  Future<TestCaseDto> createTestCase(TestCaseDto dto) async {
    final token = await tokenProvider();

    final res = await httpClient.post(
      _itemsUrl,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      ),
      data: dto.toGraphCreateJson(),
    );
    print("📦 GRAPH CREATE CASE response:");
    print(res.statusCode);
    print(res.data);

    return TestCaseDto.fromGraphJson(res.data);
  }

  @override
  Future<TestCaseDto> updateTestCase(TestCaseDto dto) async {
    final token = await tokenProvider();

    if (dto.id == null) {
      throw Exception("TestCaseDto.id cannot be null for update");
    }

    try {
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

      return TestCaseDto.fromGraphFieldsJson(res.data, dto);
    } catch (e) {
      print("UPDATE CASE FAILED ❌");
      print("ERROR: $e");
      rethrow;
    }
  }

  @override
  Future<void> deleteTestCase(String id) async {
    final token = await tokenProvider();

    await httpClient.delete(
      _deleteUrl(id),
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "If-Match": "*",
        },
      ),
    );
  }
}
