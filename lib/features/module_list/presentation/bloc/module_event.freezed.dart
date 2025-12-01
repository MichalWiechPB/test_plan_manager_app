// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'module_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ModuleEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModuleEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ModuleEvent()';
}


}

/// @nodoc
class $ModuleEventCopyWith<$Res>  {
$ModuleEventCopyWith(ModuleEvent _, $Res Function(ModuleEvent) __);
}


/// Adds pattern-matching-related methods to [ModuleEvent].
extension ModuleEventPatterns on ModuleEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetModulesForProjectEvent value)?  getModulesForProject,TResult Function( GetSubmodulesForModuleEvent value)?  getSubmodulesForModule,TResult Function( LoadPreviewForModuleEvent value)?  loadPreviewForModule,TResult Function( NavigateBackEvent value)?  navigateBack,TResult Function( SetVisitedPathEvent value)?  setVisitedPath,TResult Function( CreateModuleEvent value)?  createModule,TResult Function( UpdateModuleEvent value)?  updateModule,TResult Function( DeleteModuleEvent value)?  deleteModule,TResult Function( CreateTestPlanEvent value)?  createTestPlan,TResult Function( UpdateTestPlanEvent value)?  updateTestPlan,TResult Function( DeleteTestPlanEvent value)?  deleteTestPlan,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetModulesForProjectEvent() when getModulesForProject != null:
return getModulesForProject(_that);case GetSubmodulesForModuleEvent() when getSubmodulesForModule != null:
return getSubmodulesForModule(_that);case LoadPreviewForModuleEvent() when loadPreviewForModule != null:
return loadPreviewForModule(_that);case NavigateBackEvent() when navigateBack != null:
return navigateBack(_that);case SetVisitedPathEvent() when setVisitedPath != null:
return setVisitedPath(_that);case CreateModuleEvent() when createModule != null:
return createModule(_that);case UpdateModuleEvent() when updateModule != null:
return updateModule(_that);case DeleteModuleEvent() when deleteModule != null:
return deleteModule(_that);case CreateTestPlanEvent() when createTestPlan != null:
return createTestPlan(_that);case UpdateTestPlanEvent() when updateTestPlan != null:
return updateTestPlan(_that);case DeleteTestPlanEvent() when deleteTestPlan != null:
return deleteTestPlan(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetModulesForProjectEvent value)  getModulesForProject,required TResult Function( GetSubmodulesForModuleEvent value)  getSubmodulesForModule,required TResult Function( LoadPreviewForModuleEvent value)  loadPreviewForModule,required TResult Function( NavigateBackEvent value)  navigateBack,required TResult Function( SetVisitedPathEvent value)  setVisitedPath,required TResult Function( CreateModuleEvent value)  createModule,required TResult Function( UpdateModuleEvent value)  updateModule,required TResult Function( DeleteModuleEvent value)  deleteModule,required TResult Function( CreateTestPlanEvent value)  createTestPlan,required TResult Function( UpdateTestPlanEvent value)  updateTestPlan,required TResult Function( DeleteTestPlanEvent value)  deleteTestPlan,}){
final _that = this;
switch (_that) {
case GetModulesForProjectEvent():
return getModulesForProject(_that);case GetSubmodulesForModuleEvent():
return getSubmodulesForModule(_that);case LoadPreviewForModuleEvent():
return loadPreviewForModule(_that);case NavigateBackEvent():
return navigateBack(_that);case SetVisitedPathEvent():
return setVisitedPath(_that);case CreateModuleEvent():
return createModule(_that);case UpdateModuleEvent():
return updateModule(_that);case DeleteModuleEvent():
return deleteModule(_that);case CreateTestPlanEvent():
return createTestPlan(_that);case UpdateTestPlanEvent():
return updateTestPlan(_that);case DeleteTestPlanEvent():
return deleteTestPlan(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetModulesForProjectEvent value)?  getModulesForProject,TResult? Function( GetSubmodulesForModuleEvent value)?  getSubmodulesForModule,TResult? Function( LoadPreviewForModuleEvent value)?  loadPreviewForModule,TResult? Function( NavigateBackEvent value)?  navigateBack,TResult? Function( SetVisitedPathEvent value)?  setVisitedPath,TResult? Function( CreateModuleEvent value)?  createModule,TResult? Function( UpdateModuleEvent value)?  updateModule,TResult? Function( DeleteModuleEvent value)?  deleteModule,TResult? Function( CreateTestPlanEvent value)?  createTestPlan,TResult? Function( UpdateTestPlanEvent value)?  updateTestPlan,TResult? Function( DeleteTestPlanEvent value)?  deleteTestPlan,}){
final _that = this;
switch (_that) {
case GetModulesForProjectEvent() when getModulesForProject != null:
return getModulesForProject(_that);case GetSubmodulesForModuleEvent() when getSubmodulesForModule != null:
return getSubmodulesForModule(_that);case LoadPreviewForModuleEvent() when loadPreviewForModule != null:
return loadPreviewForModule(_that);case NavigateBackEvent() when navigateBack != null:
return navigateBack(_that);case SetVisitedPathEvent() when setVisitedPath != null:
return setVisitedPath(_that);case CreateModuleEvent() when createModule != null:
return createModule(_that);case UpdateModuleEvent() when updateModule != null:
return updateModule(_that);case DeleteModuleEvent() when deleteModule != null:
return deleteModule(_that);case CreateTestPlanEvent() when createTestPlan != null:
return createTestPlan(_that);case UpdateTestPlanEvent() when updateTestPlan != null:
return updateTestPlan(_that);case DeleteTestPlanEvent() when deleteTestPlan != null:
return deleteTestPlan(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String projectId,  String? projectName)?  getModulesForProject,TResult Function( String moduleId)?  getSubmodulesForModule,TResult Function( String moduleId)?  loadPreviewForModule,TResult Function( String projectId)?  navigateBack,TResult Function( String projectId,  List<VisitedModule> visited)?  setVisitedPath,TResult Function( ModuleEntity module)?  createModule,TResult Function( ModuleEntity module)?  updateModule,TResult Function( String moduleId)?  deleteModule,TResult Function( TestPlanEntity plan)?  createTestPlan,TResult Function( TestPlanEntity plan)?  updateTestPlan,TResult Function( String testPlanId)?  deleteTestPlan,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetModulesForProjectEvent() when getModulesForProject != null:
return getModulesForProject(_that.projectId,_that.projectName);case GetSubmodulesForModuleEvent() when getSubmodulesForModule != null:
return getSubmodulesForModule(_that.moduleId);case LoadPreviewForModuleEvent() when loadPreviewForModule != null:
return loadPreviewForModule(_that.moduleId);case NavigateBackEvent() when navigateBack != null:
return navigateBack(_that.projectId);case SetVisitedPathEvent() when setVisitedPath != null:
return setVisitedPath(_that.projectId,_that.visited);case CreateModuleEvent() when createModule != null:
return createModule(_that.module);case UpdateModuleEvent() when updateModule != null:
return updateModule(_that.module);case DeleteModuleEvent() when deleteModule != null:
return deleteModule(_that.moduleId);case CreateTestPlanEvent() when createTestPlan != null:
return createTestPlan(_that.plan);case UpdateTestPlanEvent() when updateTestPlan != null:
return updateTestPlan(_that.plan);case DeleteTestPlanEvent() when deleteTestPlan != null:
return deleteTestPlan(_that.testPlanId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String projectId,  String? projectName)  getModulesForProject,required TResult Function( String moduleId)  getSubmodulesForModule,required TResult Function( String moduleId)  loadPreviewForModule,required TResult Function( String projectId)  navigateBack,required TResult Function( String projectId,  List<VisitedModule> visited)  setVisitedPath,required TResult Function( ModuleEntity module)  createModule,required TResult Function( ModuleEntity module)  updateModule,required TResult Function( String moduleId)  deleteModule,required TResult Function( TestPlanEntity plan)  createTestPlan,required TResult Function( TestPlanEntity plan)  updateTestPlan,required TResult Function( String testPlanId)  deleteTestPlan,}) {final _that = this;
switch (_that) {
case GetModulesForProjectEvent():
return getModulesForProject(_that.projectId,_that.projectName);case GetSubmodulesForModuleEvent():
return getSubmodulesForModule(_that.moduleId);case LoadPreviewForModuleEvent():
return loadPreviewForModule(_that.moduleId);case NavigateBackEvent():
return navigateBack(_that.projectId);case SetVisitedPathEvent():
return setVisitedPath(_that.projectId,_that.visited);case CreateModuleEvent():
return createModule(_that.module);case UpdateModuleEvent():
return updateModule(_that.module);case DeleteModuleEvent():
return deleteModule(_that.moduleId);case CreateTestPlanEvent():
return createTestPlan(_that.plan);case UpdateTestPlanEvent():
return updateTestPlan(_that.plan);case DeleteTestPlanEvent():
return deleteTestPlan(_that.testPlanId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String projectId,  String? projectName)?  getModulesForProject,TResult? Function( String moduleId)?  getSubmodulesForModule,TResult? Function( String moduleId)?  loadPreviewForModule,TResult? Function( String projectId)?  navigateBack,TResult? Function( String projectId,  List<VisitedModule> visited)?  setVisitedPath,TResult? Function( ModuleEntity module)?  createModule,TResult? Function( ModuleEntity module)?  updateModule,TResult? Function( String moduleId)?  deleteModule,TResult? Function( TestPlanEntity plan)?  createTestPlan,TResult? Function( TestPlanEntity plan)?  updateTestPlan,TResult? Function( String testPlanId)?  deleteTestPlan,}) {final _that = this;
switch (_that) {
case GetModulesForProjectEvent() when getModulesForProject != null:
return getModulesForProject(_that.projectId,_that.projectName);case GetSubmodulesForModuleEvent() when getSubmodulesForModule != null:
return getSubmodulesForModule(_that.moduleId);case LoadPreviewForModuleEvent() when loadPreviewForModule != null:
return loadPreviewForModule(_that.moduleId);case NavigateBackEvent() when navigateBack != null:
return navigateBack(_that.projectId);case SetVisitedPathEvent() when setVisitedPath != null:
return setVisitedPath(_that.projectId,_that.visited);case CreateModuleEvent() when createModule != null:
return createModule(_that.module);case UpdateModuleEvent() when updateModule != null:
return updateModule(_that.module);case DeleteModuleEvent() when deleteModule != null:
return deleteModule(_that.moduleId);case CreateTestPlanEvent() when createTestPlan != null:
return createTestPlan(_that.plan);case UpdateTestPlanEvent() when updateTestPlan != null:
return updateTestPlan(_that.plan);case DeleteTestPlanEvent() when deleteTestPlan != null:
return deleteTestPlan(_that.testPlanId);case _:
  return null;

}
}

}

