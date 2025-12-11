import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/streamusecase.dart';
import '../entities/comment.dart';
import '../repository/comment_repository.dart';

class GetCommentsForCase
    extends StreamUseCase<Either<Failure, List<CommentEntity>>, GetCommentsForCaseParams> {
  final CommentRepository repository;

  GetCommentsForCase(this.repository);

  @override
  Stream<Either<Failure, List<CommentEntity>>> call(GetCommentsForCaseParams params) {
    return repository.getCommentsForCase(params.testCaseId);
  }
}

class GetCommentsForCaseParams {
  final String testCaseId;

  GetCommentsForCaseParams(this.testCaseId);
}
