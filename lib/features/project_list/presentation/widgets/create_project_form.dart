import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/project.dart';
import '../bloc/project_bloc.dart';
import '../bloc/project_event.dart';

class CreateProjectForm extends StatefulWidget {
  const CreateProjectForm({super.key});

  @override
  State<CreateProjectForm> createState() => _CreateProjectFormState();
}

class _CreateProjectFormState extends State<CreateProjectForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final project = ProjectEntity(
      id: 'project_${DateTime.now().millisecondsSinceEpoch}',
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim(),
      createdAtUtc: DateTime.now().toUtc(),
    );

    context.read<ProjectBloc>().add(CreateProjectEvent(project));
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 24,
      ),
      child: Form(
        key: _formKey,
        child: Wrap(
          runSpacing: 16,
          children: [
            Text('Nowy projekt',
                style: Theme.of(context).textTheme.headlineSmall),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nazwa projektu'),
              validator: (v) =>
              v == null || v.isEmpty ? 'Podaj nazwę projektu' : null,
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Opis projektu'),
              maxLines: 3,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: _submit,
                child: const Text('Zapisz'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