/// @nodoc


class GetModulesForProjectEvent implements ModuleEvent {
  const GetModulesForProjectEvent({required this.projectId, this.projectName});
  

 final  String projectId;
 final  String? projectName;

/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetModulesForProjectEventCopyWith<GetModulesForProjectEvent> get copyWith => _$GetModulesForProjectEventCopyWithImpl<GetModulesForProjectEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetModulesForProjectEvent&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.projectName, projectName) || other.projectName == projectName));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,projectName);

@override
String toString() {
  return 'ModuleEvent.getModulesForProject(projectId: $projectId, projectName: $projectName)';
}


}

/// @nodoc
abstract mixin class $GetModulesForProjectEventCopyWith<$Res> implements $ModuleEventCopyWith<$Res> {
  factory $GetModulesForProjectEventCopyWith(GetModulesForProjectEvent value, $Res Function(GetModulesForProjectEvent) _then) = _$GetModulesForProjectEventCopyWithImpl;
@useResult
$Res call({
 String projectId, String? projectName
});




}
/// @nodoc
class _$GetModulesForProjectEventCopyWithImpl<$Res>
    implements $GetModulesForProjectEventCopyWith<$Res> {
  _$GetModulesForProjectEventCopyWithImpl(this._self, this._then);

  final GetModulesForProjectEvent _self;
  final $Res Function(GetModulesForProjectEvent) _then;

/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? projectName = freezed,}) {
  return _then(GetModulesForProjectEvent(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,projectName: freezed == projectName ? _self.projectName : projectName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class GetSubmodulesForModuleEvent implements ModuleEvent {
  const GetSubmodulesForModuleEvent({required this.moduleId});
  

 final  String moduleId;

/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetSubmodulesForModuleEventCopyWith<GetSubmodulesForModuleEvent> get copyWith => _$GetSubmodulesForModuleEventCopyWithImpl<GetSubmodulesForModuleEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSubmodulesForModuleEvent&&(identical(other.moduleId, moduleId) || other.moduleId == moduleId));
}


@override
int get hashCode => Object.hash(runtimeType,moduleId);

@override
String toString() {
  return 'ModuleEvent.getSubmodulesForModule(moduleId: $moduleId)';
}


}

/// @nodoc
abstract mixin class $GetSubmodulesForModuleEventCopyWith<$Res> implements $ModuleEventCopyWith<$Res> {
  factory $GetSubmodulesForModuleEventCopyWith(GetSubmodulesForModuleEvent value, $Res Function(GetSubmodulesForModuleEvent) _then) = _$GetSubmodulesForModuleEventCopyWithImpl;
@useResult
$Res call({
 String moduleId
});




}
/// @nodoc
class _$GetSubmodulesForModuleEventCopyWithImpl<$Res>
    implements $GetSubmodulesForModuleEventCopyWith<$Res> {
  _$GetSubmodulesForModuleEventCopyWithImpl(this._self, this._then);

  final GetSubmodulesForModuleEvent _self;
  final $Res Function(GetSubmodulesForModuleEvent) _then;

/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? moduleId = null,}) {
  return _then(GetSubmodulesForModuleEvent(
moduleId: null == moduleId ? _self.moduleId : moduleId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadPreviewForModuleEvent implements ModuleEvent {
  const LoadPreviewForModuleEvent({required this.moduleId});
  

 final  String moduleId;

/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadPreviewForModuleEventCopyWith<LoadPreviewForModuleEvent> get copyWith => _$LoadPreviewForModuleEventCopyWithImpl<LoadPreviewForModuleEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadPreviewForModuleEvent&&(identical(other.moduleId, moduleId) || other.moduleId == moduleId));
}


@override
int get hashCode => Object.hash(runtimeType,moduleId);

@override
String toString() {
  return 'ModuleEvent.loadPreviewForModule(moduleId: $moduleId)';
}


}

/// @nodoc
abstract mixin class $LoadPreviewForModuleEventCopyWith<$Res> implements $ModuleEventCopyWith<$Res> {
  factory $LoadPreviewForModuleEventCopyWith(LoadPreviewForModuleEvent value, $Res Function(LoadPreviewForModuleEvent) _then) = _$LoadPreviewForModuleEventCopyWithImpl;
@useResult
$Res call({
 String moduleId
});




}
/// @nodoc
class _$LoadPreviewForModuleEventCopyWithImpl<$Res>
    implements $LoadPreviewForModuleEventCopyWith<$Res> {
  _$LoadPreviewForModuleEventCopyWithImpl(this._self, this._then);

  final LoadPreviewForModuleEvent _self;
  final $Res Function(LoadPreviewForModuleEvent) _then;

/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? moduleId = null,}) {
  return _then(LoadPreviewForModuleEvent(
moduleId: null == moduleId ? _self.moduleId : moduleId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NavigateBackEvent implements ModuleEvent {
  const NavigateBackEvent({required this.projectId});
  

 final  String projectId;

/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateBackEventCopyWith<NavigateBackEvent> get copyWith => _$NavigateBackEventCopyWithImpl<NavigateBackEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigateBackEvent&&(identical(other.projectId, projectId) || other.projectId == projectId));
}


@override
int get hashCode => Object.hash(runtimeType,projectId);

@override
String toString() {
  return 'ModuleEvent.navigateBack(projectId: $projectId)';
}


}

/// @nodoc
abstract mixin class $NavigateBackEventCopyWith<$Res> implements $ModuleEventCopyWith<$Res> {
  factory $NavigateBackEventCopyWith(NavigateBackEvent value, $Res Function(NavigateBackEvent) _then) = _$NavigateBackEventCopyWithImpl;
@useResult
$Res call({
 String projectId
});




}
/// @nodoc
class _$NavigateBackEventCopyWithImpl<$Res>
    implements $NavigateBackEventCopyWith<$Res> {
  _$NavigateBackEventCopyWithImpl(this._self, this._then);

  final NavigateBackEvent _self;
  final $Res Function(NavigateBackEvent) _then;

/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,}) {
  return _then(NavigateBackEvent(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SetVisitedPathEvent implements ModuleEvent {
  const SetVisitedPathEvent({required this.projectId, required final  List<VisitedModule> visited}): _visited = visited;
  

 final  String projectId;
 final  List<VisitedModule> _visited;
 List<VisitedModule> get visited {
  if (_visited is EqualUnmodifiableListView) return _visited;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_visited);
}


/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetVisitedPathEventCopyWith<SetVisitedPathEvent> get copyWith => _$SetVisitedPathEventCopyWithImpl<SetVisitedPathEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetVisitedPathEvent&&(identical(other.projectId, projectId) || other.projectId == projectId)&&const DeepCollectionEquality().equals(other._visited, _visited));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,const DeepCollectionEquality().hash(_visited));

@override
String toString() {
  return 'ModuleEvent.setVisitedPath(projectId: $projectId, visited: $visited)';
}


}

