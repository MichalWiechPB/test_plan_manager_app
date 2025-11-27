import 'package:drift/drift.dart' as drift;

import '../../../features/test_step_list/data/models/dtos/test_step_dto.dart';
import '../../../features/test_step_list/domain/entities/test_step.dart';
import '../data.dart';

/// 🔥 Mapper DB row → Entity (czyli rekord z bazy → obiekt domenowy)
extension TestStepDataMapper on TestStep {
  TestStepEntity toEntity() {
    return TestStepEntity(
      id: id,
      testCaseId: testCaseId,
      stepNumber: stepNumber,
      description: description,
      expected: expected,
      status: status,
    );
  }
}

/// 🔥 Mapper Entity → DB Companion (do insert/update)
extension TestStepEntityDbMapper on TestStepEntity {
  TestStepsCompanion toDbModel() {
    return TestStepsCompanion(
      id: drift.Value(id),
      testCaseId: drift.Value(testCaseId),
      stepNumber: drift.Value(stepNumber),
      description: drift.Value(description),
      expected: expected != null
          ? drift.Value(expected!)
          : const drift.Value.absent(),
      status: drift.Value(status),
    );
  }
}

/// 🔥 Mapper DTO (z remote) → DB Companion
extension TestStepDtoDbMapper on TestStepDto {
  TestStepsCompanion toDbModel() {
    return TestStepsCompanion(
      id: drift.Value(id),
      testCaseId: drift.Value(testCaseId),
      stepNumber: drift.Value(stepNumber),
      description: drift.Value(description),
      expected: expected != null
          ? drift.Value(expected!)
          : const drift.Value.absent(),
      status: drift.Value(status),
    );
  }
}
