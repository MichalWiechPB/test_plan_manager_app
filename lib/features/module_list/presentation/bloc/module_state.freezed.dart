// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'module_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ModuleState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModuleState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ModuleState()';
}


}

/// @nodoc
class $ModuleStateCopyWith<$Res>  {
$ModuleStateCopyWith(ModuleState _, $Res Function(ModuleState) __);
}


/// Adds pattern-matching-related methods to [ModuleState].
extension ModuleStatePatterns on ModuleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ModuleInitial value)?  initial,TResult Function( ModuleLoading value)?  loading,TResult Function( ModuleSuccess value)?  success,TResult Function( ModuleFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ModuleInitial() when initial != null:
return initial(_that);case ModuleLoading() when loading != null:
return loading(_that);case ModuleSuccess() when success != null:
return success(_that);case ModuleFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ModuleInitial value)  initial,required TResult Function( ModuleLoading value)  loading,required TResult Function( ModuleSuccess value)  success,required TResult Function( ModuleFailure value)  failure,}){
final _that = this;
switch (_that) {
case ModuleInitial():
return initial(_that);case ModuleLoading():
return loading(_that);case ModuleSuccess():
return success(_that);case ModuleFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ModuleInitial value)?  initial,TResult? Function( ModuleLoading value)?  loading,TResult? Function( ModuleSuccess value)?  success,TResult? Function( ModuleFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ModuleInitial() when initial != null:
return initial(_that);case ModuleLoading() when loading != null:
return loading(_that);case ModuleSuccess() when success != null:
return success(_that);case ModuleFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ModuleEntity> modules,  Map<String, List<ModuleEntity>> submodules,  Map<String, List<TestPlanEntity>> testPlans,  List<VisitedModule> visitedModules,  String? currentProjectId,  String? projectName)?  success,TResult Function( String errorMessage)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ModuleInitial() when initial != null:
return initial();case ModuleLoading() when loading != null:
return loading();case ModuleSuccess() when success != null:
return success(_that.modules,_that.submodules,_that.testPlans,_that.visitedModules,_that.currentProjectId,_that.projectName);case ModuleFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ModuleEntity> modules,  Map<String, List<ModuleEntity>> submodules,  Map<String, List<TestPlanEntity>> testPlans,  List<VisitedModule> visitedModules,  String? currentProjectId,  String? projectName)  success,required TResult Function( String errorMessage)  failure,}) {final _that = this;
switch (_that) {
case ModuleInitial():
return initial();case ModuleLoading():
return loading();case ModuleSuccess():
return success(_that.modules,_that.submodules,_that.testPlans,_that.visitedModules,_that.currentProjectId,_that.projectName);case ModuleFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ModuleEntity> modules,  Map<String, List<ModuleEntity>> submodules,  Map<String, List<TestPlanEntity>> testPlans,  List<VisitedModule> visitedModules,  String? currentProjectId,  String? projectName)?  success,TResult? Function( String errorMessage)?  failure,}) {final _that = this;
switch (_that) {
case ModuleInitial() when initial != null:
return initial();case ModuleLoading() when loading != null:
return loading();case ModuleSuccess() when success != null:
return success(_that.modules,_that.submodules,_that.testPlans,_that.visitedModules,_that.currentProjectId,_that.projectName);case ModuleFailure() when failure != null:
return failure(_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class ModuleInitial implements ModuleState {
  const ModuleInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModuleInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ModuleState.initial()';
}


}




/// @nodoc


class ModuleLoading implements ModuleState {
  const ModuleLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModuleLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ModuleState.loading()';
}


}




/// @nodoc


class ModuleSuccess implements ModuleState {
  const ModuleSuccess({required final  List<ModuleEntity> modules, required final  Map<String, List<ModuleEntity>> submodules, required final  Map<String, List<TestPlanEntity>> testPlans, required final  List<VisitedModule> visitedModules, this.currentProjectId, this.projectName}): _modules = modules,_submodules = submodules,_testPlans = testPlans,_visitedModules = visitedModules;
  

 final  List<ModuleEntity> _modules;
 List<ModuleEntity> get modules {
  if (_modules is EqualUnmodifiableListView) return _modules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_modules);
}

 final  Map<String, List<ModuleEntity>> _submodules;
 Map<String, List<ModuleEntity>> get submodules {
  if (_submodules is EqualUnmodifiableMapView) return _submodules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_submodules);
}

 final  Map<String, List<TestPlanEntity>> _testPlans;
 Map<String, List<TestPlanEntity>> get testPlans {
  if (_testPlans is EqualUnmodifiableMapView) return _testPlans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_testPlans);
}

 final  List<VisitedModule> _visitedModules;
 List<VisitedModule> get visitedModules {
  if (_visitedModules is EqualUnmodifiableListView) return _visitedModules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_visitedModules);
}

 final  String? currentProjectId;
 final  String? projectName;