/// @nodoc
abstract mixin class $SetVisitedPathEventCopyWith<$Res> implements $ModuleEventCopyWith<$Res> {
  factory $SetVisitedPathEventCopyWith(SetVisitedPathEvent value, $Res Function(SetVisitedPathEvent) _then) = _$SetVisitedPathEventCopyWithImpl;
@useResult
$Res call({
 String projectId, List<VisitedModule> visited
});




}
/// @nodoc
class _$SetVisitedPathEventCopyWithImpl<$Res>
    implements $SetVisitedPathEventCopyWith<$Res> {
  _$SetVisitedPathEventCopyWithImpl(this._self, this._then);

  final SetVisitedPathEvent _self;
  final $Res Function(SetVisitedPathEvent) _then;

/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? visited = null,}) {
  return _then(SetVisitedPathEvent(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,visited: null == visited ? _self._visited : visited // ignore: cast_nullable_to_non_nullable
as List<VisitedModule>,
  ));
}


}

/// @nodoc


class CreateModuleEvent implements ModuleEvent {
  const CreateModuleEvent({required this.module});
  

 final  ModuleEntity module;

/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateModuleEventCopyWith<CreateModuleEvent> get copyWith => _$CreateModuleEventCopyWithImpl<CreateModuleEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateModuleEvent&&(identical(other.module, module) || other.module == module));
}


