import 'package:dio/dio.dart';
import 'package:test_plan_manager_app/database/datasources/comments/remote/comment_remote_datasource.dart';
import 'package:test_plan_manager_app/features/comments/data/models/comment_dto.dart';

class CommentsRemoteDataSourceImpl implements CommentsRemoteDataSource {
  final Dio httpClient;
  final Future<String> Function() tokenProvider;

  CommentsRemoteDataSourceImpl({
    required this.httpClient,
    required this.tokenProvider,
  });

  static const _siteId =
      "wiechmichal01gmail.sharepoint.com,"
      "53d02a82-2aa5-49bf-abd9-0edf67d7e2e7,"
      "cac5f5b6-314f-43f2-a373-48ffb18f5d0a";

  static const _commentsListId = "e83e6207-1994-4e4d-9adb-d6fef5e72df3";

  String get _itemsUrl =>
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_commentsListId/items?expand=fields";

  String _updateUrl(String id) =>
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_commentsListId/items/$id/fields";

  String _deleteUrl(String id) =>
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_commentsListId/items/$id";

  @override
  Future<List<CommentDto>> fetchCommentsForCase(String testCaseId) async {
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

    final list = res.data["value"] as List;

    final dtos =
    list.map((item) => CommentDto.fromGraphJson(item)).toList();

    return dtos.where((c) => c.testCaseId == testCaseId).toList();
  }

  @override
  Future<CommentDto> createComment(CommentDto dto) async {
    final token = await tokenProvider();

    final res = await httpClient.post(
      _itemsUrl,
      data: dto.toGraphCreateJson(),
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      ),
    );

    return CommentDto.fromGraphJson(res.data);
  }

  @override
  Future<CommentDto> updateComment(CommentDto dto) async {
    if (dto.id == null || dto.id!.isEmpty) {
      throw Exception("CommentDto.id (SharePoint item ID) is required for update");
    }

    final token = await tokenProvider();

    await httpClient.patch(
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

    final refreshed = await httpClient.get(
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_commentsListId/items/${dto.id}?expand=fields",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    return CommentDto.fromGraphJson(refreshed.data);
  }

  @override
  Future<void> deleteComment(String id) async {
    if (id.isEmpty) {
      throw Exception("SharePoint item ID is required for delete");
    }

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
