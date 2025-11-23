import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/module_bloc.dart';
import '../bloc/module_event.dart';
import '../bloc/module_state.dart';

Widget buildPathBar(
    BuildContext context,
    ModuleState state,
    String projectId,
    ) {
  final visited = state.maybeWhen(
    success: (_, __, ___, visitedModules, ____, _____) => visitedModules,
    orElse: () => const <String>[],
  );

  final bloc = context.read<ModuleBloc>();

  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    color: Colors.grey.shade100,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              bloc.add(
                ModuleEvent.setVisitedPath(
                  projectId: projectId,
                  visited: const [],
                ),
              );
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
          if (visited.isNotEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Icon(
                Icons.chevron_right,
                size: 16.0,
                color: Colors.black54,
              ),
            ),
          for (int i = 0; i < visited.length; i++) ...[
            InkWell(
              onTap: i < visited.length - 1
                  ? () {
                final shortened = visited.sublist(0, i + 1);
                bloc.add(
                  ModuleEvent.setVisitedPath(
                    projectId: projectId,
                    visited: shortened,
                  ),
                );
                context.go('/modules/$projectId/sub/${visited[i]}');
              }
                  : null,
              child: Text(
                visited[i],
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: i < visited.length - 1 ? Colors.blue : Colors.black87,
                  decoration: i < visited.length - 1
                      ? TextDecoration.underline
                      : TextDecoration.none,
                ),
              ),
            ),
            if (i < visited.length - 1)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Icon(
                  Icons.chevron_right,
                  size: 16.0,
                  color: Colors.black54,
                ),
              ),
          ],
        ],
      ),
    ),
  );
}
