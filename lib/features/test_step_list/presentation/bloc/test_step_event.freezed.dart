// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_step_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TestStepEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestStepEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TestStepEvent()';
}


}

/// @nodoc
class $TestStepEventCopyWith<$Res>  {
$TestStepEventCopyWith(TestStepEvent _, $Res Function(TestStepEvent) __);
}


/// Adds pattern-matching-related methods to [TestStepEvent].
extension TestStepEventPatterns on TestStepEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetTestStepsForCaseEvent value)?  getTestStepsForCase,TResult Function( CreateTestStepEvent value)?  createTestStep,TResult Function( UpdateTestStepEvent value)?  updateTestStep,TResult Function( DeleteTestStepEvent value)?  deleteTestStep,TResult Function( ReorderTestStepsEvent value)?  reorderTestSteps,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetTestStepsForCaseEvent() when getTestStepsForCase != null:
return getTestStepsForCase(_that);case CreateTestStepEvent() when createTestStep != null:
return createTestStep(_that);case UpdateTestStepEvent() when updateTestStep != null:
return updateTestStep(_that);case DeleteTestStepEvent() when deleteTestStep != null:
return deleteTestStep(_that);case ReorderTestStepsEvent() when reorderTestSteps != null:
return reorderTestSteps(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetTestStepsForCaseEvent value)  getTestStepsForCase,required TResult Function( CreateTestStepEvent value)  createTestStep,required TResult Function( UpdateTestStepEvent value)  updateTestStep,required TResult Function( DeleteTestStepEvent value)  deleteTestStep,required TResult Function( ReorderTestStepsEvent value)  reorderTestSteps,}){
final _that = this;
switch (_that) {
case GetTestStepsForCaseEvent():
return getTestStepsForCase(_that);case CreateTestStepEvent():
return createTestStep(_that);case UpdateTestStepEvent():
return updateTestStep(_that);case DeleteTestStepEvent():
return deleteTestStep(_that);case ReorderTestStepsEvent():
return reorderTestSteps(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetTestStepsForCaseEvent value)?  getTestStepsForCase,TResult? Function( CreateTestStepEvent value)?  createTestStep,TResult? Function( UpdateTestStepEvent value)?  updateTestStep,TResult? Function( DeleteTestStepEvent value)?  deleteTestStep,TResult? Function( ReorderTestStepsEvent value)?  reorderTestSteps,}){
final _that = this;
switch (_that) {
case GetTestStepsForCaseEvent() when getTestStepsForCase != null:
return getTestStepsForCase(_that);case CreateTestStepEvent() when createTestStep != null:
return createTestStep(_that);case UpdateTestStepEvent() when updateTestStep != null:
return updateTestStep(_that);case DeleteTestStepEvent() when deleteTestStep != null:
return deleteTestStep(_that);case ReorderTestStepsEvent() when reorderTestSteps != null:
return reorderTestSteps(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String testCaseId)?  getTestStepsForCase,TResult Function( TestStepEntity step)?  createTestStep,TResult Function( TestStepEntity step)?  updateTestStep,TResult Function( String stepId,  String testCaseId)?  deleteTestStep,TResult Function( List<TestStepEntity> reorderedSteps)?  reorderTestSteps,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetTestStepsForCaseEvent() when getTestStepsForCase != null:
return getTestStepsForCase(_that.testCaseId);case CreateTestStepEvent() when createTestStep != null:
return createTestStep(_that.step);case UpdateTestStepEvent() when updateTestStep != null:
return updateTestStep(_that.step);case DeleteTestStepEvent() when deleteTestStep != null:
return deleteTestStep(_that.stepId,_that.testCaseId);case ReorderTestStepsEvent() when reorderTestSteps != null:
return reorderTestSteps(_that.reorderedSteps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String testCaseId)  getTestStepsForCase,required TResult Function( TestStepEntity step)  createTestStep,required TResult Function( TestStepEntity step)  updateTestStep,required TResult Function( String stepId,  String testCaseId)  deleteTestStep,required TResult Function( List<TestStepEntity> reorderedSteps)  reorderTestSteps,}) {final _that = this;
switch (_that) {
case GetTestStepsForCaseEvent():
return getTestStepsForCase(_that.testCaseId);case CreateTestStepEvent():
return createTestStep(_that.step);case UpdateTestStepEvent():
return updateTestStep(_that.step);case DeleteTestStepEvent():
return deleteTestStep(_that.stepId,_that.testCaseId);case ReorderTestStepsEvent():
return reorderTestSteps(_that.reorderedSteps);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String testCaseId)?  getTestStepsForCase,TResult? Function( TestStepEntity step)?  createTestStep,TResult? Function( TestStepEntity step)?  updateTestStep,TResult? Function( String stepId,  String testCaseId)?  deleteTestStep,TResult? Function( List<TestStepEntity> reorderedSteps)?  reorderTestSteps,}) {final _that = this;
switch (_that) {
case GetTestStepsForCaseEvent() when getTestStepsForCase != null:
return getTestStepsForCase(_that.testCaseId);case CreateTestStepEvent() when createTestStep != null:
return createTestStep(_that.step);case UpdateTestStepEvent() when updateTestStep != null:
return updateTestStep(_that.step);case DeleteTestStepEvent() when deleteTestStep != null:
return deleteTestStep(_that.stepId,_that.testCaseId);case ReorderTestStepsEvent() when reorderTestSteps != null:
return reorderTestSteps(_that.reorderedSteps);case _:
  return null;

}
}

}

