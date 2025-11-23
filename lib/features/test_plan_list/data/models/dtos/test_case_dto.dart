import '../../../../../database/drift_database/data.dart';
import '../../../domain/entities/test_case.dart';

extension TestCaseMapper on TestCase {
  TestCaseEntity toEntity() {
    return TestCaseEntity(
      id: id,
      planId: planId,
      title: title,
      status: status,
      assignedToUserId: assignedToUserId,
      expectedResult: expectedResult,
      lastModifiedUtc: lastModifiedUtc,
      parentCaseId: parentCaseId,
      totalSteps: totalSteps ?? 0,
      passedSteps: passedSteps ?? 0,
    );
  }
}
