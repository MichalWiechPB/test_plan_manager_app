import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_plan_manager_app/core/UI/app_colors.dart';

import '../../../project_list/domain/entities/project.dart';
import '../../../test_step_list/domain/entities/test_step.dart';
import '../../domain/entities/project_structure.dart';
import '../bloc/test_execution_bloc.dart';
import '../bloc/test_execution_event.dart';
import '../bloc/test_execution_state.dart';

class ExecutionPage extends StatefulWidget {
  const ExecutionPage({super.key});

  @override
  State<ExecutionPage> createState() => _ExecutionPageState();
}

class _ExecutionPageState extends State<ExecutionPage> {
  String? selectedProjectId;
  String? selectedModuleId;
  String? selectedPlanId;
  String? selectedCaseId;

  final Map<String, String> _localStepStatus = {};

  @override
  void initState() {
    super.initState();
    context.read<TestExecutionBloc>().add(
      const TestExecutionEvent.getAllProjectsForTests(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestExecutionBloc, TestExecutionState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (_, __, fileGenerated) {
            if (fileGenerated != null) {
              _showFileSavedDialog(context, fileGenerated);
            }
          },
          failure: (msg) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(msg)),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.softViolet.withOpacity(0.25),
          appBar: _appBar(),
          body: state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            failure: (msg) => Center(child: Text(msg, style: const TextStyle(color: Colors.white))),
            success: (projects, structure, _) =>
                _buildBody(projects, structure),
          ),
        );
      },
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: AppColors.softViolet,
      elevation: 4,
      title: const Text(
        "Test Execution",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.greenAccent,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: _finishSession,
            icon: const Icon(Icons.save_alt),
            label: const Text("Zakończ"),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(
      List<ProjectEntity> projects,
      ProjectStructureEntity? structure,
      ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _selectorCard(
            title: "Projekt",
            valueText: _getProjectName(projects, selectedProjectId),
            onTap: () => _openProjectSelector(projects),
          ),
          const SizedBox(height: 16),
          if (structure != null && selectedProjectId != null) ...[
            _selectorCard(
              title: "Moduł",
              valueText: _getModuleName(structure),
              onTap: () => _openModuleSelector(structure),
            ),
            const SizedBox(height: 16),
          ],
          if (structure != null && selectedProjectId != null && selectedModuleId != null) ...[
            _selectorCard(
              title: "Plan testów",
              valueText: _getPlanName(structure),
              onTap: () => _openPlanSelector(structure),
            ),
            const SizedBox(height: 16),
          ],
          if (structure != null &&
              selectedProjectId != null &&
              selectedModuleId != null &&
              selectedPlanId != null) ...[
            _selectorCard(
              title: "Test Case",
              valueText: _getCaseName(structure),
              onTap: () => _openCaseSelector(structure),
            ),
            const SizedBox(height: 16),
          ],
          if (structure != null &&
              selectedProjectId != null &&
              selectedModuleId != null &&
              selectedPlanId != null &&
              selectedCaseId != null)
            Expanded(child: _stepsView(structure)),
        ],
      ),
    );
  }

  Widget _selectorCard({
    required String title,
    required String valueText,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.softViolet.withOpacity(0.35),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.18),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    valueText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.white, size: 32),
          ],
        ),
      ),
    );
  }

  void _openProjectSelector(List<ProjectEntity> projects) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      backgroundColor: AppColors.softViolet.withOpacity(0.9),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Wybierz projekt",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ...projects.map(
                    (p) => ListTile(
                  title: Text(p.name, style: const TextStyle(color: Colors.white)),
                  trailing: const Icon(Icons.chevron_right, color: Colors.white),
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    setState(() {
                      selectedProjectId = p.id;
                      selectedModuleId = null;
                      selectedPlanId = null;
                      selectedCaseId = null;
                      _localStepStatus.clear();
                    });
                    context.read<TestExecutionBloc>().add(
                      TestExecutionEvent.getProjectStructure(projectId: p.id),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _openModuleSelector(ProjectStructureEntity structure) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.softViolet.withOpacity(0.9),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {   // ← TU JEST RÓŻNICA
        return _selectorSheet(
          title: "Wybierz moduł",
          items: structure.modules.map((m) {
            return ListTile(
              title: Text(m.module.name, style: const TextStyle(color: Colors.white)),
              trailing: const Icon(Icons.chevron_right, color: Colors.white),
              onTap: () {
                Navigator.pop(sheetContext);   // ← POPUJEMY KONTEKST SHEETA
                setState(() {
                  selectedModuleId = m.module.id;
                  selectedPlanId = null;
                  selectedCaseId = null;
                  _localStepStatus.clear();
                });
              },
            );
          }).toList(),
        );
      },
    );
  }


  void _openPlanSelector(ProjectStructureEntity structure) {
    if (selectedModuleId == null) return;

    final module = structure.modules.firstWhere((m) => m.module.id == selectedModuleId);

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.softViolet.withOpacity(0.9),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return _selectorSheet(
          title: "Wybierz plan testów",
          items: module.plans.map((p) {
            return ListTile(
              title: Text(p.plan.name, style: const TextStyle(color: Colors.white)),
              trailing: const Icon(Icons.chevron_right, color: Colors.white),
              onTap: () {
                Navigator.pop(sheetContext);
                setState(() {
                  selectedPlanId = p.plan.id;
                  selectedCaseId = null;
                  _localStepStatus.clear();
                });
              },
            );
          }).toList(),
        );
      },
    );
  }


  void _openCaseSelector(ProjectStructureEntity structure) {
    if (selectedModuleId == null || selectedPlanId == null) return;

    final module = structure.modules.firstWhere((m) => m.module.id == selectedModuleId);
    final plan = module.plans.firstWhere((p) => p.plan.id == selectedPlanId);

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.softViolet.withOpacity(0.9),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return _selectorSheet(
          title: "Wybierz test case",
          items: plan.cases.map((c) {
            return ListTile(
              title: Text(c.testCase.title, style: const TextStyle(color: Colors.white)),
              trailing: const Icon(Icons.chevron_right, color: Colors.white),
              onTap: () {
                Navigator.pop(sheetContext);
                setState(() {
                  selectedCaseId = c.testCase.id;
                  _localStepStatus.clear();
                });
              },
            );
          }).toList(),
        );
      },
    );
  }


  Widget _selectorSheet({
    required String title,
    required List<Widget> items,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...items,
        ],
      ),
    );
  }

  Widget _sheetItem(String id, String name, Function(String) onSelect) {
    return ListTile(
      title: Text(name, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(Icons.chevron_right, color: Colors.white),
      onTap: () {
        Navigator.of(context, rootNavigator: true).pop();
        onSelect(id);
      },
    );
  }

  String _getProjectName(List<ProjectEntity> list, String? id) =>
      id == null ? "Nie wybrano" : list.firstWhere((x) => x.id == id).name;

  String _getModuleName(ProjectStructureEntity structure) {
    if (selectedModuleId == null) return "Nie wybrano";
    return structure.modules
        .firstWhere((m) => m.module.id == selectedModuleId!)
        .module
        .name;
  }

  String _getPlanName(ProjectStructureEntity structure) {
    if (selectedModuleId == null || selectedPlanId == null) return "Nie wybrano";
    final module =
    structure.modules.firstWhere((m) => m.module.id == selectedModuleId);
    return module.plans.firstWhere((p) => p.plan.id == selectedPlanId!).plan.name;
  }

  String _getCaseName(ProjectStructureEntity structure) {
    if (selectedModuleId == null || selectedPlanId == null || selectedCaseId == null) {
      return "Nie wybrano";
    }
    final module =
    structure.modules.firstWhere((m) => m.module.id == selectedModuleId);
    final plan =
    module.plans.firstWhere((p) => p.plan.id == selectedPlanId);
    return plan.cases.firstWhere((c) => c.testCase.id == selectedCaseId!).testCase.title;
  }

  Widget _stepsView(ProjectStructureEntity structure) {
    if (selectedModuleId == null ||
        selectedPlanId == null ||
        selectedCaseId == null) {
      return const Center(
        child: Text("Wybierz test case",
            style: TextStyle(color: Colors.white70, fontSize: 16)),
      );
    }

    final module =
    structure.modules.firstWhere((m) => m.module.id == selectedModuleId);
    final plan =
    module.plans.firstWhere((p) => p.plan.id == selectedPlanId);
    final caseNode =
    plan.cases.firstWhere((c) => c.testCase.id == selectedCaseId);

    return ListView(
      children: caseNode.steps.map(_stepCard).toList(),
    );
  }

  Widget _stepCard(TestStepEntity s) {
    final selected = _localStepStatus[s.id];

    return Card(
      color: Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Krok ${s.stepNumber}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              s.description,
              style: const TextStyle(color: Colors.white70, fontSize: 15),
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 10,
              children: [
                _statusBtn("Passed", Colors.green, s, selected),
                _statusBtn("Failed", Colors.red, s, selected),
                _statusBtn("Blocked", Colors.amber, s, selected),
                _statusBtn("Skipped", Colors.blueGrey, s, selected),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _statusBtn(
      String label, MaterialColor color, TestStepEntity s, String? selected) {
    final active = selected == label;

    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          color: active ? Colors.white : color.shade200,
          fontWeight: FontWeight.w600,
        ),
      ),
      selected: active,
      selectedColor: color.shade600,
      backgroundColor: color.shade300.withOpacity(0.4),
      onSelected: (_) => _update(s, label),
    );
  }

  void _update(TestStepEntity s, String st) {
    setState(() {
      _localStepStatus[s.id] = st;
    });

    context.read<TestExecutionBloc>().add(
      TestExecutionEvent.updateStepTempStatus(
        stepStatus: StepStatusPathEntity(
          projectId: selectedProjectId!,
          moduleId: selectedModuleId!,
          planId: selectedPlanId!,
          caseId: selectedCaseId!,
          stepId: s.id,
          newStatus: st,
          timestamp: DateTime.now(),
        ),
      ),
    );
  }

  Future<void> _finishSession() async {
    final res = await showDialog<bool>(
      context: context,
      useRootNavigator: true,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.softViolet.withOpacity(0.9),
        title: const Text("Zakończyć testowanie?", style: TextStyle(color: Colors.white)),
        content: const Text("Wyeksportować raport?", style: TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx, rootNavigator: true).pop(false),
            child: const Text("Nie", style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx, rootNavigator: true).pop(true),
            child: const Text("Tak"),
          ),
        ],
      ),
    );

    if (res == true) {
      context.read<TestExecutionBloc>().add(const TestExecutionEvent.exportToFile());
    } else {
      context.go('/projects');
    }
  }

  void _showFileSavedDialog(BuildContext context, String path) {
    showDialog(
      context: context,
      useRootNavigator: true,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.softViolet.withOpacity(0.9),
        title: const Text("Raport zapisany", style: TextStyle(color: Colors.white)),
        content: Text("Plik zapisano:\n\n$path", style: const TextStyle(color: Colors.white70)),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx, rootNavigator: true).pop();
              context.go('/projects');
            },
            child: const Text("OK"),
          )
        ],
      ),
    );
  }
}
