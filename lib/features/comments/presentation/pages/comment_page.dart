import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../dependency_injection/service_locator.dart' as di;
import '../bloc/comment_bloc.dart';
import '../bloc/comment_event.dart';
import '../bloc/comment_state.dart';
import '../../domain/entities/comment.dart';

class CommentPage extends StatefulWidget {
  final String testCaseId;
  const CommentPage({super.key, required this.testCaseId});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      di.sl<CommentBloc>()..add(GetCommentsForCaseEvent(widget.testCaseId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Komentarze'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<CommentBloc, CommentState>(
                    builder: (context, state) {
                      if (state.status == CommentStatus.loading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final comments = state.comments;
                      if (comments.isEmpty) {
                        return const Center(
                            child: Text('Brak komentarzy dla tego testu'));
                      }

                      return ListView.builder(
                        itemCount: comments.length,
                        itemBuilder: (context, i) {
                          final c = comments[i];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            child: ListTile(
                              title: Text(c.content),
                              subtitle: Text(
                                c.createdAtUtc
                                    ?.toLocal()
                                    .toString()
                                    .split('.')[0] ??
                                    '',
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete_outline),
                                onPressed: () {
                                  context.read<CommentBloc>().add(
                                      DeleteCommentEvent(c.id, c.testCaseId));
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'Dodaj komentarz...',
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        final text = _controller.text.trim();
                        if (text.isEmpty) return;
                        final newComment = CommentEntity(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          testCaseId: widget.testCaseId,
                          content: text,
                          createdAtUtc: DateTime.now().toUtc(),
                        );
                        context
                            .read<CommentBloc>()
                            .add(AddCommentEvent(newComment));
                        _controller.clear();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
