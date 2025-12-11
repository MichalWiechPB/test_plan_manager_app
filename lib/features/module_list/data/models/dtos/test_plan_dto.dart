import 'package:json_annotation/json_annotation.dart';

part 'test_plan_dto.g.dart';

@JsonSerializable()
class TestPlanDto {
  final String id;
  final String name;
  final String? description;
  final String moduleId;
  final String? ownerUserId;
  final DateTime? lastModifiedUtc;
  final int? overallPassed;
  final int? overallFailed;
  final int? overallBlocked;

  const TestPlanDto({
    required this.id,
    required this.name,
    required this.moduleId,
    this.description,
    this.ownerUserId,
    this.lastModifiedUtc,
    this.overallPassed,
    this.overallFailed,
    this.overallBlocked,
  });

  factory TestPlanDto.fromJson(Map<String, dynamic> json) =>
      _$TestPlanDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TestPlanDtoToJson(this);

  factory TestPlanDto.fromGraphJson(Map<String, dynamic> json) {
    final fields = json['fields'] ?? {};

    return TestPlanDto(
      id: json['id'], // zawsze jest
      name: fields['Title']?.toString() ?? fields['name']?.toString() ?? '',
      description: fields['description'],
      moduleId: fields['moduleId'] ?? '',
      ownerUserId: fields['ownerUserId'],
      lastModifiedUtc: fields['lastModifiedUtc'] != null
          ? DateTime.parse(fields['lastModifiedUtc'])
          : null,
      overallPassed: fields['overallPassed'] ?? 0,
      overallFailed: fields['overallFailed'] ?? 0,
      overallBlocked: fields['overallBlocked'] ?? 0,
    );
  }


  Map<String, dynamic> toGraphCreateJson() {
    return {
      "fields": {
        "name": name,
        "description": description,
        "moduleId": moduleId,
        "ownerUserId": ownerUserId,
        "lastModifiedUtc": lastModifiedUtc?.toIso8601String(),
        "overallPassed": overallPassed,
        "overallFailed": overallFailed,
        "overallBlocked": overallBlocked,
      }
    };
  }

  Map<String, dynamic> toGraphUpdateJson() {
    return {
      "name": name,
      "description": description,
      "moduleId": moduleId,
      "ownerUserId": ownerUserId,
      "lastModifiedUtc": lastModifiedUtc?.toIso8601String(),
      "overallPassed": overallPassed,
      "overallFailed": overallFailed,
      "overallBlocked": overallBlocked,
    };
  }
}
