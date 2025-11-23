import 'package:drift/drift.dart';
import '../drift_database/data.dart';

part 'comments_dao.g.dart';

@DriftAccessor(tables: [Comments, Users])
class CommentsDao extends DatabaseAccessor<AppDatabase> with _$CommentsDaoMixin {
  final AppDatabase db;
  CommentsDao(this.db) : super(db);

  Future<List<Comment>> getCommentsForCase(String testCaseId) {
    return (select(db.comments)
      ..where((tbl) => tbl.testCaseId.equals(testCaseId))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAtUtc)]))
        .get();
  }

  Future<void> insertComment(CommentsCompanion comment) =>
      into(db.comments).insert(comment);

  Future<void> deleteComment(String id) async =>
      (delete(db.comments)..where((tbl) => tbl.id.equals(id))).go();
}
