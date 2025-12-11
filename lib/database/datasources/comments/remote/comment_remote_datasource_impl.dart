import 'package:test_plan_manager_app/core/config/graph_client.dart';
import 'package:test_plan_manager_app/database/datasources/comments/remote/comment_remote_datasource.dart';
import 'package:test_plan_manager_app/features/comments/data/models/comment_dto.dart';

class CommentsRemoteDataSourceImpl implements CommentsRemoteDataSource {
  final GraphClient graphClient;

  CommentsRemoteDataSourceImpl({
    required this.graphClient,
  });

  static const _commentsListId = "e83e6207-1994-4e4d-9adb-d6fef5e72df3";

  @override
  Future<List<CommentDto>> fetchCommentsForCase(String testCaseId) async {
    final items = await graphClient.getListItems(
      listId: _commentsListId,
      withConsistencyLevel: true,
    );

    return items
        .map((e) => CommentDto.fromGraphJson(e as Map<String, dynamic>))
        .where((c) => c.testCaseId == testCaseId)
        .toList();
  }

  @override
  Future<CommentDto> createComment(CommentDto dto) async {
    final json = await graphClient.createListItem(
      listId: _commentsListId,
      body: dto.toGraphCreateJson(),
    );

    return CommentDto.fromGraphJson(json);
  }

  @override
  Future<CommentDto> updateComment(CommentDto dto) async {
    if (dto.id == null || dto.id!.isEmpty) {
      throw Exception("CommentDto.id is required");
    }

    final json = await graphClient.updateListItemRaw(
      listId: _commentsListId,
      itemId: dto.id!,
      body: dto.toGraphUpdateJson(),
    );

    return CommentDto.fromGraphJson(json);
  }

  @override
  Future<void> deleteComment(String id) async {
    if (id.isEmpty) {
      throw Exception("Comment ID is required");
    }

    await graphClient.deleteListItem(
      listId: _commentsListId,
      itemId: id,
    );
  }
}
