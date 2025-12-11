import 'package:drift/drift.dart' as drift;

import '../../../features/comments/data/models/comment_dto.dart';
import '../../../features/comments/domain/entities/comment.dart';
import '../data.dart';

extension CommentDataMapper on Comment {
  CommentEntity toEntity() {
    return CommentEntity(
      id: id,
      testCaseId: testCaseId,
      content: content,
      createdAtUtc: createdAtUtc,
    );
  }
}

extension CommentDtoEntityMapper on CommentDto {
  CommentEntity toEntity() {
    return CommentEntity(
      id: id,
      testCaseId: testCaseId,
      content: content,
      createdAtUtc: createdAtUtc,
    );
  }
}

extension CommentEntityDbMapper on CommentEntity {
  CommentsCompanion toDbModel() {
    return CommentsCompanion(
      id: drift.Value(id),
      testCaseId: drift.Value(testCaseId),
      content: drift.Value(content),
      createdAtUtc: createdAtUtc != null
          ? drift.Value(createdAtUtc!)
          : const drift.Value.absent(),
    );
  }
}

extension CommentDtoDbMapper on CommentDto {
  CommentsCompanion toDbModel() {
    return CommentsCompanion(
      id: drift.Value(id),
      testCaseId: drift.Value(testCaseId),
      content: drift.Value(content),
      createdByUserId: createdByUserId != null
          ? drift.Value(createdByUserId!)
          : const drift.Value.absent(),
      createdAtUtc: createdAtUtc != null
          ? drift.Value(createdAtUtc!)
          : const drift.Value.absent(),
    );
  }
}

extension CommentEntityDtoMapper on CommentEntity {
  CommentDto toDto() {
    return CommentDto(
      id: id,
      testCaseId: testCaseId,
      content: content,
      createdAtUtc: createdAtUtc,
    );
  }
}
