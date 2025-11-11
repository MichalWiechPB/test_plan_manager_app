import 'package:drift/drift.dart';
import '../data.dart';

part 'test_plans_dao.g.dart';

@DriftAccessor(tables: [TestPlans, Users])
class TestPlansDao extends DatabaseAccessor<AppDatabase> with _$TestPlansDaoMixin {
  final AppDatabase db;

  TestPlansDao(this.db) : super(db);

  // 🔹 Pobierz wszystkie plany
  Future<List<TestPlan>> getAll() => select(db.testPlans).get();

  // 🔹 Obserwuj wszystkie plany
  Stream<List<TestPlan>> watchAll() => select(db.testPlans).watch();

  // 🔹 Wstaw nowy plan
  Future<void> insertPlan(TestPlansCompanion plan) =>
      into(db.testPlans).insert(plan);

  // 🔹 Edytuj istniejący plan
  Future<void> updatePlan(TestPlansCompanion plan) async {
    await into(db.testPlans).insertOnConflictUpdate(plan);
  }

  // 🔹 Usuń plan po ID
  Future<void> deletePlan(String id) =>
      (delete(db.testPlans)..where((tbl) => tbl.id.equals(id))).go();

  // 🔹 Pobierz plany dla modułu
  Future<List<TestPlan>> getPlansByModuleId(String moduleId) {
    return (select(db.testPlans)
      ..where((tbl) => tbl.moduleId.equals(moduleId)))
        .get();
  }
}