@override
int get hashCode => Object.hash(runtimeType,module);

@override
String toString() {
  return 'ModuleEvent.createModule(module: $module)';
}


}

/// @nodoc
abstract mixin class $CreateModuleEventCopyWith<$Res> implements $ModuleEventCopyWith<$Res> {
  factory $CreateModuleEventCopyWith(CreateModuleEvent value, $Res Function(CreateModuleEvent) _then) = _$CreateModuleEventCopyWithImpl;
@useResult
$Res call({
 ModuleEntity module
});




}
/// @nodoc
class _$CreateModuleEventCopyWithImpl<$Res>
    implements $CreateModuleEventCopyWith<$Res> {
  _$CreateModuleEventCopyWithImpl(this._self, this._then);

  final CreateModuleEvent _self;
  final $Res Function(CreateModuleEvent) _then;

/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? module = null,}) {
  return _then(CreateModuleEvent(
module: null == module ? _self.module : module // ignore: cast_nullable_to_non_nullable
as ModuleEntity,
  ));
}


}

/// @nodoc


class UpdateModuleEvent implements ModuleEvent {
  const UpdateModuleEvent({required this.module});
  

 final  ModuleEntity module;

/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateModuleEventCopyWith<UpdateModuleEvent> get copyWith => _$UpdateModuleEventCopyWithImpl<UpdateModuleEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateModuleEvent&&(identical(other.module, module) || other.module == module));
}


