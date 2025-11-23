import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/project_bloc.dart';
import '../bloc/project_event.dart';
import '../bloc/project_state.dart';
import '../widgets/project_tile.dart';
import '../widgets/create_project_form.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({super.key});

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  @override
  void initState() {
    super.initState();
    _loadProjects();
  }

  void _loadProjects() {
    context.read<ProjectBloc>().add(const ProjectEvent.getAll());
  }

  Future<void> _openCreateProjectForm() async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (modalContext) {
        return BlocProvider.value(
          value: context.read<ProjectBloc>(),
          child: const CreateProjectForm(),
        );
      },
    );

    if (result == true && mounted) {
      _loadProjects();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Projects')),
        floatingActionButton: FloatingActionButton(
          onPressed: _openCreateProjectForm,
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<ProjectBloc, ProjectState>(
          builder: (context, state) {
            return state.when(
              initial: _renderInitial,
              loading: _renderLoading,
              failure: _renderFailure,
              success: (projects) => _renderSuccess(context, projects),
            );
          },
        ),
      ),
    );
  }

  Widget _renderInitial() {
    return const Center(
      child: Text('Loading...'),
    );
  }

  Widget _renderLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _renderFailure(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 48.0, color: Colors.red),
            const SizedBox(height: 16.0),
            Text(
              message,
              style: const TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: _loadProjects,
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderSuccess(BuildContext context, List projects) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async => _loadProjects(),
            child: projects.isEmpty
                ? const Center(
              child: Text(
                'No projects found',
                style: TextStyle(fontSize: 16.0),
              ),
            )
                : ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return ProjectTile(project: projects[index]);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.go('/execution'),
              child: const Text('Start Test Execution'),
            ),
          ),
        ),
      ],
    );
  }
}
