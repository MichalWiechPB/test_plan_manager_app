import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/comment.dart';
import '../repository/comment_repository.dart';

class AddComment {
  final CommentRepository repository;
  AddComment(this.repository);

  Future<Either<Failure, void>> call(CommentEntity comment) {
    return repository.addComment(comment);
  }
}