@override
int get hashCode => Object.hash(runtimeType,module);

@override
String toString() {
  return 'ModuleEvent.updateModule(module: $module)';
}


}

/// @nodoc
abstract mixin class $UpdateModuleEventCopyWith<$Res> implements $ModuleEventCopyWith<$Res> {
  factory $UpdateModuleEventCopyWith(UpdateModuleEvent value, $Res Function(UpdateModuleEvent) _then) = _$UpdateModuleEventCopyWithImpl;
@useResult
$Res call({
 ModuleEntity module
});




}
/// @nodoc
class _$UpdateModuleEventCopyWithImpl<$Res>
    implements $UpdateModuleEventCopyWith<$Res> {
  _$UpdateModuleEventCopyWithImpl(this._self, this._then);

  final UpdateModuleEvent _self;
  final $Res Function(UpdateModuleEvent) _then;

/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? module = null,}) {
  return _then(UpdateModuleEvent(
module: null == module ? _self.module : module // ignore: cast_nullable_to_non_nullable
as ModuleEntity,
  ));
}


}

/// @nodoc


class DeleteModuleEvent implements ModuleEvent {
  const DeleteModuleEvent({required this.moduleId});
  

 final  String moduleId;

/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteModuleEventCopyWith<DeleteModuleEvent> get copyWith => _$DeleteModuleEventCopyWithImpl<DeleteModuleEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteModuleEvent&&(identical(other.moduleId, moduleId) || other.moduleId == moduleId));
}


