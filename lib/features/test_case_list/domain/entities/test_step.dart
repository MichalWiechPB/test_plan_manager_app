import 'package:equatable/equatable.dart';

class TestStepEntity extends Equatable {
  final String id;
  final String testCaseId;
  final int stepNumber;
  final String description;
  final String? expected;
  final String status;

  const TestStepEntity({
    required this.id,
    required this.testCaseId,
    required this.stepNumber,
    required this.description,
    this.expected,
    required this.status,
  });

  TestStepEntity copyWith({
    String? id,
    String? testCaseId,
    int? stepNumber,
    String? description,
    String? expected,
    String? status,
  }) {
    return TestStepEntity(
      id: id ?? this.id,
      testCaseId: testCaseId ?? this.testCaseId,
      stepNumber: stepNumber ?? this.stepNumber,
      description: description ?? this.description,
      expected: expected ?? this.expected,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [id, testCaseId, stepNumber, description, expected, status];
}
