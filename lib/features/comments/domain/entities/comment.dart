import 'package:equatable/equatable.dart';

class CommentEntity extends Equatable {
  final String id;
  final String testCaseId;
  final String content;
  final String? createdByUserId;
  final DateTime? createdAtUtc;

  const CommentEntity({
    required this.id,
    required this.testCaseId,
    required this.content,
    this.createdByUserId,
    this.createdAtUtc,
  });

  @override
  List<Object?> get props => [id, testCaseId, content, createdByUserId, createdAtUtc];
}
