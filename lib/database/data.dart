import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'data.g.dart';

// ------------------- TABLES -------------------

@DataClassName('User')
class Users extends Table {
  TextColumn get id => text()(); // PK
  TextColumn get displayName => text().nullable()();
  TextColumn get email => text().nullable()();
  DateTimeColumn get lastModifiedUtc => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('TestPlan')
class TestPlans extends Table {
  TextColumn get id => text()(); // PK
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get ownerUserId => text().nullable().references(Users, #id)();
  DateTimeColumn get lastModifiedUtc => dateTime().nullable()();
  IntColumn get overallPassed => integer().withDefault(const Constant(0))();
  IntColumn get overallFailed => integer().withDefault(const Constant(0))();
  IntColumn get overallBlocked => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('TestCase')
class TestCases extends Table {
  TextColumn get id => text()(); // PK
  TextColumn get planId => text().references(TestPlans, #id)();
  TextColumn get title => text()();
  TextColumn get status => text()(); // NotRun / Pass / Fail / Blocked
  TextColumn get assignedToUserId => text().nullable().references(Users, #id)();
  TextColumn get expectedResult => text().nullable()();
  DateTimeColumn get lastModifiedUtc => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('TestStep')
class TestSteps extends Table {
  TextColumn get id => text()(); // PK
  TextColumn get testCaseId => text().references(TestCases, #id)();
  IntColumn get stepNumber => integer()();
  TextColumn get description => text()();
  TextColumn get expected => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('Comment')
class Comments extends Table {
  TextColumn get id => text()(); // PK
  TextColumn get testCaseId => text().references(TestCases, #id)();
  TextColumn get content => text()();
  TextColumn get createdByUserId => text().nullable().references(Users, #id)();
  DateTimeColumn get createdAtUtc => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// ------------------- VIEW -------------------

@DriftView(name: 'testPlanWithOwnerView')
abstract class TestPlanWithOwnerView extends View {
  TestPlans get testPlans;
  Users get users;

  Expression<String> get planName => testPlans.name;
  Expression<String> get ownerName =>
      users.displayName ?? const Constant('Brak');

  @override
  Query as() => select([
    testPlans.id,
    planName,
    ownerName,
  ]).from(testPlans).join([
    leftOuterJoin(users, users.id.equalsExp(testPlans.ownerUserId)),
  ]);
}

// ------------------- DATABASE -------------------

@DriftDatabase(
  tables: [
    Users,
    TestPlans,
    TestCases,
    TestSteps,
    Comments,
  ],
  views: [
    TestPlanWithOwnerView,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async => await m.createAll(),
  );

  Future<List<TestPlan>> getAllTestPlans() {
    return select(testPlans).get();
  }
  Stream<List<TestPlan>> watchAllTestPlans() {
    return select(testPlans).watch();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'test_plan_manager.sqlite'));
    return NativeDatabase(file);
  });
}
