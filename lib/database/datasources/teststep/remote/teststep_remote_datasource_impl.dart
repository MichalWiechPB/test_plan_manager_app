import 'package:dio/dio.dart';
import 'package:test_plan_manager_app/features/test_step_list/data/models/dtos/test_step_dto.dart';
import 'teststep_remote_datasource.dart';

class TestStepRemoteDataSourceImpl implements TestStepRemoteDataSource {
  final Dio httpClient;
  final Future<String> Function() tokenProvider;

  TestStepRemoteDataSourceImpl({
    required this.httpClient,
    required this.tokenProvider,
  });

  static const _siteId =
      "wiechmichal01gmail.sharepoint.com,"
      "53d02a82-2aa5-49bf-abd9-0edf67d7e2e7,"
      "cac5f5b6-314f-43f2-a373-48ffb18f5d0a";

  static const _testStepsListId = "7c8bed07-f4a9-4133-bf78-f0fcfe1dd72a";

  String get _stepsItemsUrl =>
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_testStepsListId/items?expand=fields";

  @override
  Future<List<TestStepDto>> fetchStepsForCase(String testCaseId) async {
    final token = await tokenProvider();

    final res = await httpClient.get(
      _stepsItemsUrl,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "ConsistencyLevel": "eventual",
        },
      ),
    );

    final List items = res.data["value"];
    final dtos = items.map((e) => TestStepDto.fromGraphJson(e)).toList();
    return dtos.where((s) => s.testCaseId == testCaseId).toList();
  }
}
