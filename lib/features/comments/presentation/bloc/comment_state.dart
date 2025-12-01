import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/comment.dart';

part 'comment_state.freezed.dart';

@freezed
sealed class CommentState with _$CommentState {
  const factory CommentState.initial() = CommentInitial;

  const factory CommentState.loading() = CommentLoading;

  const factory CommentState.success({
    required List<CommentEntity> comments,
  }) = CommentSuccess;

  const factory CommentState.failure({
    required String errorMessage,
  }) = CommentFailure;
}
