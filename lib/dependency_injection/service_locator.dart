import 'package:get_it/get_it.dart';
import '../core/global/navigation/data/repository/navigation_repository_impl.dart';
import '../core/global/navigation/domain/repository/navigation_repository.dart';
import '../core/global/navigation/domain/usecases/get_visited_modules.dart';
import '../core/global/navigation/domain/usecases/save_visited_modules.dart';

// 🧩 DATABASE
import '../database/daos/comments_dao.dart';
import '../database/data.dart';
import '../database/daos/module_dao.dart';
import '../database/daos/project_dao.dart';
import '../database/daos/test_cases_dao.dart';
import '../database/daos/test_plans_dao.dart';
import '../database/daos/test_steps_dao.dart';

// 📁 PROJECTS
import '../features/comments/data/repository/comment_repository_impl.dart';
import '../features/comments/domain/repository/comment_repository.dart';
import '../features/comments/domain/usecases/add_comment.dart';
import '../features/comments/domain/usecases/delete_comment.dart';
import '../features/comments/domain/usecases/get_comments_for_case.dart';
import '../features/comments/presentation/bloc/comment_bloc.dart';
import '../features/project_list/data/repository/project_repository_impl.dart';
import '../features/project_list/domain/repository/project_repository.dart';
import '../features/project_list/domain/usecases/create_new_project.dart';
import '../features/project_list/domain/usecases/delete_project.dart';
import '../features/project_list/domain/usecases/get_all_projects.dart';
import '../features/project_list/domain/usecases/update_project.dart';
import '../features/project_list/presentation/bloc/project_bloc.dart';

// 📦 MODULES
import '../features/module_list/data/repository/module_repository_impl.dart';
import '../features/module_list/domain/repository/module_repository.dart';
import '../features/module_list/domain/usecases/get_modules_for_project.dart';
import '../features/module_list/domain/usecases/get_submodules_for_module.dart';
import '../features/module_list/domain/usecases/get_test_plan_for_modules.dart';
import '../features/module_list/domain/usecases/create_module.dart';
import '../features/module_list/domain/usecases/update_module.dart';
import '../features/module_list/domain/usecases/delete_module.dart';
import '../features/module_list/domain/usecases/create_test_plan.dart';
import '../features/module_list/domain/usecases/update_test_plan.dart';
import '../features/module_list/domain/usecases/delete_test_plan.dart';
import '../features/module_list/presentation/bloc/module_bloc.dart';

// 🧪 TEST PLANS
import '../features/test_case_list/domain/usecases/create_test_step.dart';
import '../features/test_case_list/domain/usecases/delete_test_step.dart';
import '../features/test_case_list/domain/usecases/update_test_step.dart';
import '../features/test_case_list/domain/usecases/update_test_step_order.dart';
import '../features/test_plan_list/data/repositories/test_plan_repository_impl.dart';
import '../features/test_plan_list/domain/repositories/test_plan_repository.dart';
import '../features/test_plan_list/domain/usecases/get_test_cases_for_plan.dart';
import '../features/test_plan_list/domain/usecases/create_test_case.dart';
import '../features/test_plan_list/domain/usecases/update_test_case.dart';
import '../features/test_plan_list/domain/usecases/delete_test_case.dart';
import '../features/test_plan_list/presentation/bloc/test_plan_bloc.dart';

