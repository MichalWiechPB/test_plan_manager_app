import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/comment.dart';

abstract class CommentRepository {
  Future<Either<Failure, List<CommentEntity>>> getCommentsForCase(String testCaseId);
  Future<Either<Failure, void>> addComment(CommentEntity comment);
  Future<Either<Failure, void>> deleteComment(String commentId);
}
