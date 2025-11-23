import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/test_plan.dart';
import '../bloc/module_bloc.dart';
import '../bloc/module_event.dart';

class TestPlanTile extends StatelessWidget {
  final TestPlanEntity plan;
  final String projectId;
  final String moduleId;
  final String? projectName;

  const TestPlanTile({
    super.key,
    required this.plan,
    required this.projectId,
    required this.moduleId,
    this.projectName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(plan.name),
      subtitle: Text(plan.description ?? ''),
      trailing: PopupMenuButton<String>(
        onSelected: (value) {
          if (value == 'edit') _openEditDialog(context);
          if (value == 'delete') _confirmDelete(context);
        },
        itemBuilder: (context) => const [
          PopupMenuItem(value: 'edit', child: Text('Edytuj')),
          PopupMenuItem(value: 'delete', child: Text('Usuń')),
        ],
      ),
      onTap: () {
        context.push(
          '/plans/${plan.id}',
          extra: {
            'projectId': projectId,
            'moduleId': moduleId,
            if (projectName != null) 'projectName': projectName!,
          },
        );
      },
    );
  }

  void _openEditDialog(BuildContext context) {
    final nameCtrl = TextEditingController(text: plan.name);
    final descCtrl = TextEditingController(text: plan.description ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edytuj plan testów'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Nazwa'),
            ),
            const SizedBox(height: 16.0),
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
              final name = nameCtrl.text.trim();
              final desc = descCtrl.text.trim();
              if (name.isEmpty) return;

              final updated = TestPlanEntity(
                id: plan.id,
                name: name,
                description: desc.isEmpty ? null : desc,
                moduleId: plan.moduleId,
              );

              context.read<ModuleBloc>().add(
                ModuleEvent.updateTestPlan(plan: updated),
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
        title: const Text('Usuń plan testów'),
        content: Text('Czy na pewno chcesz usunąć „${plan.name}”?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Anuluj'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ModuleBloc>().add(
                ModuleEvent.deleteTestPlan(testPlanId: plan.id),
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
