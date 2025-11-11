import 'package:drift/drift.dart';
import '../data.dart';

part 'module_dao.g.dart';

@DriftAccessor(tables: [Modules])
class ModuleDao extends DatabaseAccessor<AppDatabase> with _$ModuleDaoMixin {
  final AppDatabase db;

  ModuleDao(this.db) : super(db);

  // 🔹 Pobierz wszystkie moduły
  Future<List<Module>> getAllModules() => select(db.modules).get();

  // 🔹 Obserwuj wszystkie moduły (do UI)
  Stream<List<Module>> watchAllModules() => select(db.modules).watch();

  // 🔹 Moduły główne dla projektu (bez parentModuleId)
  Future<List<Module>> getModulesForProject(String projectId) {
    return (select(db.modules)
      ..where((tbl) => tbl.projectId.equals(projectId))
      ..where((tbl) => tbl.parentModuleId.isNull()))
        .get();
  }

  // 🔹 Submoduły dla modułu nadrzędnego
  Future<List<Module>> getSubmodules(String parentModuleId) {
    return (select(db.modules)
      ..where((tbl) => tbl.parentModuleId.equals(parentModuleId)))
        .get();
  }

  // 🔹 Dodaj moduł
  Future<void> insertModule(ModulesCompanion module) =>
      into(db.modules).insert(module);

  // 🔹 Edytuj istniejący moduł (bez duplikatów)
  Future<void> updateModule(ModulesCompanion module) async {
    await into(db.modules).insertOnConflictUpdate(module);
  }

  // 🔹 Usuń moduł po ID
  Future<void> deleteModule(String id) =>
      (delete(db.modules)..where((tbl) => tbl.id.equals(id))).go();
}
