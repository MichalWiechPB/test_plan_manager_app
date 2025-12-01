import 'package:test_plan_manager_app/core/global/navigation/data/repository/navigation_repository_impl.dart';

abstract class NavigationRepository {
  void saveVisitedModules(String projectId, List<VisitedModule> visited);

  List<VisitedModule> getVisitedModules(String projectId);

  void clearVisitedModules(String projectId);
}
