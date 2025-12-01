import 'package:json_annotation/json_annotation.dart';

part 'test_case_dto.g.dart';

@JsonSerializable()
class TestCaseDto {
  final String? id;
  final String planId;
  final String title;
  final String status;
  final String? expectedResult;
  final String? assignedToUserId;
  final DateTime? lastModifiedUtc;
  final String? parentCaseId;
  final int? totalSteps;
  final int? passedSteps;

  const TestCaseDto({
    this.id,
    required this.planId,
    required this.title,
    required this.status,
    this.expectedResult,
    this.assignedToUserId,
    this.lastModifiedUtc,
    this.parentCaseId,
    this.totalSteps,
    this.passedSteps,
  });

  factory TestCaseDto.fromJson(Map<String, dynamic> json) =>
      _$TestCaseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TestCaseDtoToJson(this);

  factory TestCaseDto.fromGraphJson(Map<String, dynamic> json) {
    final fields = (json['fields'] as Map<String, dynamic>? ?? {});

    return TestCaseDto(
      id: json['id']?.toString(),
      planId: fields['planId'] ?? '',
      title: fields['Title'] ?? fields['title0'] ?? '',   // <-- TU
      status: fields['status'] ?? '',
      expectedResult: fields['expectedResult'],
      assignedToUserId: fields['assignedToUserId'],
      parentCaseId: fields['parentCaseId'],
      totalSteps: _parseInt(fields['totalSteps']),
      passedSteps: _parseInt(fields['passedSteps']),
      lastModifiedUtc: fields['lastModifiedUtc'] != null
          ? DateTime.parse(fields['lastModifiedUtc']).toUtc()
          : null,
    );
  }

  factory TestCaseDto.fromGraphFieldsJson(
      Map<String, dynamic> json,
      TestCaseDto original,
      ) {
    final fields = json['fields'] as Map<String, dynamic>?;

    return TestCaseDto(
      id: json['id']?.toString() ?? original.id,
      planId: fields?['PlanId'] ?? original.planId,
      title: fields?['Title'] ?? fields?['title0'] ?? original.title,
      status: fields?['Status'] ?? original.status,
      expectedResult: fields?['ExpectedResult'] ?? original.expectedResult,
      assignedToUserId:
      fields?['AssignedToUserId'] ?? original.assignedToUserId,
      parentCaseId: fields?['ParentCaseId'] ?? original.parentCaseId,
      totalSteps: fields?['TotalSteps'] != null
          ? _parseInt(fields?['TotalSteps'])
          : original.totalSteps,
      passedSteps: fields?['PassedSteps'] != null
          ? _parseInt(fields?['PassedSteps'])
          : original.passedSteps,
      lastModifiedUtc: fields?['LastModifiedUtc'] != null
          ? DateTime.parse(fields?['LastModifiedUtc']).toUtc()
          : original.lastModifiedUtc,
    );
  }

  Map<String, dynamic> toGraphCreateJson() {
    return {
      "fields": {
        "title0": title,
        "planId": planId,
        "status": status,
      }
    };
  }


  /// PATCH (jak TestStep)
  Map<String, dynamic> toGraphUpdateJson() {
    return {
      "PlanId": planId,
      "Title": title,
      "Status": status,
      "ExpectedResult": expectedResult,
      "AssignedToUserId": assignedToUserId,
      "ParentCaseId": parentCaseId,
      "TotalSteps": totalSteps,
      "PassedSteps": passedSteps,
      "LastModifiedUtc": lastModifiedUtc?.toUtc().toIso8601String(),
    };
  }

  static int? _parseInt(dynamic v) {
    if (v == null) return null;
    if (v is int) return v;
    if (v is double) return v.toInt();
    if (v is String) return int.tryParse(v);
    return null;
  }
}
