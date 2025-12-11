import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_comments_for_case.dart';
import '../../domain/usecases/add_comment.dart';
import '../../domain/usecases/delete_comment.dart';

import 'comment_event.dart';
import 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final GetCommentsForCase getCommentsForCase;
  final AddComment addComment;
  final DeleteComment deleteComment;

  CommentBloc({
    required this.getCommentsForCase,
    required this.addComment,
    required this.deleteComment,
  }) : super(const CommentState.initial()) {
    on<GetCommentsForCaseEvent>(_onGet);
    on<AddCommentEvent>(_onAdd);
    on<DeleteCommentEvent>(_onDelete);
  }

  Future<void> _onGet(GetCommentsForCaseEvent event,
      Emitter<CommentState> emit,) async {
    emit(const CommentState.loading());

    final stream = getCommentsForCase(
      GetCommentsForCaseParams(event.testCaseId),
    );

    await emit.forEach(
      stream,
      onData: (either) =>
          either.fold(
                (failure) =>
                CommentState.failure(
                  errorMessage: failure.message ?? '',
                ),
                (comments) =>
                CommentState.success(
                  comments: comments,
                ),
          ),
    );
  }

  Future<void> _onAdd(AddCommentEvent event, Emitter<CommentState> emit) async {
    final result = await addComment(event.comment);

    result.fold(
          (failure) =>
          emit(CommentState.failure(errorMessage: failure.message ?? '')),
          (_) => add(GetCommentsForCaseEvent(event.comment.testCaseId)),
    );
  }

  Future<void> _onDelete(
      DeleteCommentEvent event,
      Emitter<CommentState> emit,
      ) async {
    final result = await deleteComment(event.id);

    result.fold(
          (failure) => emit(CommentState.failure(
        errorMessage: failure.message ?? '',
      )),
          (_) => add(GetCommentsForCaseEvent(event.testCaseId)),
    );
  }

}
