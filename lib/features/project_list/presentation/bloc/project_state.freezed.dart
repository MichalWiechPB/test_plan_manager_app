// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectState()';
}


}

/// @nodoc
class $ProjectStateCopyWith<$Res>  {
$ProjectStateCopyWith(ProjectState _, $Res Function(ProjectState) __);
}


/// Adds pattern-matching-related methods to [ProjectState].
extension ProjectStatePatterns on ProjectState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProjectInitial value)?  initial,TResult Function( ProjectLoading value)?  loading,TResult Function( ProjectSuccess value)?  success,TResult Function( ProjectFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProjectInitial() when initial != null:
return initial(_that);case ProjectLoading() when loading != null:
return loading(_that);case ProjectSuccess() when success != null:
return success(_that);case ProjectFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProjectInitial value)  initial,required TResult Function( ProjectLoading value)  loading,required TResult Function( ProjectSuccess value)  success,required TResult Function( ProjectFailure value)  failure,}){
final _that = this;
switch (_that) {
case ProjectInitial():
return initial(_that);case ProjectLoading():
return loading(_that);case ProjectSuccess():
return success(_that);case ProjectFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProjectInitial value)?  initial,TResult? Function( ProjectLoading value)?  loading,TResult? Function( ProjectSuccess value)?  success,TResult? Function( ProjectFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ProjectInitial() when initial != null:
return initial(_that);case ProjectLoading() when loading != null:
return loading(_that);case ProjectSuccess() when success != null:
return success(_that);case ProjectFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ProjectEntity> projects)?  success,TResult Function( String errorMessage)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProjectInitial() when initial != null:
return initial();case ProjectLoading() when loading != null:
return loading();case ProjectSuccess() when success != null:
return success(_that.projects);case ProjectFailure() when failure != null:
return failure(_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ProjectEntity> projects)  success,required TResult Function( String errorMessage)  failure,}) {final _that = this;
switch (_that) {
case ProjectInitial():
return initial();case ProjectLoading():
return loading();case ProjectSuccess():
return success(_that.projects);case ProjectFailure():
return failure(_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ProjectEntity> projects)?  success,TResult? Function( String errorMessage)?  failure,}) {final _that = this;
switch (_that) {
case ProjectInitial() when initial != null:
return initial();case ProjectLoading() when loading != null:
return loading();case ProjectSuccess() when success != null:
return success(_that.projects);case ProjectFailure() when failure != null:
return failure(_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class ProjectInitial implements ProjectState {
  const ProjectInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectState.initial()';
}


}




/// @nodoc


class ProjectLoading implements ProjectState {
  const ProjectLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectState.loading()';
}


}




/// @nodoc


class ProjectSuccess implements ProjectState {
  const ProjectSuccess({required final  List<ProjectEntity> projects}): _projects = projects;
  

 final  List<ProjectEntity> _projects;
 List<ProjectEntity> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}


/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectSuccessCopyWith<ProjectSuccess> get copyWith => _$ProjectSuccessCopyWithImpl<ProjectSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectSuccess&&const DeepCollectionEquality().equals(other._projects, _projects));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_projects));

@override
String toString() {
  return 'ProjectState.success(projects: $projects)';
}


}

/// @nodoc
abstract mixin class $ProjectSuccessCopyWith<$Res> implements $ProjectStateCopyWith<$Res> {
  factory $ProjectSuccessCopyWith(ProjectSuccess value, $Res Function(ProjectSuccess) _then) = _$ProjectSuccessCopyWithImpl;
@useResult
$Res call({
 List<ProjectEntity> projects
});




}
/// @nodoc
class _$ProjectSuccessCopyWithImpl<$Res>
    implements $ProjectSuccessCopyWith<$Res> {
  _$ProjectSuccessCopyWithImpl(this._self, this._then);

  final ProjectSuccess _self;
  final $Res Function(ProjectSuccess) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projects = null,}) {
  return _then(ProjectSuccess(
projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectEntity>,
  ));
}


}

/// @nodoc


class ProjectFailure implements ProjectState {
  const ProjectFailure({required this.errorMessage});
  

 final  String errorMessage;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectFailureCopyWith<ProjectFailure> get copyWith => _$ProjectFailureCopyWithImpl<ProjectFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectFailure&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'ProjectState.failure(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ProjectFailureCopyWith<$Res> implements $ProjectStateCopyWith<$Res> {
  factory $ProjectFailureCopyWith(ProjectFailure value, $Res Function(ProjectFailure) _then) = _$ProjectFailureCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$ProjectFailureCopyWithImpl<$Res>
    implements $ProjectFailureCopyWith<$Res> {
  _$ProjectFailureCopyWithImpl(this._self, this._then);

  final ProjectFailure _self;
  final $Res Function(ProjectFailure) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(ProjectFailure(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
