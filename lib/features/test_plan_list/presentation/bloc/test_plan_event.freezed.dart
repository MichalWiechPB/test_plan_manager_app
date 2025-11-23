// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_plan_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TestPlanEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestPlanEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TestPlanEvent()';
}


}

/// @nodoc
class $TestPlanEventCopyWith<$Res>  {
$TestPlanEventCopyWith(TestPlanEvent _, $Res Function(TestPlanEvent) __);
}


/// Adds pattern-matching-related methods to [TestPlanEvent].
extension TestPlanEventPatterns on TestPlanEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetTestCasesForPlanEvent value)?  getTestCasesForPlan,TResult Function( CreateTestCaseEvent value)?  createTestCase,TResult Function( UpdateTestCaseEvent value)?  updateTestCase,TResult Function( DeleteTestCaseEvent value)?  deleteTestCase,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetTestCasesForPlanEvent() when getTestCasesForPlan != null:
return getTestCasesForPlan(_that);case CreateTestCaseEvent() when createTestCase != null:
return createTestCase(_that);case UpdateTestCaseEvent() when updateTestCase != null:
return updateTestCase(_that);case DeleteTestCaseEvent() when deleteTestCase != null:
return deleteTestCase(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetTestCasesForPlanEvent value)  getTestCasesForPlan,required TResult Function( CreateTestCaseEvent value)  createTestCase,required TResult Function( UpdateTestCaseEvent value)  updateTestCase,required TResult Function( DeleteTestCaseEvent value)  deleteTestCase,}){
final _that = this;
switch (_that) {
case GetTestCasesForPlanEvent():
return getTestCasesForPlan(_that);case CreateTestCaseEvent():
return createTestCase(_that);case UpdateTestCaseEvent():
return updateTestCase(_that);case DeleteTestCaseEvent():
return deleteTestCase(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetTestCasesForPlanEvent value)?  getTestCasesForPlan,TResult? Function( CreateTestCaseEvent value)?  createTestCase,TResult? Function( UpdateTestCaseEvent value)?  updateTestCase,TResult? Function( DeleteTestCaseEvent value)?  deleteTestCase,}){
final _that = this;
switch (_that) {
case GetTestCasesForPlanEvent() when getTestCasesForPlan != null:
return getTestCasesForPlan(_that);case CreateTestCaseEvent() when createTestCase != null:
return createTestCase(_that);case UpdateTestCaseEvent() when updateTestCase != null:
return updateTestCase(_that);case DeleteTestCaseEvent() when deleteTestCase != null:
return deleteTestCase(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String planId)?  getTestCasesForPlan,TResult Function( TestCaseEntity testCase)?  createTestCase,TResult Function( TestCaseEntity testCase)?  updateTestCase,TResult Function( String id)?  deleteTestCase,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetTestCasesForPlanEvent() when getTestCasesForPlan != null:
return getTestCasesForPlan(_that.planId);case CreateTestCaseEvent() when createTestCase != null:
return createTestCase(_that.testCase);case UpdateTestCaseEvent() when updateTestCase != null:
return updateTestCase(_that.testCase);case DeleteTestCaseEvent() when deleteTestCase != null:
return deleteTestCase(_that.id);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String planId)  getTestCasesForPlan,required TResult Function( TestCaseEntity testCase)  createTestCase,required TResult Function( TestCaseEntity testCase)  updateTestCase,required TResult Function( String id)  deleteTestCase,}) {final _that = this;
switch (_that) {
case GetTestCasesForPlanEvent():
return getTestCasesForPlan(_that.planId);case CreateTestCaseEvent():
return createTestCase(_that.testCase);case UpdateTestCaseEvent():
return updateTestCase(_that.testCase);case DeleteTestCaseEvent():
return deleteTestCase(_that.id);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String planId)?  getTestCasesForPlan,TResult? Function( TestCaseEntity testCase)?  createTestCase,TResult? Function( TestCaseEntity testCase)?  updateTestCase,TResult? Function( String id)?  deleteTestCase,}) {final _that = this;
switch (_that) {
case GetTestCasesForPlanEvent() when getTestCasesForPlan != null:
return getTestCasesForPlan(_that.planId);case CreateTestCaseEvent() when createTestCase != null:
return createTestCase(_that.testCase);case UpdateTestCaseEvent() when updateTestCase != null:
return updateTestCase(_that.testCase);case DeleteTestCaseEvent() when deleteTestCase != null:
return deleteTestCase(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class GetTestCasesForPlanEvent implements TestPlanEvent {
  const GetTestCasesForPlanEvent({required this.planId});
  

 final  String planId;

/// Create a copy of TestPlanEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTestCasesForPlanEventCopyWith<GetTestCasesForPlanEvent> get copyWith => _$GetTestCasesForPlanEventCopyWithImpl<GetTestCasesForPlanEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTestCasesForPlanEvent&&(identical(other.planId, planId) || other.planId == planId));
}


@override
int get hashCode => Object.hash(runtimeType,planId);

@override
String toString() {
  return 'TestPlanEvent.getTestCasesForPlan(planId: $planId)';
}


}

/// @nodoc
abstract mixin class $GetTestCasesForPlanEventCopyWith<$Res> implements $TestPlanEventCopyWith<$Res> {
  factory $GetTestCasesForPlanEventCopyWith(GetTestCasesForPlanEvent value, $Res Function(GetTestCasesForPlanEvent) _then) = _$GetTestCasesForPlanEventCopyWithImpl;
@useResult
$Res call({
 String planId
});




}
/// @nodoc
class _$GetTestCasesForPlanEventCopyWithImpl<$Res>
    implements $GetTestCasesForPlanEventCopyWith<$Res> {
  _$GetTestCasesForPlanEventCopyWithImpl(this._self, this._then);

  final GetTestCasesForPlanEvent _self;
  final $Res Function(GetTestCasesForPlanEvent) _then;

/// Create a copy of TestPlanEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? planId = null,}) {
  return _then(GetTestCasesForPlanEvent(
planId: null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CreateTestCaseEvent implements TestPlanEvent {
  const CreateTestCaseEvent({required this.testCase});
  

 final  TestCaseEntity testCase;

/// Create a copy of TestPlanEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTestCaseEventCopyWith<CreateTestCaseEvent> get copyWith => _$CreateTestCaseEventCopyWithImpl<CreateTestCaseEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTestCaseEvent&&(identical(other.testCase, testCase) || other.testCase == testCase));
}


@override
int get hashCode => Object.hash(runtimeType,testCase);

@override
String toString() {
  return 'TestPlanEvent.createTestCase(testCase: $testCase)';
}


}

/// @nodoc
abstract mixin class $CreateTestCaseEventCopyWith<$Res> implements $TestPlanEventCopyWith<$Res> {
  factory $CreateTestCaseEventCopyWith(CreateTestCaseEvent value, $Res Function(CreateTestCaseEvent) _then) = _$CreateTestCaseEventCopyWithImpl;
@useResult
$Res call({
 TestCaseEntity testCase
});




}
/// @nodoc
class _$CreateTestCaseEventCopyWithImpl<$Res>
    implements $CreateTestCaseEventCopyWith<$Res> {
  _$CreateTestCaseEventCopyWithImpl(this._self, this._then);

  final CreateTestCaseEvent _self;
  final $Res Function(CreateTestCaseEvent) _then;

/// Create a copy of TestPlanEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? testCase = null,}) {
  return _then(CreateTestCaseEvent(
testCase: null == testCase ? _self.testCase : testCase // ignore: cast_nullable_to_non_nullable
as TestCaseEntity,
  ));
}


}

/// @nodoc


class UpdateTestCaseEvent implements TestPlanEvent {
  const UpdateTestCaseEvent({required this.testCase});
  

 final  TestCaseEntity testCase;

/// Create a copy of TestPlanEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateTestCaseEventCopyWith<UpdateTestCaseEvent> get copyWith => _$UpdateTestCaseEventCopyWithImpl<UpdateTestCaseEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateTestCaseEvent&&(identical(other.testCase, testCase) || other.testCase == testCase));
}


@override
int get hashCode => Object.hash(runtimeType,testCase);

@override
String toString() {
  return 'TestPlanEvent.updateTestCase(testCase: $testCase)';
}


}

/// @nodoc
abstract mixin class $UpdateTestCaseEventCopyWith<$Res> implements $TestPlanEventCopyWith<$Res> {
  factory $UpdateTestCaseEventCopyWith(UpdateTestCaseEvent value, $Res Function(UpdateTestCaseEvent) _then) = _$UpdateTestCaseEventCopyWithImpl;
@useResult
$Res call({
 TestCaseEntity testCase
});




}
/// @nodoc
class _$UpdateTestCaseEventCopyWithImpl<$Res>
    implements $UpdateTestCaseEventCopyWith<$Res> {
  _$UpdateTestCaseEventCopyWithImpl(this._self, this._then);

  final UpdateTestCaseEvent _self;
  final $Res Function(UpdateTestCaseEvent) _then;

/// Create a copy of TestPlanEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? testCase = null,}) {
  return _then(UpdateTestCaseEvent(
testCase: null == testCase ? _self.testCase : testCase // ignore: cast_nullable_to_non_nullable
as TestCaseEntity,
  ));
}


}

/// @nodoc


class DeleteTestCaseEvent implements TestPlanEvent {
  const DeleteTestCaseEvent({required this.id});
  

 final  String id;

/// Create a copy of TestPlanEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteTestCaseEventCopyWith<DeleteTestCaseEvent> get copyWith => _$DeleteTestCaseEventCopyWithImpl<DeleteTestCaseEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteTestCaseEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'TestPlanEvent.deleteTestCase(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeleteTestCaseEventCopyWith<$Res> implements $TestPlanEventCopyWith<$Res> {
  factory $DeleteTestCaseEventCopyWith(DeleteTestCaseEvent value, $Res Function(DeleteTestCaseEvent) _then) = _$DeleteTestCaseEventCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$DeleteTestCaseEventCopyWithImpl<$Res>
    implements $DeleteTestCaseEventCopyWith<$Res> {
  _$DeleteTestCaseEventCopyWithImpl(this._self, this._then);

  final DeleteTestCaseEvent _self;
  final $Res Function(DeleteTestCaseEvent) _then;

/// Create a copy of TestPlanEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeleteTestCaseEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
