import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../module_list/presentation/pages/module_list_page.dart';
import '../../domain/entities/project.dart';
import '../bloc/project_bloc.dart';
import '../bloc/project_event.dart';

class ProjectTile extends StatelessWidget {
  final ProjectEntity project;

  const ProjectTile({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(project.name),
      subtitle: Text(project.description ?? ''),
      onTap: () => context.go('/modules/${project.id}', extra: project.name),
      trailing: PopupMenuButton<String>(
        icon: const Icon(Icons.more_vert),
        onSelected: (value) {
          if (value == 'edit') {
            _openEditDialog(context);
          } else if (value == 'delete') {
            _confirmDelete(context);
          }
        },
        itemBuilder: (context) => const [
          PopupMenuItem(value: 'edit', child: Text('Edytuj')),
          PopupMenuItem(value: 'delete', child: Text('Usuń')),
        ],
      ),
    );
  }

  void _openEditDialog(BuildContext context) {
    final nameController = TextEditingController(text: project.name);
    final descController = TextEditingController(text: project.description ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edytuj projekt'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nazwa projektu'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: 'Opis projektu'),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Anuluj'),
          ),
          ElevatedButton(
            onPressed: () {
              final updated = ProjectEntity(
                id: project.id,
                name: nameController.text.trim(),
                description: descController.text.trim().isEmpty
                    ? null
                    : descController.text.trim(),
                createdAtUtc: project.createdAtUtc,
              );
              context.read<ProjectBloc>().add(UpdateProjectEvent(updated));
              Navigator.of(ctx).pop();
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
        title: const Text('Usuń projekt'),
        content: Text('Czy na pewno chcesz usunąć projekt "${project.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Anuluj'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ProjectBloc>().add(DeleteProjectEvent(project.id));
              Navigator.of(ctx).pop();
            },
            child: const Text('Usuń'),
          ),
        ],
      ),
    );
  }
}
