// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectEvent()';
}


}

/// @nodoc
class $ProjectEventCopyWith<$Res>  {
$ProjectEventCopyWith(ProjectEvent _, $Res Function(ProjectEvent) __);
}


/// Adds pattern-matching-related methods to [ProjectEvent].
extension ProjectEventPatterns on ProjectEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetAllProjectsEvent value)?  getAll,TResult Function( CreateProjectEvent value)?  create,TResult Function( UpdateProjectEvent value)?  update,TResult Function( DeleteProjectEvent value)?  delete,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetAllProjectsEvent() when getAll != null:
return getAll(_that);case CreateProjectEvent() when create != null:
return create(_that);case UpdateProjectEvent() when update != null:
return update(_that);case DeleteProjectEvent() when delete != null:
return delete(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetAllProjectsEvent value)  getAll,required TResult Function( CreateProjectEvent value)  create,required TResult Function( UpdateProjectEvent value)  update,required TResult Function( DeleteProjectEvent value)  delete,}){
final _that = this;
switch (_that) {
case GetAllProjectsEvent():
return getAll(_that);case CreateProjectEvent():
return create(_that);case UpdateProjectEvent():
return update(_that);case DeleteProjectEvent():
return delete(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetAllProjectsEvent value)?  getAll,TResult? Function( CreateProjectEvent value)?  create,TResult? Function( UpdateProjectEvent value)?  update,TResult? Function( DeleteProjectEvent value)?  delete,}){
final _that = this;
switch (_that) {
case GetAllProjectsEvent() when getAll != null:
return getAll(_that);case CreateProjectEvent() when create != null:
return create(_that);case UpdateProjectEvent() when update != null:
return update(_that);case DeleteProjectEvent() when delete != null:
return delete(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getAll,TResult Function( ProjectEntity project)?  create,TResult Function( ProjectEntity project)?  update,TResult Function( String id)?  delete,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetAllProjectsEvent() when getAll != null:
return getAll();case CreateProjectEvent() when create != null:
return create(_that.project);case UpdateProjectEvent() when update != null:
return update(_that.project);case DeleteProjectEvent() when delete != null:
return delete(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getAll,required TResult Function( ProjectEntity project)  create,required TResult Function( ProjectEntity project)  update,required TResult Function( String id)  delete,}) {final _that = this;
switch (_that) {
case GetAllProjectsEvent():
return getAll();case CreateProjectEvent():
return create(_that.project);case UpdateProjectEvent():
return update(_that.project);case DeleteProjectEvent():
return delete(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getAll,TResult? Function( ProjectEntity project)?  create,TResult? Function( ProjectEntity project)?  update,TResult? Function( String id)?  delete,}) {final _that = this;
switch (_that) {
case GetAllProjectsEvent() when getAll != null:
return getAll();case CreateProjectEvent() when create != null:
return create(_that.project);case UpdateProjectEvent() when update != null:
return update(_that.project);case DeleteProjectEvent() when delete != null:
return delete(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class GetAllProjectsEvent implements ProjectEvent {
  const GetAllProjectsEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllProjectsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectEvent.getAll()';
}


}




/// @nodoc


class CreateProjectEvent implements ProjectEvent {
  const CreateProjectEvent({required this.project});
  

 final  ProjectEntity project;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateProjectEventCopyWith<CreateProjectEvent> get copyWith => _$CreateProjectEventCopyWithImpl<CreateProjectEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProjectEvent&&(identical(other.project, project) || other.project == project));
}


@override
int get hashCode => Object.hash(runtimeType,project);

@override
String toString() {
  return 'ProjectEvent.create(project: $project)';
}


}

/// @nodoc
abstract mixin class $CreateProjectEventCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory $CreateProjectEventCopyWith(CreateProjectEvent value, $Res Function(CreateProjectEvent) _then) = _$CreateProjectEventCopyWithImpl;
@useResult
$Res call({
 ProjectEntity project
});




}
/// @nodoc
class _$CreateProjectEventCopyWithImpl<$Res>
    implements $CreateProjectEventCopyWith<$Res> {
  _$CreateProjectEventCopyWithImpl(this._self, this._then);

  final CreateProjectEvent _self;
  final $Res Function(CreateProjectEvent) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? project = null,}) {
  return _then(CreateProjectEvent(
project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as ProjectEntity,
  ));
}


}

/// @nodoc


class UpdateProjectEvent implements ProjectEvent {
  const UpdateProjectEvent({required this.project});
  

 final  ProjectEntity project;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProjectEventCopyWith<UpdateProjectEvent> get copyWith => _$UpdateProjectEventCopyWithImpl<UpdateProjectEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProjectEvent&&(identical(other.project, project) || other.project == project));
}


@override
int get hashCode => Object.hash(runtimeType,project);

@override
String toString() {
  return 'ProjectEvent.update(project: $project)';
}


}

/// @nodoc
abstract mixin class $UpdateProjectEventCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory $UpdateProjectEventCopyWith(UpdateProjectEvent value, $Res Function(UpdateProjectEvent) _then) = _$UpdateProjectEventCopyWithImpl;
@useResult
$Res call({
 ProjectEntity project
});




}
/// @nodoc
class _$UpdateProjectEventCopyWithImpl<$Res>
    implements $UpdateProjectEventCopyWith<$Res> {
  _$UpdateProjectEventCopyWithImpl(this._self, this._then);

  final UpdateProjectEvent _self;
  final $Res Function(UpdateProjectEvent) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? project = null,}) {
  return _then(UpdateProjectEvent(
project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as ProjectEntity,
  ));
}


}

/// @nodoc


class DeleteProjectEvent implements ProjectEvent {
  const DeleteProjectEvent({required this.id});
  

 final  String id;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteProjectEventCopyWith<DeleteProjectEvent> get copyWith => _$DeleteProjectEventCopyWithImpl<DeleteProjectEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteProjectEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ProjectEvent.delete(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeleteProjectEventCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory $DeleteProjectEventCopyWith(DeleteProjectEvent value, $Res Function(DeleteProjectEvent) _then) = _$DeleteProjectEventCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$DeleteProjectEventCopyWithImpl<$Res>
    implements $DeleteProjectEventCopyWith<$Res> {
  _$DeleteProjectEventCopyWithImpl(this._self, this._then);

  final DeleteProjectEvent _self;
  final $Res Function(DeleteProjectEvent) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeleteProjectEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
