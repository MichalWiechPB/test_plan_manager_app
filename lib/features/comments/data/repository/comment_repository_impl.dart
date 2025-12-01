import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../database/datasources/comments/local/comment_local_datasource.dart';
import '../../../../database/datasources/comments/remote/comment_remote_datasource.dart';
import '../../../../database/drift_database/mappers/comment_mapper.dart';
import '../../domain/entities/comment.dart';
import '../../domain/repository/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentsLocalDataSource local;
  final CommentsRemoteDataSource remote;

  CommentRepositoryImpl({
    required this.local,
    required this.remote,
  });

  @override
  Stream<Either<Failure, List<CommentEntity>>> getCommentsForCase(String testCaseId) async* {
    final localResult = await local.getCommentsForCase(testCaseId);

    if (localResult.isRight()) {
      yield Right(
        localResult.getOrElse(() => [])
            .map((row) => row.toEntity())
            .toList(),
      );
    }

    try {
      final remoteDtos = await remote.fetchCommentsForCase(testCaseId);

      for (final dto in remoteDtos) {
        await local.upsertComment(dto.toDbModel());
      }

      final refreshed = await local.getCommentsForCase(testCaseId);

      yield refreshed.map(
            (rows) => rows.map((r) => r.toEntity()).toList(),
      );
    } catch (_) {
      yield Left(DatabaseFailure("Nie udało się pobrać komentarzy z serwera."));
    }
  }

  @override
  Future<Either<Failure, CommentEntity>> addComment(CommentEntity entity) async {
    try {
      final dto = entity.toDto();
      final createdDto = await remote.createComment(dto);
      await local.upsertComment(createdDto.toDbModel());
      return Right(createdDto.toEntity());
    } catch (_) {
      return Left(DatabaseFailure("Nie udało się utworzyć komentarza."));
    }
  }

  @override
  Future<Either<Failure, CommentEntity>> updateComment(CommentEntity entity) async {
    try {
      final dto = entity.toDto();
      final updatedDto = await remote.updateComment(dto);
      await local.upsertComment(updatedDto.toDbModel());
      return Right(updatedDto.toEntity());
    } catch (_) {
      return Left(DatabaseFailure("Nie udało się zaktualizować komentarza."));
    }
  }

  @override
  Future<Either<Failure, void>> deleteComment(String id) async {
    try {
      await remote.deleteComment(id);
      await local.deleteComment(id);
      return const Right(null);
    } catch (e, s) {
      return Left(DatabaseFailure(e.toString()));
    }

  }
}
