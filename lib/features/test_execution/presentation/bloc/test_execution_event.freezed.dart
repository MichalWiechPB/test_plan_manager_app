// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_execution_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TestExecutionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestExecutionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TestExecutionEvent()';
}


}

/// @nodoc
class $TestExecutionEventCopyWith<$Res>  {
$TestExecutionEventCopyWith(TestExecutionEvent _, $Res Function(TestExecutionEvent) __);
}


/// Adds pattern-matching-related methods to [TestExecutionEvent].
extension TestExecutionEventPatterns on TestExecutionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetAllProjectsForTestsEvent value)?  getAllProjectsForTests,TResult Function( GetProjectStructureEvent value)?  getProjectStructure,TResult Function( UpdateStepTempStatusEvent value)?  updateStepTempStatus,TResult Function( ExportToFileEvent value)?  exportToFile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetAllProjectsForTestsEvent() when getAllProjectsForTests != null:
return getAllProjectsForTests(_that);case GetProjectStructureEvent() when getProjectStructure != null:
return getProjectStructure(_that);case UpdateStepTempStatusEvent() when updateStepTempStatus != null:
return updateStepTempStatus(_that);case ExportToFileEvent() when exportToFile != null:
return exportToFile(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetAllProjectsForTestsEvent value)  getAllProjectsForTests,required TResult Function( GetProjectStructureEvent value)  getProjectStructure,required TResult Function( UpdateStepTempStatusEvent value)  updateStepTempStatus,required TResult Function( ExportToFileEvent value)  exportToFile,}){
final _that = this;
switch (_that) {
case GetAllProjectsForTestsEvent():
return getAllProjectsForTests(_that);case GetProjectStructureEvent():
return getProjectStructure(_that);case UpdateStepTempStatusEvent():
return updateStepTempStatus(_that);case ExportToFileEvent():
return exportToFile(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetAllProjectsForTestsEvent value)?  getAllProjectsForTests,TResult? Function( GetProjectStructureEvent value)?  getProjectStructure,TResult? Function( UpdateStepTempStatusEvent value)?  updateStepTempStatus,TResult? Function( ExportToFileEvent value)?  exportToFile,}){
final _that = this;
switch (_that) {
case GetAllProjectsForTestsEvent() when getAllProjectsForTests != null:
return getAllProjectsForTests(_that);case GetProjectStructureEvent() when getProjectStructure != null:
return getProjectStructure(_that);case UpdateStepTempStatusEvent() when updateStepTempStatus != null:
return updateStepTempStatus(_that);case ExportToFileEvent() when exportToFile != null:
return exportToFile(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getAllProjectsForTests,TResult Function( String projectId)?  getProjectStructure,TResult Function( StepStatusPathEntity stepStatus)?  updateStepTempStatus,TResult Function()?  exportToFile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetAllProjectsForTestsEvent() when getAllProjectsForTests != null:
return getAllProjectsForTests();case GetProjectStructureEvent() when getProjectStructure != null:
return getProjectStructure(_that.projectId);case UpdateStepTempStatusEvent() when updateStepTempStatus != null:
return updateStepTempStatus(_that.stepStatus);case ExportToFileEvent() when exportToFile != null:
return exportToFile();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getAllProjectsForTests,required TResult Function( String projectId)  getProjectStructure,required TResult Function( StepStatusPathEntity stepStatus)  updateStepTempStatus,required TResult Function()  exportToFile,}) {final _that = this;
switch (_that) {
case GetAllProjectsForTestsEvent():
return getAllProjectsForTests();case GetProjectStructureEvent():
return getProjectStructure(_that.projectId);case UpdateStepTempStatusEvent():
return updateStepTempStatus(_that.stepStatus);case ExportToFileEvent():
return exportToFile();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getAllProjectsForTests,TResult? Function( String projectId)?  getProjectStructure,TResult? Function( StepStatusPathEntity stepStatus)?  updateStepTempStatus,TResult? Function()?  exportToFile,}) {final _that = this;
switch (_that) {
case GetAllProjectsForTestsEvent() when getAllProjectsForTests != null:
return getAllProjectsForTests();case GetProjectStructureEvent() when getProjectStructure != null:
return getProjectStructure(_that.projectId);case UpdateStepTempStatusEvent() when updateStepTempStatus != null:
return updateStepTempStatus(_that.stepStatus);case ExportToFileEvent() when exportToFile != null:
return exportToFile();case _:
  return null;

}
}

}

