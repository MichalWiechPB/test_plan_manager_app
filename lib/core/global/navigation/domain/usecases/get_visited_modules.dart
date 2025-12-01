import 'package:test_plan_manager_app/core/global/navigation/data/repository/navigation_repository_impl.dart';

import '../repository/navigation_repository.dart';

class GetVisitedModules {
  final NavigationRepository repository;

  GetVisitedModules(this.repository);

  List<VisitedModule> call(String projectId) {
    return repository.getVisitedModules(projectId);
  }
}
