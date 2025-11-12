import 'package:equatable/equatable.dart';
import '../../domain/entities/comment.dart';

enum CommentStatus { initial, loading, success, failure }

class CommentState extends Equatable {
  final CommentStatus status;
  final List<CommentEntity> comments;
  final String? errorMessage;

  const CommentState({
    required this.status,
    required this.comments,
    this.errorMessage,
  });

  const CommentState.initial()
      : status = CommentStatus.initial,
        comments = const [],
        errorMessage = null;

  CommentState copyWith({
    CommentStatus? status,
    List<CommentEntity>? comments,
    String? errorMessage,
  }) {
    return CommentState(
      status: status ?? this.status,
      comments: comments ?? this.comments,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, comments, errorMessage];
}
