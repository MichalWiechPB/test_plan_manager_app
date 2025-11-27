import 'package:json_annotation/json_annotation.dart';

part 'test_step_dto.g.dart';

@JsonSerializable()
class TestStepDto {
  final String id;
  final String testCaseId;
  final int stepNumber;
  final String description;
  final String? expected;
  final String status;

  TestStepDto({
    required this.id,
    required this.testCaseId,
    required this.stepNumber,
    required this.description,
    this.expected,
    required this.status,
  });

  factory TestStepDto.fromJson(Map<String, dynamic> json) =>
      _$TestStepDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TestStepDtoToJson(this);

  factory TestStepDto.fromGraphJson(Map<String, dynamic> json) {
    final fields = json['fields'] ?? {};

    return TestStepDto(
      id: json['id'],
      // ID SharePoint item
      testCaseId: fields['testCaseId'] ?? '',
      stepNumber: (fields['stepNumber'] as num?)?.toInt() ?? 0,
      description: fields['description'] ?? '',
      expected: fields['expected'],
      status: fields['status'] ?? 'NotRun',
    );
  }

  Map<String, dynamic> toGraphCreateJson() {
    return {
      "fields": {
        "testCaseId": testCaseId,
        "stepNumber": stepNumber,
        "description": description,
        "expected": expected,
        "status": status,
      },
    };
  }

  Map<String, dynamic> toGraphUpdateJson() {
    return {
      "fields": {
        "description": description,
        "expected": expected,
        "status": status,
      },
    };
  }
}
