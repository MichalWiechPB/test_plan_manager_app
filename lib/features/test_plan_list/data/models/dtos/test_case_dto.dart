import 'package:json_annotation/json_annotation.dart';

part 'test_case_dto.g.dart';

@JsonSerializable()
class TestCaseDto {
  final String id;
  final String planId;
  final String title;
  final String? status;
  final String? assignedToUserId;
  final String? expectedResult;
  final DateTime? lastModifiedUtc;
  final String? parentCaseId;
  final int? totalSteps;
  final int? passedSteps;

  const TestCaseDto({
    required this.id,
    required this.planId,
    required this.title,
    this.status,
    this.assignedToUserId,
    this.expectedResult,
    this.lastModifiedUtc,
    this.parentCaseId,
    this.totalSteps,
    this.passedSteps,
  });

  factory TestCaseDto.fromJson(Map<String, dynamic> json) =>
      _$TestCaseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TestCaseDtoToJson(this);

  factory TestCaseDto.fromGraphJson(Map<String, dynamic> json) {
    final fields = json['fields'] ?? {};

    int? _toInt(val) {
      if (val == null) return null;
      if (val is int) return val;
      if (val is double) return val.toInt();
      if (val is String) return int.tryParse(val);
      return null;
    }

    return TestCaseDto(
      id: json['id'] as String,
      planId: fields['planId'] as String? ?? '',
      title: fields['Title'] ?? fields['title'] ?? '',
      status: fields['status'] as String?,
      assignedToUserId: fields['assignedToUserId'] as String?,
      expectedResult: fields['expectedResult'] as String?,
      lastModifiedUtc: fields['lastModifiedUtc'] != null
          ? DateTime.parse(fields['lastModifiedUtc'])
          : null,
      parentCaseId: fields['parentCaseId'] as String?,
      totalSteps: _toInt(fields['totalSteps']) ?? 0,
      passedSteps: _toInt(fields['passedSteps']) ?? 0,
    );
  }

  Map<String, dynamic> toGraphCreateJson() {
    return {
      "fields": {
        "planId": planId,
        "Title": title,
        "status": status,
        "assignedToUserId": assignedToUserId,
        "expectedResult": expectedResult,
        "lastModifiedUtc": lastModifiedUtc?.toIso8601String(),
        "parentCaseId": parentCaseId,
        "totalSteps": totalSteps ?? 0,
        "passedSteps": passedSteps ?? 0,
      }
    };
  }

  Map<String, dynamic> toGraphUpdateJson() {
    return {
      "status": status,
      "assignedToUserId": assignedToUserId,
      "expectedResult": expectedResult,
      "lastModifiedUtc": lastModifiedUtc?.toIso8601String(),
      "parentCaseId": parentCaseId,
      "totalSteps": totalSteps ?? 0,
      "passedSteps": passedSteps ?? 0,
    };
  }
}
