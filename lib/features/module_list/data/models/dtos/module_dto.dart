import '../../../../../database/drift_database/data.dart';
import '../../../domain/entities/module.dart';

extension ModuleMapper on Module {
  ModuleEntity toEntity() {
    return ModuleEntity(
      id: id,
      name: name,
      description: description,
      projectId: projectId,
      parentModuleId: parentModuleId,
    );
  }
}
