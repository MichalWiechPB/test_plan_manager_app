import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import 'package:test_plan_manager_app/database/drift_database/data.dart';

abstract class CommentsLocalDataSource {
  Future<Either<Failure, List<Comment>>> getCommentsForCase(String testCaseId);
  Future<Either<Failure, void>> upsertComment(CommentsCompanion model);
  Future<Either<Failure, void>> deleteComment(String id);
}
