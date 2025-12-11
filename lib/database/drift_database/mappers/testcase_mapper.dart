import 'package:drift/drift.dart' as drift;
import 'package:test_plan_manager_app/features/test_plan_list/data/models/dtos/test_case_dto.dart';
import 'package:test_plan_manager_app/features/test_plan_list/domain/entities/test_case.dart';
import '../data.dart';

extension TestCaseDtoEntityMapper on TestCaseDto {
  TestCaseEntity toEntity() {
    return TestCaseEntity(
      id: id ?? '',
      planId: planId,
      title: title,
      status: status,
      expectedResult: expectedResult,
      assignedToUserId: assignedToUserId,
      lastModifiedUtc: lastModifiedUtc,
      parentCaseId: parentCaseId,
      totalSteps: totalSteps,
      passedSteps: passedSteps,
    );
  }
}

extension TestCaseDataMapper on TestCase {
  TestCaseEntity toEntity() {
    return TestCaseEntity(
      id: id,
      planId: planId,
      title: title,
      status: status,
      expectedResult: expectedResult,
      assignedToUserId: assignedToUserId,
      lastModifiedUtc: lastModifiedUtc,
      parentCaseId: parentCaseId,
      totalSteps: totalSteps,
      passedSteps: passedSteps,
    );
  }
}
extension TestCaseEntityDtoMapper on TestCaseEntity {
  TestCaseDto toDto() {
    return TestCaseDto(
      id: id,
      planId: planId,
      title: title,
      status: status,
      expectedResult: expectedResult,
      assignedToUserId: assignedToUserId,
      lastModifiedUtc: lastModifiedUtc,
      parentCaseId: parentCaseId,
      totalSteps: totalSteps,
      passedSteps: passedSteps,
    );
  }
}

extension TestCaseEntityDbMapper on TestCaseEntity {
  TestCasesCompanion toDbModel() {
    return TestCasesCompanion(
      id: drift.Value(id),
      planId: drift.Value(planId),
      title: drift.Value(title),
      status: drift.Value(status),
      expectedResult: expectedResult != null
          ? drift.Value(expectedResult!)
          : const drift.Value.absent(),
      assignedToUserId: assignedToUserId != null
          ? drift.Value(assignedToUserId!)
          : const drift.Value.absent(),
      lastModifiedUtc: lastModifiedUtc != null
          ? drift.Value(lastModifiedUtc!)
          : const drift.Value.absent(),
      parentCaseId: parentCaseId != null
          ? drift.Value(parentCaseId!)
          : const drift.Value.absent(),
      totalSteps: totalSteps != null
          ? drift.Value(totalSteps!)
          : const drift.Value.absent(),
      passedSteps: passedSteps != null
          ? drift.Value(passedSteps!)
          : const drift.Value.absent(),
    );
  }
}
extension TestCaseDtoDbMapper on TestCaseDto {
  TestCasesCompanion toDbModel() {
    return TestCasesCompanion(
      id: drift.Value(id ?? ''),
      planId: drift.Value(planId),
      title: drift.Value(title),
      status: drift.Value(status),
      expectedResult: expectedResult != null
          ? drift.Value(expectedResult!)
          : const drift.Value.absent(),
      assignedToUserId: assignedToUserId != null
          ? drift.Value(assignedToUserId!)
          : const drift.Value.absent(),
      lastModifiedUtc: lastModifiedUtc != null
          ? drift.Value(lastModifiedUtc!)
          : const drift.Value.absent(),
      parentCaseId: parentCaseId != null
          ? drift.Value(parentCaseId!)
          : const drift.Value.absent(),
      totalSteps: totalSteps != null
          ? drift.Value(totalSteps!)
          : const drift.Value.absent(),
      passedSteps: passedSteps != null
          ? drift.Value(passedSteps!)
          : const drift.Value.absent(),
    );
  }
}
