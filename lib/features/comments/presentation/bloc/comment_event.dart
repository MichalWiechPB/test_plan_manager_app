import 'package:equatable/equatable.dart';
import '../../domain/entities/comment.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();
  @override
  List<Object?> get props => [];
}

class GetCommentsForCaseEvent extends CommentEvent {
  final String testCaseId;
  const GetCommentsForCaseEvent(this.testCaseId);
}

class AddCommentEvent extends CommentEvent {
  final CommentEntity comment;
  const AddCommentEvent(this.comment);
}

class DeleteCommentEvent extends CommentEvent {
  final String commentId;
  final String testCaseId;
  const DeleteCommentEvent(this.commentId, this.testCaseId);
}
