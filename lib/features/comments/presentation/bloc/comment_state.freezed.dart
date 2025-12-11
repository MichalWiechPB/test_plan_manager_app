// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommentState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommentState()';
}


}

/// @nodoc
class $CommentStateCopyWith<$Res>  {
$CommentStateCopyWith(CommentState _, $Res Function(CommentState) __);
}


/// Adds pattern-matching-related methods to [CommentState].
extension CommentStatePatterns on CommentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CommentInitial value)?  initial,TResult Function( CommentLoading value)?  loading,TResult Function( CommentSuccess value)?  success,TResult Function( CommentFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CommentInitial() when initial != null:
return initial(_that);case CommentLoading() when loading != null:
return loading(_that);case CommentSuccess() when success != null:
return success(_that);case CommentFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CommentInitial value)  initial,required TResult Function( CommentLoading value)  loading,required TResult Function( CommentSuccess value)  success,required TResult Function( CommentFailure value)  failure,}){
final _that = this;
switch (_that) {
case CommentInitial():
return initial(_that);case CommentLoading():
return loading(_that);case CommentSuccess():
return success(_that);case CommentFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CommentInitial value)?  initial,TResult? Function( CommentLoading value)?  loading,TResult? Function( CommentSuccess value)?  success,TResult? Function( CommentFailure value)?  failure,}){
final _that = this;
switch (_that) {
case CommentInitial() when initial != null:
return initial(_that);case CommentLoading() when loading != null:
return loading(_that);case CommentSuccess() when success != null:
return success(_that);case CommentFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<CommentEntity> comments)?  success,TResult Function( String errorMessage)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CommentInitial() when initial != null:
return initial();case CommentLoading() when loading != null:
return loading();case CommentSuccess() when success != null:
return success(_that.comments);case CommentFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<CommentEntity> comments)  success,required TResult Function( String errorMessage)  failure,}) {final _that = this;
switch (_that) {
case CommentInitial():
return initial();case CommentLoading():
return loading();case CommentSuccess():
return success(_that.comments);case CommentFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<CommentEntity> comments)?  success,TResult? Function( String errorMessage)?  failure,}) {final _that = this;
switch (_that) {
case CommentInitial() when initial != null:
return initial();case CommentLoading() when loading != null:
return loading();case CommentSuccess() when success != null:
return success(_that.comments);case CommentFailure() when failure != null:
return failure(_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class CommentInitial implements CommentState {
  const CommentInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommentState.initial()';
}


}




/// @nodoc


class CommentLoading implements CommentState {
  const CommentLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommentState.loading()';
}


}




/// @nodoc


class CommentSuccess implements CommentState {
  const CommentSuccess({required final  List<CommentEntity> comments}): _comments = comments;
  

 final  List<CommentEntity> _comments;
 List<CommentEntity> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}


/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentSuccessCopyWith<CommentSuccess> get copyWith => _$CommentSuccessCopyWithImpl<CommentSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentSuccess&&const DeepCollectionEquality().equals(other._comments, _comments));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_comments));

@override
String toString() {
  return 'CommentState.success(comments: $comments)';
}


}

/// @nodoc
abstract mixin class $CommentSuccessCopyWith<$Res> implements $CommentStateCopyWith<$Res> {
  factory $CommentSuccessCopyWith(CommentSuccess value, $Res Function(CommentSuccess) _then) = _$CommentSuccessCopyWithImpl;
@useResult
$Res call({
 List<CommentEntity> comments
});




}
/// @nodoc
class _$CommentSuccessCopyWithImpl<$Res>
    implements $CommentSuccessCopyWith<$Res> {
  _$CommentSuccessCopyWithImpl(this._self, this._then);

  final CommentSuccess _self;
  final $Res Function(CommentSuccess) _then;

/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? comments = null,}) {
  return _then(CommentSuccess(
comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentEntity>,
  ));
}


}

/// @nodoc


class CommentFailure implements CommentState {
  const CommentFailure({required this.errorMessage});
  

 final  String errorMessage;

/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentFailureCopyWith<CommentFailure> get copyWith => _$CommentFailureCopyWithImpl<CommentFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentFailure&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'CommentState.failure(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CommentFailureCopyWith<$Res> implements $CommentStateCopyWith<$Res> {
  factory $CommentFailureCopyWith(CommentFailure value, $Res Function(CommentFailure) _then) = _$CommentFailureCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$CommentFailureCopyWithImpl<$Res>
    implements $CommentFailureCopyWith<$Res> {
  _$CommentFailureCopyWithImpl(this._self, this._then);

  final CommentFailure _self;
  final $Res Function(CommentFailure) _then;

/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(CommentFailure(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
