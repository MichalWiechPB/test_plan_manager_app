import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/comment.dart';

abstract class CommentRepository {
  Stream<Either<Failure, List<CommentEntity>>> getCommentsForCase(String testCaseId);
  Future<Either<Failure, CommentEntity>> addComment(CommentEntity comment);
  Future<Either<Failure, CommentEntity>> updateComment(CommentEntity comment);
  Future<Either<Failure, void>> deleteComment(String id);
}