/// @nodoc


class GetTestStepsForCaseEvent implements TestStepEvent {
  const GetTestStepsForCaseEvent({required this.testCaseId});
  

 final  String testCaseId;

/// Create a copy of TestStepEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTestStepsForCaseEventCopyWith<GetTestStepsForCaseEvent> get copyWith => _$GetTestStepsForCaseEventCopyWithImpl<GetTestStepsForCaseEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTestStepsForCaseEvent&&(identical(other.testCaseId, testCaseId) || other.testCaseId == testCaseId));
}


@override
int get hashCode => Object.hash(runtimeType,testCaseId);

@override
String toString() {
  return 'TestStepEvent.getTestStepsForCase(testCaseId: $testCaseId)';
}


}

/// @nodoc
abstract mixin class $GetTestStepsForCaseEventCopyWith<$Res> implements $TestStepEventCopyWith<$Res> {
  factory $GetTestStepsForCaseEventCopyWith(GetTestStepsForCaseEvent value, $Res Function(GetTestStepsForCaseEvent) _then) = _$GetTestStepsForCaseEventCopyWithImpl;
@useResult
$Res call({
 String testCaseId
});




}
/// @nodoc
class _$GetTestStepsForCaseEventCopyWithImpl<$Res>
    implements $GetTestStepsForCaseEventCopyWith<$Res> {
  _$GetTestStepsForCaseEventCopyWithImpl(this._self, this._then);

  final GetTestStepsForCaseEvent _self;
  final $Res Function(GetTestStepsForCaseEvent) _then;

/// Create a copy of TestStepEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? testCaseId = null,}) {
  return _then(GetTestStepsForCaseEvent(
testCaseId: null == testCaseId ? _self.testCaseId : testCaseId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CreateTestStepEvent implements TestStepEvent {
  const CreateTestStepEvent({required this.step});
  

 final  TestStepEntity step;

/// Create a copy of TestStepEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTestStepEventCopyWith<CreateTestStepEvent> get copyWith => _$CreateTestStepEventCopyWithImpl<CreateTestStepEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTestStepEvent&&(identical(other.step, step) || other.step == step));
}


@override
int get hashCode => Object.hash(runtimeType,step);

@override
String toString() {
  return 'TestStepEvent.createTestStep(step: $step)';
}


}

/// @nodoc
abstract mixin class $CreateTestStepEventCopyWith<$Res> implements $TestStepEventCopyWith<$Res> {
  factory $CreateTestStepEventCopyWith(CreateTestStepEvent value, $Res Function(CreateTestStepEvent) _then) = _$CreateTestStepEventCopyWithImpl;
@useResult
$Res call({
 TestStepEntity step
});




}
/// @nodoc
class _$CreateTestStepEventCopyWithImpl<$Res>
    implements $CreateTestStepEventCopyWith<$Res> {
  _$CreateTestStepEventCopyWithImpl(this._self, this._then);

  final CreateTestStepEvent _self;
  final $Res Function(CreateTestStepEvent) _then;

/// Create a copy of TestStepEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? step = null,}) {
  return _then(CreateTestStepEvent(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as TestStepEntity,
  ));
}


}

/// @nodoc


class UpdateTestStepEvent implements TestStepEvent {
  const UpdateTestStepEvent({required this.step});
  

 final  TestStepEntity step;

/// Create a copy of TestStepEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateTestStepEventCopyWith<UpdateTestStepEvent> get copyWith => _$UpdateTestStepEventCopyWithImpl<UpdateTestStepEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateTestStepEvent&&(identical(other.step, step) || other.step == step));
}


@override
int get hashCode => Object.hash(runtimeType,step);

@override
String toString() {
  return 'TestStepEvent.updateTestStep(step: $step)';
}


}

