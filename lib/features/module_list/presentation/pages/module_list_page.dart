import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_plan_manager_app/core/global/navigation/data/repository/navigation_repository_impl.dart';

import '../bloc/module_bloc.dart';
import '../bloc/module_state.dart';
import '../bloc/module_event.dart';

import '../widgets/build_path_bar.dart';
import '../widgets/module_tile.dart';
import '../widgets/test_plan_tile.dart';

import '../../domain/entities/module.dart';
import '../../domain/entities/test_plan.dart';

class ModuleListPage extends StatefulWidget {
  final String projectId;
  final String? moduleId;
  final String projectName;

  const ModuleListPage({
    super.key,
    required this.projectId,
    required this.projectName,
    this.moduleId,
  });

  @override
  State<ModuleListPage> createState() => _ModuleListPageState();
}

class _ModuleListPageState extends State<ModuleListPage> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.watch<ModuleBloc>().state.maybeWhen(
              success: (_, __, ___, ____, _____, projectName) =>
              projectName ?? widget.projectName,
              orElse: () => widget.projectName,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => _onBackPressed(context),
          ),
        ),
        floatingActionButton: _buildFab(context),
        body: BlocBuilder<ModuleBloc, ModuleState>(
          builder: (context, state) {
            return state.when(
              initial: _renderLoading,
              loading: _renderLoading,
              failure: _renderFailure,
              success: (modules, sub, plans, visited, _, __) {
                return _renderSuccess(
                  context: context,
                  modules: widget.moduleId == null
                      ? modules
                      : (sub[widget.moduleId] ?? const []),
                  testPlans: widget.moduleId != null
                      ? (plans[widget.moduleId] ?? const [])
                      : const [],
                  visited: visited,
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _renderLoading() => const Center(child: CircularProgressIndicator());

  Widget _renderFailure(String msg) =>
      Center(child: Text(msg, style: const TextStyle(fontSize: 16)));

  Widget _renderSuccess({
    required BuildContext context,
    required List<ModuleEntity> modules,
    required List<TestPlanEntity> testPlans,
    required List<VisitedModule> visited,
  }) {
    final filteredModules = modules
        .where((m) => m.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    final filteredPlans = testPlans
        .where((p) => p.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    final empty = filteredModules.isEmpty && filteredPlans.isEmpty;

    return Column(
      children: [
        buildPathBar(context, visited, widget.projectId),
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Szukaj modułu lub planu testów',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (v) => setState(() => searchQuery = v),
          ),
        ),
        Expanded(
          child: empty
              ? const Center(child: Text('Brak wyników'))
              : ListView(
            children: [
              ...filteredModules.map((m) => ModuleTile(module: m)),
              ...filteredPlans.map(
                    (p) => TestPlanTile(
                  plan: p,
                  projectId: widget.projectId,
                  moduleId: widget.moduleId ?? '',
                  projectName: widget.projectName,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onBackPressed(BuildContext context) {
    final bloc = context.read<ModuleBloc>();

    final visited = List<VisitedModule>.from(
      bloc.state.maybeWhen(
        success: (_, __, ___, path, ____, _____) => path,
        orElse: () => const [],
      ),
    );

    if (visited.isEmpty || visited.length == 1) {
      bloc.add(
        ModuleEvent.setVisitedPath(
          projectId: widget.projectId,
          visited: const [],
        ),
      );
      context.go('/projects');
      return;
    }

    visited.removeLast();

    bloc.add(
      ModuleEvent.setVisitedPath(
        projectId: widget.projectId,
        visited: visited,
      ),
    );

    final parent = visited.last;
    context.go(
      '/modules/${widget.projectId}/sub/${parent.id}',
      extra: widget.projectName,
    );
  }

  Widget _buildFab(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.add),
      onSelected: (value) {
        if (value == 'add_module') {
          _openCreateModuleDialog(context);
        } else if (value == 'add_plan' && widget.moduleId != null) {
          _openCreatePlanDialog(context);
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'add_module',
          child: Text('Dodaj moduł'),
        ),
        if (widget.moduleId != null)
          const PopupMenuItem(
            value: 'add_plan',
            child: Text('Dodaj plan testów'),
          ),
      ],
    );
  }

  void _openCreateModuleDialog(BuildContext ctx) {
    final nameCtrl = TextEditingController();
    final descCtrl = TextEditingController();

    showDialog(
      context: ctx,
      builder: (dialogCtx) => AlertDialog(
        title: const Text('Nowy moduł'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameCtrl),
            TextField(controller: descCtrl),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx),
            child: const Text('Anuluj'),
          ),
          ElevatedButton(
            onPressed: () {
              final name = nameCtrl.text.trim();
              if (name.isEmpty) return;

              ctx.read<ModuleBloc>().add(
                ModuleEvent.createModule(
                  module: ModuleEntity(
                    id: 'module_${DateTime.now().millisecondsSinceEpoch}',
                    name: name,
                    description:
                    descCtrl.text.trim().isEmpty ? null : descCtrl.text,
                    projectId: widget.projectId,
                    parentModuleId: widget.moduleId,
                  ),
                ),
              );

              Navigator.pop(dialogCtx);
            },
            child: const Text('Dodaj'),
          ),
        ],
      ),
    );
  }

  void _openCreatePlanDialog(BuildContext ctx) {
    final nameCtrl = TextEditingController();

    showDialog(
      context: ctx,
      builder: (dialogCtx) => AlertDialog(
        title: const Text('Nowy plan testów'),
        content: TextField(controller: nameCtrl),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx),
            child: const Text('Anuluj'),
          ),
          ElevatedButton(
            onPressed: () {
              final name = nameCtrl.text.trim();
              if (name.isEmpty) return;

              ctx.read<ModuleBloc>().add(
                ModuleEvent.createTestPlan(
                  plan: TestPlanEntity(
                    id: 'plan_${DateTime.now().millisecondsSinceEpoch}',
                    name: name,
                    moduleId: widget.moduleId!,
                  ),
                ),
              );

              Navigator.pop(dialogCtx);
            },
            child: const Text('Dodaj'),
          ),
        ],
      ),
    );
  }
}
