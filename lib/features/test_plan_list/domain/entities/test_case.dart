class TestCaseEntity {
  final String id;
  final String planId;
  final String title;
  final String status;
  final String? expectedResult;
  final String? assignedToUserId;
  final DateTime? lastModifiedUtc;
  final String? parentCaseId;
  final int? totalSteps;
  final int? passedSteps;

  const TestCaseEntity({
    required this.id,
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
}
