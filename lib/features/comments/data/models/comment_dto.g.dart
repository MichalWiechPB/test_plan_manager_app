// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentDto _$CommentDtoFromJson(Map<String, dynamic> json) => CommentDto(
  id: json['id'] as String,
  testCaseId: json['testCaseId'] as String,
  content: json['content'] as String,
  createdByUserId: json['createdByUserId'] as String?,
  createdAtUtc:
      json['createdAtUtc'] == null
          ? null
          : DateTime.parse(json['createdAtUtc'] as String),
);

Map<String, dynamic> _$CommentDtoToJson(CommentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'testCaseId': instance.testCaseId,
      'content': instance.content,
      'createdByUserId': instance.createdByUserId,
      'createdAtUtc': instance.createdAtUtc?.toIso8601String(),
    };
