import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repository/comment_repository.dart';

class DeleteComment {
  final CommentRepository repository;
  DeleteComment(this.repository);

  Future<Either<Failure, void>> call(String id) {
    return repository.deleteComment(id);
  }
}
