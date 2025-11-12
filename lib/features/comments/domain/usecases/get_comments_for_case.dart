import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/comment.dart';
import '../repository/comment_repository.dart';

class GetCommentsForCase {
  final CommentRepository repository;
  GetCommentsForCase(this.repository);

  Future<Either<Failure, List<CommentEntity>>> call(String testCaseId) {
    return repository.getCommentsForCase(testCaseId);
  }
}
