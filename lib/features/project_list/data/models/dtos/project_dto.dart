import 'package:json_annotation/json_annotation.dart';

part 'project_dto.g.dart';

@JsonSerializable()
class ProjectDto {
  final String? id;
  final String name;
  final String? description;
  final DateTime? createdAtUtc;

  const ProjectDto({
    this.id,
    required this.name,
    this.description,
    this.createdAtUtc,
  });

  factory ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDtoToJson(this);

  factory ProjectDto.fromGraphJson(Map<String, dynamic> json) {
    final fields = json['fields'] as Map<String, dynamic>?;

    return ProjectDto(
      id: json['id']?.toString(),
      name: fields?['name'] ?? '',
      description: fields?['description'],
      createdAtUtc: fields?['createdAtUtc'] != null
          ? DateTime.parse(fields!['createdAtUtc']).toUtc()
          : null,
    );
  }

  Map<String, dynamic> toGraphCreateJson() {
    return {
      "fields": {
        "name": name,
        "description": description,
        "createdAtUtc": createdAtUtc?.toUtc().toIso8601String(),
      }
    };
  }

  Map<String, dynamic> toGraphUpdateJson() {
    return {
      "name": name,
      "description": description,
      "createdAtUtc": createdAtUtc?.toUtc().toIso8601String(),
    };
  }
}
