import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../test_plan_list/presentation/bloc/test_plan_bloc.dart';
import '../../../test_plan_list/presentation/bloc/test_plan_event.dart';
import '../../domain/entities/test_case.dart';

class TestCaseTile extends StatelessWidget {
  final TestCaseEntity testCase;
  final String projectId;
  final String moduleId;
  final String planId;

  const TestCaseTile({
    super.key,
    required this.testCase,
    required this.projectId,
    required this.moduleId,
    required this.planId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: ListTile(
        leading: const Icon(Icons.bug_report),
        title: Text(testCase.title),
        subtitle: Text('Status: ${testCase.status}'),
        trailing: PopupMenuButton<String>(
          onSelected: (v) {
            if (v == 'edit') _openEditDialog(context);
            if (v == 'delete') _confirmDelete(context);
          },
          itemBuilder: (context) => const [
            PopupMenuItem(value: 'edit', child: Text('Edytuj')),
            PopupMenuItem(value: 'delete', child: Text('Usuń')),
          ],
        ),
        onTap: () {
          context.push('/cases/${testCase.id}/steps', extra: {
            'planId': planId,
            'moduleId': moduleId,
            'projectId': projectId,
          });
        },
      ),
    );
  }

  // 🔹 Edycja test case’a
  void _openEditDialog(BuildContext context) {
    final titleCtrl = TextEditingController(text: testCase.title);
    final expectedCtrl =
    TextEditingController(text: testCase.expectedResult ?? '');
    String status = testCase.status;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edytuj Test Case'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: titleCtrl, decoration: const InputDecoration(labelText: 'Tytuł')),
            TextField(controller: expectedCtrl, decoration: const InputDecoration(labelText: 'Oczekiwany rezultat')),
            DropdownButtonFormField<String>(
              value: status,
              decoration: const InputDecoration(labelText: 'Status'),
              items: const [
                DropdownMenuItem(value: 'Pending', child: Text('Pending')),
                DropdownMenuItem(value: 'Passed', child: Text('Passed')),
                DropdownMenuItem(value: 'Failed', child: Text('Failed')),
                DropdownMenuItem(value: 'Blocked', child: Text('Blocked')),
              ],
              onChanged: (v) => status = v ?? testCase.status,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Anuluj')),
          ElevatedButton(
            onPressed: () {
              final title = titleCtrl.text.trim();
              if (title.isEmpty) return;

              final updated = TestCaseEntity(
                id: testCase.id,
                planId: testCase.planId,
                title: title,
                status: status,
                expectedResult: expectedCtrl.text.trim().isEmpty
                    ? null
                    : expectedCtrl.text.trim(),
                assignedToUserId: testCase.assignedToUserId,
                lastModifiedUtc: DateTime.now().toUtc(),
                parentCaseId: testCase.parentCaseId,
              );

              context.read<TestPlanBloc>().add(UpdateTestCaseEvent(updated));
              Navigator.pop(ctx);
            },
            child: const Text('Zapisz'),
          ),
        ],
      ),
    );
  }

  // 🔹 Usuwanie test case’a
  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Usuń Test Case'),
        content: Text('Czy na pewno chcesz usunąć „${testCase.title}”?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Anuluj')),
          ElevatedButton(
            onPressed: () {
              context.read<TestPlanBloc>().add(DeleteTestCaseEvent(testCase.id));
              Navigator.pop(ctx);
            },
            child: const Text('Usuń'),
          ),
        ],
      ),
    );
  }
}
