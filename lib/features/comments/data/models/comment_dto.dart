import 'package:json_annotation/json_annotation.dart';

part 'comment_dto.g.dart';

@JsonSerializable()
class CommentDto {
  final String id;
  final String testCaseId;
  final String content;
  final String? createdByUserId;
  final DateTime? createdAtUtc;

  const CommentDto({
    required this.id,
    required this.testCaseId,
    required this.content,
    this.createdByUserId,
    this.createdAtUtc,
  });

  factory CommentDto.fromJson(Map<String, dynamic> json) =>
      _$CommentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CommentDtoToJson(this);

  factory CommentDto.fromGraphJson(Map<String, dynamic> json) {
    final fields = (json['fields'] as Map<String, dynamic>? ?? {});

    return CommentDto(
      id: json['id']?.toString() ?? '',
      testCaseId: fields['testCaseId']?.toString() ?? '',
      content: fields['content']?.toString() ?? '',
      createdByUserId: fields['AuthorLookupId']?.toString(),
      createdAtUtc: fields['createdAtUtc'] != null
          ? DateTime.parse(fields['createdAtUtc']).toUtc()
          : null,
    );
  }

  Map<String, dynamic> toGraphCreateJson() {
    return {
      "fields": {
        "testCaseId": testCaseId,
        "content": content,
        "createdByUserId": createdByUserId,
        "createdAtUtc": createdAtUtc?.toUtc().toIso8601String(),
      }
    };
  }

  Map<String, dynamic> toGraphUpdateJson() {
    return {
      "fields": {
        "testCaseId": testCaseId,
        "content": content,
        "createdByUserId": createdByUserId,
        "createdAtUtc": createdAtUtc?.toUtc().toIso8601String(),
      }
    };
  }
}
