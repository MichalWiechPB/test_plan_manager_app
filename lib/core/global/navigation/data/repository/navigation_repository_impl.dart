import '../../domain/repository/navigation_repository.dart';

class NavigationRepositoryImpl implements NavigationRepository {
  final Map<String, List<VisitedModule>> _visitedCache = {};

  @override
  void saveVisitedModules(String projectId, List<VisitedModule> visited) {
    _visitedCache[projectId] = List.from(visited);
  }

  @override
  List<VisitedModule> getVisitedModules(String projectId) {
    return List<VisitedModule>.from(_visitedCache[projectId] ?? []);
  }

  @override
  void clearVisitedModules(String projectId) {
    _visitedCache.remove(projectId);
  }
}

class VisitedModule {
  final String id;
  final String name;

  VisitedModule(this.id, this.name);
}
