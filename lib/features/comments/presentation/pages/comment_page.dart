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
  late final CommentBloc _bloc;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = di.sl<CommentBloc>();
    _bloc.add(GetCommentsForCaseEvent(widget.testCaseId));
  }

  @override
  void dispose() {
    _bloc.close();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
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
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<CommentBloc, CommentState>(
                    builder: (_, state) {
                      return state.when(
                        initial: () => const Center(child: Text("Wczytywanie...")),
                        loading: () => const Center(child: CircularProgressIndicator()),
                        failure: (msg) => Center(
                          child: Text(msg, style: const TextStyle(color: Colors.red)),
                        ),
                        success: (comments) {
                          if (comments.isEmpty) {
                            return const Center(child: Text("Brak komentarzy"));
                          }

                          return ListView.builder(
                            itemCount: comments.length,
                            itemBuilder: (_, i) {
                              final c = comments[i];
                              return Card(
                                child: ListTile(
                                  title: Text(c.content),
                                  subtitle: Text(
                                    c.createdAtUtc?.toLocal().toString().split('.').first ?? '',
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete_outline),
                                    onPressed: () {
                                      _bloc.add(
                                        DeleteCommentEvent(
                                          id: c.id,
                                          testCaseId: c.testCaseId,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
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

                        final entity = CommentEntity(
                          id: '',
                          testCaseId: widget.testCaseId,
                          content: text,
                          createdAtUtc: DateTime.now().toUtc(),
                        );

                        _bloc.add(AddCommentEvent(entity));
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
