import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/project.dart';
import '../bloc/project_bloc.dart';
import '../bloc/project_event.dart';

class ProjectTile extends StatelessWidget {
  final ProjectEntity project;

  const ProjectTile({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(project.name),
      subtitle: project.description != null
          ? Text(project.description!)
          : const Text('Brak opisu'),
      onTap: () => context.go('/modules/${project.id}', extra: project.name),
      trailing: PopupMenuButton<String>(
        icon: const Icon(Icons.more_vert),
        onSelected: (value) {
          if (value == 'edit') {
            _showEditDialog(context);
          } else if (value == 'delete') {
            _showDeleteDialog(context);
          }
        },
        itemBuilder: (context) => const [
          PopupMenuItem(value: 'edit', child: Text('Edytuj')),
          PopupMenuItem(value: 'delete', child: Text('Usuń')),
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    final nameController = TextEditingController(text: project.name);
    final descController = TextEditingController(text: project.description ?? '');

    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Edytuj projekt'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nazwa projektu'),
              ),
              const SizedBox(height: 16.0),
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
            FilledButton(
              onPressed: () {
                final updated = ProjectEntity(
                  id: project.id,
                  name: nameController.text.trim(),
                  description: descController.text.trim().isEmpty
                      ? null
                      : descController.text.trim(),
                  createdAtUtc: project.createdAtUtc,
                );

                context.read<ProjectBloc>().add(
                  ProjectEvent.update(project: updated),
                );

                Navigator.of(ctx).pop();
              },
              child: const Text('Zapisz'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Usuń projekt'),
          content: Text(
            'Czy na pewno chcesz usunąć projekt "${project.name}"?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Anuluj'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                context.read<ProjectBloc>().add(
                  ProjectEvent.delete(id: project.id),
                );
                Navigator.of(ctx).pop();
              },
              child: const Text('Usuń'),
            ),
          ],
        );
      },
    );
  }
}
