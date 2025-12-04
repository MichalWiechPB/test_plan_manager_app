import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_plan_manager_app/features/module_list/data/models/visited_module.dart';

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
            bloc.add(const ModuleEvent.resetVisited());
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
          final isClickable = i < visited.length - 1;

          return Row(
            children: [
              const Icon(Icons.chevron_right, size: 16),
              GestureDetector(
                onTap: isClickable
                    ? () {
                  final shortened = visited.sublist(0, i + 1);

                  bloc.add(const ModuleEvent.resetVisited());
                  for (final v in shortened) {
                    bloc.add(ModuleEvent.pushVisited(module: v));
                  }

                  context.go('/modules/$projectId/sub/${item.id}');
                }
                    : null,
                child: Text(
                  item.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: isClickable ? Colors.blue : Colors.black87,
                    decoration: isClickable
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
