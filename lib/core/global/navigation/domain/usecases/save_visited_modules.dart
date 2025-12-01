import 'package:test_plan_manager_app/core/global/navigation/data/repository/navigation_repository_impl.dart';

import '../repository/navigation_repository.dart';

class SaveVisitedModules {
  final NavigationRepository repository;

  SaveVisitedModules(this.repository);

  void call(String projectId, List<VisitedModule> visited) {
    repository.saveVisitedModules(projectId, visited);
  }
}