// ✅ TEST CASES
import '../features/test_case_list/data/repository/test_case_repository_impl.dart';
import '../features/test_case_list/domain/repository/test_case_repository.dart';
import '../features/test_case_list/domain/usecases/get_teststeps_for_case.dart';
import '../features/test_case_list/presentation/bloc/test_case_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // 🧩 Database setup
  final db = AppDatabase();
  sl.registerSingleton<AppDatabase>(db);

  sl.registerLazySingleton(() => ProjectDao(db));
  sl.registerLazySingleton(() => ModuleDao(db));
  sl.registerLazySingleton(() => TestPlansDao(db));
  sl.registerLazySingleton(() => TestCasesDao(db));
  sl.registerLazySingleton(() => TestStepsDao(db));

  // 📁 Projects
  sl.registerLazySingleton<ProjectRepository>(() => ProjectRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetAllProjects(sl()));
  sl.registerLazySingleton(() => CreateProject(sl()));
  sl.registerLazySingleton(() => UpdateProject(sl()));
  sl.registerLazySingleton(() => DeleteProject(sl()));
  sl.registerFactory(() => ProjectBloc(sl(), sl(), sl(), sl()));

  // 📦 Modules
  sl.registerLazySingleton<ModuleRepository>(
          () => ModuleRepositoryImpl(sl<ModuleDao>(), sl<TestPlansDao>()));
  sl.registerLazySingleton(() => GetModulesForProject(sl()));
  sl.registerLazySingleton(() => GetSubmodulesForModule(sl()));
  sl.registerLazySingleton(() => GetTestPlansForModule(sl()));
  sl.registerLazySingleton(() => CreateModule(sl()));
  sl.registerLazySingleton(() => UpdateModule(sl()));
  sl.registerLazySingleton(() => DeleteModule(sl()));
  sl.registerLazySingleton(() => CreateTestPlan(sl()));
  sl.registerLazySingleton(() => UpdateTestPlan(sl()));
  sl.registerLazySingleton(() => DeleteTestPlan(sl()));
  sl.registerFactory(() => ModuleBloc(
    getModulesForProject: sl(),
    getSubmodulesForModule: sl(),
    getTestPlansForModule: sl(),
    saveVisitedModules: sl(),
    getVisitedModules: sl(),
    createModule: sl(),
    updateModule: sl(),
    deleteModule: sl(),
    createTestPlan: sl(),
    updateTestPlan: sl(),
    deleteTestPlan: sl(),
  ));
  //COMMENTS
  sl.registerLazySingleton(() => CommentsDao(sl()));
  sl.registerLazySingleton<CommentRepository>(() => CommentRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetCommentsForCase(sl()));
  sl.registerLazySingleton(() => AddComment(sl()));
  sl.registerLazySingleton(() => DeleteComment(sl()));
  sl.registerFactory(() => CommentBloc(
    getCommentsForCase: sl(),
    addComment: sl(),
    deleteComment: sl(),
  ));


  // 🧪 Test Plans
  sl.registerLazySingleton<TestPlanRepository>(
          () => TestPlanRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetTestCasesForPlan(sl()));
  sl.registerLazySingleton(() => CreateTestCase(sl()));
  sl.registerLazySingleton(() => UpdateTestCase(sl()));
  sl.registerLazySingleton(() => DeleteTestCase(sl()));
  sl.registerFactory(() => TestPlanBloc(
    getTestCasesForPlan: sl(),
    createTestCase: sl(),
    updateTestCase: sl(),
    deleteTestCase: sl(),
  ));

  // ✅ Test Cases / Steps
  sl.registerLazySingleton(() => GetTestStepsForCase(sl()));
  sl.registerLazySingleton(() => CreateTestStep(sl()));
  sl.registerLazySingleton(() => UpdateTestStep(sl()));
  sl.registerLazySingleton(() => DeleteTestStep(sl()));
  sl.registerLazySingleton(() => UpdateTestStepOrder(sl()));
  sl.registerLazySingleton<TestCaseRepository>(
          () => TestStepRepositoryImpl(sl()));
  sl.registerFactory(() => TestStepBloc(getTestStepsForCase: sl(),
    createTestStep: sl(),
    updateTestStep: sl(),
    deleteTestStep: sl(),
    updateTestStepOrder: sl(),));

  // 🌍 Global Navigation
  sl.registerLazySingleton<NavigationRepository>(
          () => NavigationRepositoryImpl());
  sl.registerLazySingleton(() => SaveVisitedModules(sl()));
  sl.registerLazySingleton(() => GetVisitedModules(sl()));
}