@override
int get hashCode => Object.hash(runtimeType,moduleId);

@override
String toString() {
  return 'ModuleEvent.deleteModule(moduleId: $moduleId)';
}


}

/// @nodoc
abstract mixin class $DeleteModuleEventCopyWith<$Res> implements $ModuleEventCopyWith<$Res> {
  factory $DeleteModuleEventCopyWith(DeleteModuleEvent value, $Res Function(DeleteModuleEvent) _then) = _$DeleteModuleEventCopyWithImpl;
@useResult
$Res call({
 String moduleId
});




}
/// @nodoc
class _$DeleteModuleEventCopyWithImpl<$Res>
    implements $DeleteModuleEventCopyWith<$Res> {
  _$DeleteModuleEventCopyWithImpl(this._self, this._then);

  final DeleteModuleEvent _self;
  final $Res Function(DeleteModuleEvent) _then;

/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? moduleId = null,}) {
  return _then(DeleteModuleEvent(
moduleId: null == moduleId ? _self.moduleId : moduleId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CreateTestPlanEvent implements ModuleEvent {
  const CreateTestPlanEvent({required this.plan});
  

 final  TestPlanEntity plan;

/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTestPlanEventCopyWith<CreateTestPlanEvent> get copyWith => _$CreateTestPlanEventCopyWithImpl<CreateTestPlanEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTestPlanEvent&&(identical(other.plan, plan) || other.plan == plan));
}


@override
int get hashCode => Object.hash(runtimeType,plan);

@override
String toString() {
  return 'ModuleEvent.createTestPlan(plan: $plan)';
}


}

/// @nodoc
abstract mixin class $CreateTestPlanEventCopyWith<$Res> implements $ModuleEventCopyWith<$Res> {
  factory $CreateTestPlanEventCopyWith(CreateTestPlanEvent value, $Res Function(CreateTestPlanEvent) _then) = _$CreateTestPlanEventCopyWithImpl;
@useResult
$Res call({
 TestPlanEntity plan
});




}
/// @nodoc
class _$CreateTestPlanEventCopyWithImpl<$Res>
    implements $CreateTestPlanEventCopyWith<$Res> {
  _$CreateTestPlanEventCopyWithImpl(this._self, this._then);

  final CreateTestPlanEvent _self;
  final $Res Function(CreateTestPlanEvent) _then;

/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? plan = null,}) {
  return _then(CreateTestPlanEvent(
plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as TestPlanEntity,
  ));
}


}