/// @nodoc


class GetAllProjectsForTestsEvent implements TestExecutionEvent {
  const GetAllProjectsForTestsEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllProjectsForTestsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TestExecutionEvent.getAllProjectsForTests()';
}


}




/// @nodoc


class GetProjectStructureEvent implements TestExecutionEvent {
  const GetProjectStructureEvent({required this.projectId});
  

 final  String projectId;

/// Create a copy of TestExecutionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetProjectStructureEventCopyWith<GetProjectStructureEvent> get copyWith => _$GetProjectStructureEventCopyWithImpl<GetProjectStructureEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProjectStructureEvent&&(identical(other.projectId, projectId) || other.projectId == projectId));
}


@override
int get hashCode => Object.hash(runtimeType,projectId);

@override
String toString() {
  return 'TestExecutionEvent.getProjectStructure(projectId: $projectId)';
}


}

/// @nodoc
abstract mixin class $GetProjectStructureEventCopyWith<$Res> implements $TestExecutionEventCopyWith<$Res> {
  factory $GetProjectStructureEventCopyWith(GetProjectStructureEvent value, $Res Function(GetProjectStructureEvent) _then) = _$GetProjectStructureEventCopyWithImpl;
@useResult
$Res call({
 String projectId
});




}
/// @nodoc
class _$GetProjectStructureEventCopyWithImpl<$Res>
    implements $GetProjectStructureEventCopyWith<$Res> {
  _$GetProjectStructureEventCopyWithImpl(this._self, this._then);

  final GetProjectStructureEvent _self;
  final $Res Function(GetProjectStructureEvent) _then;

/// Create a copy of TestExecutionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,}) {
  return _then(GetProjectStructureEvent(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateStepTempStatusEvent implements TestExecutionEvent {
  const UpdateStepTempStatusEvent({required this.stepStatus});
  

 final  StepStatusPathEntity stepStatus;

/// Create a copy of TestExecutionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateStepTempStatusEventCopyWith<UpdateStepTempStatusEvent> get copyWith => _$UpdateStepTempStatusEventCopyWithImpl<UpdateStepTempStatusEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateStepTempStatusEvent&&(identical(other.stepStatus, stepStatus) || other.stepStatus == stepStatus));
}


@override
int get hashCode => Object.hash(runtimeType,stepStatus);

@override
String toString() {
  return 'TestExecutionEvent.updateStepTempStatus(stepStatus: $stepStatus)';
}


}

/// @nodoc
abstract mixin class $UpdateStepTempStatusEventCopyWith<$Res> implements $TestExecutionEventCopyWith<$Res> {
  factory $UpdateStepTempStatusEventCopyWith(UpdateStepTempStatusEvent value, $Res Function(UpdateStepTempStatusEvent) _then) = _$UpdateStepTempStatusEventCopyWithImpl;
@useResult
$Res call({
 StepStatusPathEntity stepStatus
});




}
/// @nodoc
class _$UpdateStepTempStatusEventCopyWithImpl<$Res>
    implements $UpdateStepTempStatusEventCopyWith<$Res> {
  _$UpdateStepTempStatusEventCopyWithImpl(this._self, this._then);

  final UpdateStepTempStatusEvent _self;
  final $Res Function(UpdateStepTempStatusEvent) _then;

/// Create a copy of TestExecutionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? stepStatus = null,}) {
  return _then(UpdateStepTempStatusEvent(
stepStatus: null == stepStatus ? _self.stepStatus : stepStatus // ignore: cast_nullable_to_non_nullable
as StepStatusPathEntity,
  ));
}


}

/// @nodoc


class ExportToFileEvent implements TestExecutionEvent {
  const ExportToFileEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExportToFileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TestExecutionEvent.exportToFile()';
}


}




// dart format on
