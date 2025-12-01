import 'package:test_plan_manager_app/features/comments/data/models/comment_dto.dart';

abstract interface class CommentsRemoteDataSource {
  Future<List<CommentDto>> fetchCommentsForCase(String testCaseId);

  Future<CommentDto> createComment(CommentDto dto);

  Future<CommentDto> updateComment(CommentDto dto);

  Future<void> deleteComment(String graphItemId);
}