/// @nodoc
abstract mixin class $UpdateTestStepEventCopyWith<$Res> implements $TestStepEventCopyWith<$Res> {
  factory $UpdateTestStepEventCopyWith(UpdateTestStepEvent value, $Res Function(UpdateTestStepEvent) _then) = _$UpdateTestStepEventCopyWithImpl;
@useResult
$Res call({
 TestStepEntity step
});




}
/// @nodoc
class _$UpdateTestStepEventCopyWithImpl<$Res>
    implements $UpdateTestStepEventCopyWith<$Res> {
  _$UpdateTestStepEventCopyWithImpl(this._self, this._then);

  final UpdateTestStepEvent _self;
  final $Res Function(UpdateTestStepEvent) _then;

/// Create a copy of TestStepEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? step = null,}) {
  return _then(UpdateTestStepEvent(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as TestStepEntity,
  ));
}


}

/// @nodoc


class DeleteTestStepEvent implements TestStepEvent {
  const DeleteTestStepEvent({required this.stepId, required this.testCaseId});
  

 final  String stepId;
 final  String testCaseId;

/// Create a copy of TestStepEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteTestStepEventCopyWith<DeleteTestStepEvent> get copyWith => _$DeleteTestStepEventCopyWithImpl<DeleteTestStepEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteTestStepEvent&&(identical(other.stepId, stepId) || other.stepId == stepId)&&(identical(other.testCaseId, testCaseId) || other.testCaseId == testCaseId));
}


@override
int get hashCode => Object.hash(runtimeType,stepId,testCaseId);

@override
String toString() {
  return 'TestStepEvent.deleteTestStep(stepId: $stepId, testCaseId: $testCaseId)';
}


}

/// @nodoc
abstract mixin class $DeleteTestStepEventCopyWith<$Res> implements $TestStepEventCopyWith<$Res> {
  factory $DeleteTestStepEventCopyWith(DeleteTestStepEvent value, $Res Function(DeleteTestStepEvent) _then) = _$DeleteTestStepEventCopyWithImpl;
@useResult
$Res call({
 String stepId, String testCaseId
});




}
/// @nodoc
class _$DeleteTestStepEventCopyWithImpl<$Res>
    implements $DeleteTestStepEventCopyWith<$Res> {
  _$DeleteTestStepEventCopyWithImpl(this._self, this._then);

  final DeleteTestStepEvent _self;
  final $Res Function(DeleteTestStepEvent) _then;

/// Create a copy of TestStepEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? stepId = null,Object? testCaseId = null,}) {
  return _then(DeleteTestStepEvent(
stepId: null == stepId ? _self.stepId : stepId // ignore: cast_nullable_to_non_nullable
as String,testCaseId: null == testCaseId ? _self.testCaseId : testCaseId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ReorderTestStepsEvent implements TestStepEvent {
  const ReorderTestStepsEvent({required final  List<TestStepEntity> reorderedSteps}): _reorderedSteps = reorderedSteps;
  

 final  List<TestStepEntity> _reorderedSteps;
 List<TestStepEntity> get reorderedSteps {
  if (_reorderedSteps is EqualUnmodifiableListView) return _reorderedSteps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reorderedSteps);
}


/// Create a copy of TestStepEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReorderTestStepsEventCopyWith<ReorderTestStepsEvent> get copyWith => _$ReorderTestStepsEventCopyWithImpl<ReorderTestStepsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReorderTestStepsEvent&&const DeepCollectionEquality().equals(other._reorderedSteps, _reorderedSteps));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_reorderedSteps));

@override
String toString() {
  return 'TestStepEvent.reorderTestSteps(reorderedSteps: $reorderedSteps)';
}


}

/// @nodoc
abstract mixin class $ReorderTestStepsEventCopyWith<$Res> implements $TestStepEventCopyWith<$Res> {
  factory $ReorderTestStepsEventCopyWith(ReorderTestStepsEvent value, $Res Function(ReorderTestStepsEvent) _then) = _$ReorderTestStepsEventCopyWithImpl;
@useResult
$Res call({
 List<TestStepEntity> reorderedSteps
});




}
/// @nodoc
class _$ReorderTestStepsEventCopyWithImpl<$Res>
    implements $ReorderTestStepsEventCopyWith<$Res> {
  _$ReorderTestStepsEventCopyWithImpl(this._self, this._then);

  final ReorderTestStepsEvent _self;
  final $Res Function(ReorderTestStepsEvent) _then;

/// Create a copy of TestStepEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reorderedSteps = null,}) {
  return _then(ReorderTestStepsEvent(
reorderedSteps: null == reorderedSteps ? _self._reorderedSteps : reorderedSteps // ignore: cast_nullable_to_non_nullable
as List<TestStepEntity>,
  ));
}


}

// dart format on