/// @nodoc


class UpdateTestPlanEvent implements ModuleEvent {
  const UpdateTestPlanEvent({required this.plan});
  

 final  TestPlanEntity plan;

/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateTestPlanEventCopyWith<UpdateTestPlanEvent> get copyWith => _$UpdateTestPlanEventCopyWithImpl<UpdateTestPlanEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateTestPlanEvent&&(identical(other.plan, plan) || other.plan == plan));
}


@override
int get hashCode => Object.hash(runtimeType,plan);

@override
String toString() {
  return 'ModuleEvent.updateTestPlan(plan: $plan)';
}


}

/// @nodoc
abstract mixin class $UpdateTestPlanEventCopyWith<$Res> implements $ModuleEventCopyWith<$Res> {
  factory $UpdateTestPlanEventCopyWith(UpdateTestPlanEvent value, $Res Function(UpdateTestPlanEvent) _then) = _$UpdateTestPlanEventCopyWithImpl;
@useResult
$Res call({
 TestPlanEntity plan
});




}
/// @nodoc
class _$UpdateTestPlanEventCopyWithImpl<$Res>
    implements $UpdateTestPlanEventCopyWith<$Res> {
  _$UpdateTestPlanEventCopyWithImpl(this._self, this._then);

  final UpdateTestPlanEvent _self;
  final $Res Function(UpdateTestPlanEvent) _then;

/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? plan = null,}) {
  return _then(UpdateTestPlanEvent(
plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as TestPlanEntity,
  ));
}


}

/// @nodoc


class DeleteTestPlanEvent implements ModuleEvent {
  const DeleteTestPlanEvent({required this.testPlanId});
  

 final  String testPlanId;

/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteTestPlanEventCopyWith<DeleteTestPlanEvent> get copyWith => _$DeleteTestPlanEventCopyWithImpl<DeleteTestPlanEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteTestPlanEvent&&(identical(other.testPlanId, testPlanId) || other.testPlanId == testPlanId));
}


@override
int get hashCode => Object.hash(runtimeType,testPlanId);

@override
String toString() {
  return 'ModuleEvent.deleteTestPlan(testPlanId: $testPlanId)';
}


}

/// @nodoc
abstract mixin class $DeleteTestPlanEventCopyWith<$Res> implements $ModuleEventCopyWith<$Res> {
  factory $DeleteTestPlanEventCopyWith(DeleteTestPlanEvent value, $Res Function(DeleteTestPlanEvent) _then) = _$DeleteTestPlanEventCopyWithImpl;
@useResult
$Res call({
 String testPlanId
});




}
/// @nodoc
class _$DeleteTestPlanEventCopyWithImpl<$Res>
    implements $DeleteTestPlanEventCopyWith<$Res> {
  _$DeleteTestPlanEventCopyWithImpl(this._self, this._then);

  final DeleteTestPlanEvent _self;
  final $Res Function(DeleteTestPlanEvent) _then;

/// Create a copy of ModuleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? testPlanId = null,}) {
  return _then(DeleteTestPlanEvent(
testPlanId: null == testPlanId ? _self.testPlanId : testPlanId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
