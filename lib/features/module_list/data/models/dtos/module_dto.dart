import 'package:json_annotation/json_annotation.dart';

part 'module_dto.g.dart';

@JsonSerializable()
class ModuleDto {
  final String id;
  final String name;
  final String? description;
  final String projectId;
  final String? parentModuleId;
  final DateTime? createdAtUtc;

  const ModuleDto({
    required this.id,
    required this.name,
    required this.projectId,
    this.description,
    this.parentModuleId,
    this.createdAtUtc,
  });

  factory ModuleDto.fromJson(Map<String, dynamic> json) =>
      _$ModuleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ModuleDtoToJson(this);

  factory ModuleDto.fromGraphJson(Map<String, dynamic> json) {
    final Map<String, dynamic> fields =
    json['fields'] is Map<String, dynamic> ? json['fields'] : {};

    return ModuleDto(
      id: json['id']?.toString() ?? '',
      name: fields['name']?.toString() ?? '',
      description: fields['description']?.toString(),
      projectId: fields['projectId']?.toString() ?? '',
      parentModuleId: fields['parentModuleId']?.toString(),
      createdAtUtc: _parseDate(fields['createdAtUtc']),
    );
  }

  Map<String, dynamic> toGraphCreateJson() {
    return {
      "fields": {
        "name": name,
        "description": description,
        "projectId": projectId,
        "parentModuleId": parentModuleId,
        "createdAtUtc": createdAtUtc?.toIso8601String(),
      }
    };
  }

  Map<String, dynamic> toGraphUpdateJson() {
    return {
      if (name.isNotEmpty) "name": name,
      "description": description,
      "projectId": projectId,
      "parentModuleId": parentModuleId,
      "createdAtUtc": createdAtUtc?.toIso8601String(),
    };
  }

  static DateTime? _parseDate(dynamic value) {
    if (value == null) return null;
    try {
      return DateTime.parse(value.toString());
    } catch (_) {
      return null;
    }
  }
}
