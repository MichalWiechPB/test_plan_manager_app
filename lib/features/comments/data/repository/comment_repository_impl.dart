import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../core/error/failures.dart';
import '../../../../database/daos/comments_dao.dart';
import '../../../../database/drift_database/data.dart';
import '../../domain/entities/comment.dart';
import '../../domain/repository/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentsDao dao;
  CommentRepositoryImpl(this.dao);

  @override
  Future<Either<Failure, List<CommentEntity>>> getCommentsForCase(String testCaseId) async {
    try {
      final rows = await dao.getCommentsForCase(testCaseId);
      final result = rows
          .map((r) => CommentEntity(
        id: r.id,
        testCaseId: r.testCaseId,
        content: r.content,
        createdByUserId: r.createdByUserId,
        createdAtUtc: r.createdAtUtc,
      ))
          .toList();
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure('Błąd pobierania komentarzy: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> addComment(CommentEntity comment) async {
    try {
      await dao.insertComment(CommentsCompanion.insert(
        id: comment.id,
        testCaseId: comment.testCaseId,
        content: comment.content,
        createdByUserId: drift.Value(comment.createdByUserId),
        createdAtUtc: drift.Value(comment.createdAtUtc ?? DateTime.now().toUtc()),
      ));
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Nie udało się dodać komentarza: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteComment(String commentId) async {
    try {
      await dao.deleteComment(commentId);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Nie udało się usunąć komentarza: $e'));
    }
  }
}
