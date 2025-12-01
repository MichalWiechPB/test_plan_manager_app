import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_plan_manager_app/core/global/navigation/data/repository/navigation_repository_impl.dart';
import '../bloc/module_bloc.dart';
import '../bloc/module_event.dart';
import '../bloc/module_state.dart';
import '../../../module_list/domain/entities/module.dart';
import 'preview_item.dart';

class ModuleTile extends StatefulWidget {
  final ModuleEntity module;

  const ModuleTile({super.key, required this.module});

  @override
  State<ModuleTile> createState() => _ModuleTileState();
}

class _ModuleTileState extends State<ModuleTile> {
  bool _isExpanded = false;

  void _togglePreview() {
    setState(() => _isExpanded = !_isExpanded);

    if (_isExpanded) {
      final bloc = context.read<ModuleBloc>();
      final id = widget.module.id;

      final hasPreview = bloc.state.maybeWhen(
        success: (_, submodules, testPlans, __, ___, ____) {
          final subs = submodules[id];
          final plans = testPlans[id];
          return (subs != null && subs.isNotEmpty) ||
              (plans != null && plans.isNotEmpty);
        },
        orElse: () => false,
      );

      if (!hasPreview) {
        bloc.add(
          ModuleEvent.loadPreviewForModule(moduleId: id),
        );
      }
    }
  }

  void _openModule(BuildContext context) {
    final bloc = context.read<ModuleBloc>();
    final m = widget.module;

    final visited = List<VisitedModule>.from(
      bloc.state.maybeWhen(
        success: (_, __, ___, visited, ____, _____) => visited,
        orElse: () => const [],
      ),
    );

    // zapobiega duplikatom
    if (!visited.any((e) => e.id == m.id)) {
      visited.add(VisitedModule(m.id, m.name));
    }

    bloc.add(
      ModuleEvent.setVisitedPath(
        projectId: m.projectId,
        visited: visited,
      ),
    );

    context.go('/modules/${m.projectId}/sub/${m.id}');
  }


  @override
  Widget build(BuildContext context) {
    final state = context.watch<ModuleBloc>().state;
    final m = widget.module;

    final subs = state.maybeWhen(
      success: (_, submodules, __, ___, ____, ______) =>
      submodules[m.id] ?? const [],
      orElse: () => const [],
    );

    final plans = state.maybeWhen(
      success: (_, __, testPlans, ___, ____, ______) =>
      testPlans[m.id] ?? const [],
      orElse: () => const [],
    );

    final previewItems = [
      ...subs.map((s) => PreviewItem(name: s.name)),
      ...plans.map((p) => PreviewItem(name: p.name)),
    ].take(3).toList();

    final description = m.description;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 2.0,
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: _togglePreview,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      m.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (v) {
                      if (v == 'edit') _openEditDialog(context);
                      if (v == 'delete') _confirmDelete(context);
                    },
                    itemBuilder: (context) => const [
                      PopupMenuItem(
                        value: 'edit',
                        child: Text('Edytuj'),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Text('Usuń'),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: () => _openModule(context),
                    splashRadius: 22.0,
                  ),
                ],
              ),
              if (description != null && description.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black54),
                  ),
                ),
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 200),
                crossFadeState: _isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstChild: const SizedBox.shrink(),
                secondChild: Padding(
                  padding:
                  const EdgeInsets.only(left: 22.0, top: 6.0, bottom: 6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...previewItems.map(
                            (item) => GestureDetector(
                          onTap: () => _openModule(context),
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(vertical: 2.0),
                            child: Text(
                              '• ${item.name}',
                              style: const TextStyle(fontSize: 13.0),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      if (subs.length + plans.length > 3)
                        TextButton(
                          onPressed: () => _openModule(context),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: const Text('Zobacz więcej'),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openEditDialog(BuildContext context) {
    final nameCtrl = TextEditingController(text: widget.module.name);
    final descCtrl =
    TextEditingController(text: widget.module.description ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edytuj moduł'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Nazwa'),
            ),
            TextField(
              controller: descCtrl,
              decoration: const InputDecoration(labelText: 'Opis'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Anuluj'),
          ),
          ElevatedButton(
            onPressed: () {
              final updated = ModuleEntity(
                id: widget.module.id,
                name: nameCtrl.text.trim(),
                description: descCtrl.text.trim().isEmpty
                    ? null
                    : descCtrl.text.trim(),
                projectId: widget.module.projectId,
                parentModuleId: widget.module.parentModuleId,
              );

              context.read<ModuleBloc>().add(
                ModuleEvent.updateModule(module: updated),
              );
              Navigator.pop(ctx);
            },
            child: const Text('Zapisz'),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Usuń moduł'),
        content: Text('Czy na pewno chcesz usunąć „${widget.module.name}”?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Anuluj'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ModuleBloc>().add(
                ModuleEvent.deleteModule(moduleId: widget.module.id),
              );
              Navigator.pop(ctx);
            },
            child: const Text('Usuń'),
          ),
        ],
      ),
    );
  }
}
