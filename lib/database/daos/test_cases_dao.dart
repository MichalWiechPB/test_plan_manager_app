import 'package:drift/drift.dart';
import '../data.dart';

part 'test_cases_dao.g.dart';

@DriftAccessor(tables: [TestCases])
class TestCasesDao extends DatabaseAccessor<AppDatabase> with _$TestCasesDaoMixin {
  final AppDatabase db;

  TestCasesDao(this.db) : super(db);

  Future<List<TestCase>> getCasesForPlan(String planId) {
    return (select(db.testCases)..where((tbl) => tbl.planId.equals(planId))).get();
  }

  Future<void> insertTestCase(TestCasesCompanion testCase) =>
      into(db.testCases).insert(testCase);

  Future<void> updateTestCase(TestCasesCompanion testCase) async {
    await into(db.testCases).insertOnConflictUpdate(testCase);
  }

  Future<void> deleteTestCase(String id) =>
      (delete(db.testCases)..where((tbl) => tbl.id.equals(id))).go();
}
