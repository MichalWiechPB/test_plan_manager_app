import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/core/error/failures.dart';
import 'package:test_plan_manager_app/database/daos/comments_dao.dart';
import 'package:test_plan_manager_app/database/drift_database/data.dart';
import 'package:test_plan_manager_app/database/datasources/comments/local/comment_local_datasource.dart';

class CommentsLocalDataSourceImpl implements CommentsLocalDataSource {
  final CommentsDao dao;

  CommentsLocalDataSourceImpl(this.dao);

  @override
  Future<Either<Failure, List<Comment>>> getCommentsForCase(String testCaseId) async {
    try {
      final rows = await dao.getCommentsForCase(testCaseId);
      return Right(rows);
    } catch (e) {
      return Left(DatabaseFailure("Błąd pobierania komentarzy: $e"));
    }
  }

  @override
  Future<Either<Failure, void>> upsertComment(CommentsCompanion model) async {
    try {
      await dao.upsertComment(model);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Nie udało się zapisać komentarza: $e"));
    }
  }

  @override
  Future<Either<Failure, void>> deleteComment(String id) async {
    try {
      await dao.deleteComment(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Nie udało się usunąć komentarza: $e"));
    }
  }
}
