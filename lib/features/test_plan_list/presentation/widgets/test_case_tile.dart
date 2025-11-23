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
    final Color color = _statusColor(testCase.status);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2.0,
      child: ListTile(
        leading: Icon(Icons.bug_report, color: color),
        title: Text(
          testCase.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text("Status: "),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 3.0,
                    ),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Text(
                      testCase.status,
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Text(
                "Kroki: ${testCase.passedSteps} / ${testCase.totalSteps}",
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
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
        onTap: () async {
          await context.push(
            '/cases/${testCase.id}/steps',
            extra: {
              'planId': planId,
              'moduleId': moduleId,
              'projectId': projectId,
            },
          );
          context.read<TestPlanBloc>().add(
            TestPlanEvent.getTestCasesForPlan(planId: planId),
          );
        },
      ),
    );
  }

  void _openEditDialog(BuildContext context) {
    final titleCtrl = TextEditingController(text: testCase.title);
    final expectedCtrl =
    TextEditingController(text: testCase.expectedResult ?? "");

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edytuj Test Case'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(labelText: 'Tytuł'),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: expectedCtrl,
              decoration: const InputDecoration(labelText: 'Oczekiwany rezultat'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Anuluj'),
          ),
          FilledButton(
            onPressed: () {
              final updated = TestCaseEntity(
                id: testCase.id,
                planId: testCase.planId,
                title: titleCtrl.text.trim(),
                expectedResult: expectedCtrl.text.trim().isEmpty
                    ? null
                    : expectedCtrl.text.trim(),
                status: testCase.status,
                assignedToUserId: testCase.assignedToUserId,
                lastModifiedUtc: DateTime.now().toUtc(),
                parentCaseId: testCase.parentCaseId,
                totalSteps: testCase.totalSteps,
                passedSteps: testCase.passedSteps,
              );

              context.read<TestPlanBloc>().add(
                TestPlanEvent.updateTestCase(testCase: updated),
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
        title: const Text('Usuń Test Case'),
        content: Text('Czy na pewno chcesz usunąć „${testCase.title}”?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Anuluj'),
          ),
          FilledButton(
            onPressed: () {
              context.read<TestPlanBloc>().add(
                TestPlanEvent.deleteTestCase(id: testCase.id),
              );
              Navigator.pop(ctx);
            },
            child: const Text('Usuń'),
          ),
        ],
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Passed':
        return Colors.green;
      case 'Failed':
        return Colors.red;
      case 'Blocked':
        return Colors.orange;
      case 'NotRun':
      case 'Pending':
        return Colors.grey;
      default:
        return Colors.blueGrey;
    }
  }
}
