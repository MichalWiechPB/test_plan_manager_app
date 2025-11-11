import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../module_list/domain/entities/module.dart';
import '../bloc/module_bloc.dart';
import '../bloc/module_event.dart';
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

      final hasPreview =
          (bloc.state.submodules[id]?.isNotEmpty ?? false) ||
              (bloc.state.testPlans[id]?.isNotEmpty ?? false);

      if (!hasPreview) {
        bloc.add(LoadPreviewForModuleEvent(id));
      }
    }
  }

  void _goToModule(BuildContext context) {
    final m = widget.module;
    context.read<ModuleBloc>().add(GetSubmodulesForModuleEvent(m.id));

    final routerState = GoRouterState.of(context);
    final projectName = routerState.extra as String? ?? 'Modules';

    context.go('/modules/${m.projectId}/sub/${m.id}', extra: projectName);
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ModuleBloc>().state;
    final m = widget.module;

    final submodules = state.submodules[m.id] ?? [];
    final testPlans = state.testPlans[m.id] ?? [];
    final preview = [
      ...submodules.map((s) => PreviewItem(name: s.name)),
      ...testPlans.map((p) => PreviewItem(name: p.name)),
    ].take(3).toList();

    const double indent = 22;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: _togglePreview,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Nagłówek z nazwą, menu i strzałką
              Row(
                children: [
                  Expanded(
                    child: Text(
                      m.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (v) {
                      if (v == 'edit') _openEditDialog(context);
                      if (v == 'delete') _confirmDelete(context);
                    },
                    itemBuilder: (context) => const [
                      PopupMenuItem(value: 'edit', child: Text('Edytuj')),
                      PopupMenuItem(value: 'delete', child: Text('Usuń')),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: () => _goToModule(context),
                    splashRadius: 22,
                  ),
                ],
              ),

              if ((m.description ?? '').isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    m.description!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black54),
                  ),
                ),

              // 🔹 Sekcja podglądu (preview)
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 200),
                crossFadeState: _isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstChild: const SizedBox.shrink(),
                secondChild: Padding(
                  padding: const EdgeInsets.only(top: 6, left: indent, bottom: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...preview.map(
                            (item) => GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => _goToModule(context),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Text(
                              '• ${item.name}',
                              style: const TextStyle(fontSize: 13),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      if (submodules.length + testPlans.length > 3)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 24),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () => _goToModule(context),
                            child: const Text('Zobacz więcej'),
                          ),
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

  // ——— Edycja modułu
  void _openEditDialog(BuildContext context) {
    final nameCtrl = TextEditingController(text: widget.module.name);
    final descCtrl = TextEditingController(text: widget.module.description ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edytuj moduł'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Nazwa')),
            TextField(controller: descCtrl, decoration: const InputDecoration(labelText: 'Opis')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Anuluj')),
          ElevatedButton(
            onPressed: () {
              final name = nameCtrl.text.trim();
              final desc = descCtrl.text.trim();
              if (name.isEmpty) return;

              final updated = ModuleEntity(
                id: widget.module.id,
                name: name,
                description: desc.isEmpty ? null : desc,
                projectId: widget.module.projectId,
                parentModuleId: widget.module.parentModuleId,
              );

              context.read<ModuleBloc>().add(UpdateModuleEvent(updated));
              Navigator.pop(ctx);
            },
            child: const Text('Zapisz'),
          ),
        ],
      ),
    );
  }

  // ——— Usuwanie modułu
  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Usuń moduł'),
        content: Text('Czy na pewno chcesz usunąć „${widget.module.name}”?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Anuluj')),
          ElevatedButton(
            onPressed: () {
              context.read<ModuleBloc>().add(DeleteModuleEvent(widget.module.id));
              Navigator.pop(ctx);
            },
            child: const Text('Usuń'),
          ),
        ],
      ),
    );
  }
}