/// Create a copy of ModuleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModuleSuccessCopyWith<ModuleSuccess> get copyWith => _$ModuleSuccessCopyWithImpl<ModuleSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModuleSuccess&&const DeepCollectionEquality().equals(other._modules, _modules)&&const DeepCollectionEquality().equals(other._submodules, _submodules)&&const DeepCollectionEquality().equals(other._testPlans, _testPlans)&&const DeepCollectionEquality().equals(other._visitedModules, _visitedModules)&&(identical(other.currentProjectId, currentProjectId) || other.currentProjectId == currentProjectId)&&(identical(other.projectName, projectName) || other.projectName == projectName));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_modules),const DeepCollectionEquality().hash(_submodules),const DeepCollectionEquality().hash(_testPlans),const DeepCollectionEquality().hash(_visitedModules),currentProjectId,projectName);

@override
String toString() {
  return 'ModuleState.success(modules: $modules, submodules: $submodules, testPlans: $testPlans, visitedModules: $visitedModules, currentProjectId: $currentProjectId, projectName: $projectName)';
}


}

/// @nodoc
abstract mixin class $ModuleSuccessCopyWith<$Res> implements $ModuleStateCopyWith<$Res> {
  factory $ModuleSuccessCopyWith(ModuleSuccess value, $Res Function(ModuleSuccess) _then) = _$ModuleSuccessCopyWithImpl;
@useResult
$Res call({
 List<ModuleEntity> modules, Map<String, List<ModuleEntity>> submodules, Map<String, List<TestPlanEntity>> testPlans, List<VisitedModule> visitedModules, String? currentProjectId, String? projectName
});




}
/// @nodoc
class _$ModuleSuccessCopyWithImpl<$Res>
    implements $ModuleSuccessCopyWith<$Res> {
  _$ModuleSuccessCopyWithImpl(this._self, this._then);

  final ModuleSuccess _self;
  final $Res Function(ModuleSuccess) _then;

/// Create a copy of ModuleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? modules = null,Object? submodules = null,Object? testPlans = null,Object? visitedModules = null,Object? currentProjectId = freezed,Object? projectName = freezed,}) {
  return _then(ModuleSuccess(
modules: null == modules ? _self._modules : modules // ignore: cast_nullable_to_non_nullable
as List<ModuleEntity>,submodules: null == submodules ? _self._submodules : submodules // ignore: cast_nullable_to_non_nullable
as Map<String, List<ModuleEntity>>,testPlans: null == testPlans ? _self._testPlans : testPlans // ignore: cast_nullable_to_non_nullable
as Map<String, List<TestPlanEntity>>,visitedModules: null == visitedModules ? _self._visitedModules : visitedModules // ignore: cast_nullable_to_non_nullable
as List<VisitedModule>,currentProjectId: freezed == currentProjectId ? _self.currentProjectId : currentProjectId // ignore: cast_nullable_to_non_nullable
as String?,projectName: freezed == projectName ? _self.projectName : projectName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ModuleFailure implements ModuleState {
  const ModuleFailure({required this.errorMessage});
  

 final  String errorMessage;

/// Create a copy of ModuleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModuleFailureCopyWith<ModuleFailure> get copyWith => _$ModuleFailureCopyWithImpl<ModuleFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModuleFailure&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'ModuleState.failure(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ModuleFailureCopyWith<$Res> implements $ModuleStateCopyWith<$Res> {
  factory $ModuleFailureCopyWith(ModuleFailure value, $Res Function(ModuleFailure) _then) = _$ModuleFailureCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$ModuleFailureCopyWithImpl<$Res>
    implements $ModuleFailureCopyWith<$Res> {
  _$ModuleFailureCopyWithImpl(this._self, this._then);

  final ModuleFailure _self;
  final $Res Function(ModuleFailure) _then;

/// Create a copy of ModuleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(ModuleFailure(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
