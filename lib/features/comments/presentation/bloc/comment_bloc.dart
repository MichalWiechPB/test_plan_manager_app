import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_comments_for_case.dart';
import '../../domain/usecases/add_comment.dart';
import '../../domain/usecases/delete_comment.dart';
import 'comment_event.dart';
import 'comment_state.dart';
import '../../domain/entities/comment.dart';

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

  Future<void> _onGet(GetCommentsForCaseEvent event, Emitter<CommentState> emit) async {
    emit(state.copyWith(status: CommentStatus.loading));
    final result = await getCommentsForCase(event.testCaseId);
    result.fold(
          (failure) => emit(state.copyWith(status: CommentStatus.failure, errorMessage: failure.message)),
          (comments) => emit(state.copyWith(status: CommentStatus.success, comments: comments)),
    );
  }

  Future<void> _onAdd(AddCommentEvent event, Emitter<CommentState> emit) async {
    final result = await addComment(event.comment);
    result.fold(
          (failure) => emit(state.copyWith(errorMessage: failure.message)),
          (_) => add(GetCommentsForCaseEvent(event.comment.testCaseId)),
    );
  }

  Future<void> _onDelete(DeleteCommentEvent event, Emitter<CommentState> emit) async {
    final result = await deleteComment(event.commentId);
    result.fold(
          (failure) => emit(state.copyWith(errorMessage: failure.message)),
          (_) => add(GetCommentsForCaseEvent(event.testCaseId)),
    );
  }
}
