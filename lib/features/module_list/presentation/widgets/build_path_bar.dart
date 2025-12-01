import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_plan_manager_app/core/global/navigation/data/repository/navigation_repository_impl.dart';
import '../bloc/module_bloc.dart';
import '../bloc/module_event.dart';

Widget buildPathBar(
    BuildContext context,
    List<VisitedModule> visited,
    String projectId,
    ) {
  final bloc = context.read<ModuleBloc>();

  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    color: Colors.grey.shade200,
    child: Row(
      children: [
        GestureDetector(
          onTap: () {
            bloc.add(ModuleEvent.setVisitedPath(
              projectId: projectId,
              visited: const [],
            ));
            context.go('/modules/$projectId');
          },
          child: const Text(
            'Root',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
        ...List.generate(visited.length, (i) {
          final item = visited[i];

          return Row(
            children: [
              const Icon(Icons.chevron_right, size: 16),
              GestureDetector(
                onTap: i < visited.length - 1
                    ? () {
                  final shortened = visited.sublist(0, i + 1);
                  bloc.add(ModuleEvent.setVisitedPath(
                    projectId: projectId,
                    visited: shortened,
                  ));
                  context.go('/modules/$projectId/sub/${item.id}');
                }
                    : null,
                child: Text(
                  item.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: i < visited.length - 1 ? Colors.blue : Colors.black87,
                    decoration: i < visited.length - 1
                        ? TextDecoration.underline
                        : TextDecoration.none,
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    ),
  );
}
