class CommentEntity {
  final String id;
  final String testCaseId;
  final String content;
  final DateTime? createdAtUtc;

  CommentEntity({
    required this.id,
    required this.testCaseId,
    required this.content,
    this.createdAtUtc,
  });
}
