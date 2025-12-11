// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_step_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TestStepState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestStepState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TestStepState()';
}


}

/// @nodoc
class $TestStepStateCopyWith<$Res>  {
$TestStepStateCopyWith(TestStepState _, $Res Function(TestStepState) __);
}


/// Adds pattern-matching-related methods to [TestStepState].
extension TestStepStatePatterns on TestStepState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TestStepInitial value)?  initial,TResult Function( TestStepLoading value)?  loading,TResult Function( TestStepSuccess value)?  success,TResult Function( TestStepFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TestStepInitial() when initial != null:
return initial(_that);case TestStepLoading() when loading != null:
return loading(_that);case TestStepSuccess() when success != null:
return success(_that);case TestStepFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TestStepInitial value)  initial,required TResult Function( TestStepLoading value)  loading,required TResult Function( TestStepSuccess value)  success,required TResult Function( TestStepFailure value)  failure,}){
final _that = this;
switch (_that) {
case TestStepInitial():
return initial(_that);case TestStepLoading():
return loading(_that);case TestStepSuccess():
return success(_that);case TestStepFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TestStepInitial value)?  initial,TResult? Function( TestStepLoading value)?  loading,TResult? Function( TestStepSuccess value)?  success,TResult? Function( TestStepFailure value)?  failure,}){
final _that = this;
switch (_that) {
case TestStepInitial() when initial != null:
return initial(_that);case TestStepLoading() when loading != null:
return loading(_that);case TestStepSuccess() when success != null:
return success(_that);case TestStepFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<TestStepEntity> steps)?  success,TResult Function( String errorMessage)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TestStepInitial() when initial != null:
return initial();case TestStepLoading() when loading != null:
return loading();case TestStepSuccess() when success != null:
return success(_that.steps);case TestStepFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<TestStepEntity> steps)  success,required TResult Function( String errorMessage)  failure,}) {final _that = this;
switch (_that) {
case TestStepInitial():
return initial();case TestStepLoading():
return loading();case TestStepSuccess():
return success(_that.steps);case TestStepFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<TestStepEntity> steps)?  success,TResult? Function( String errorMessage)?  failure,}) {final _that = this;
switch (_that) {
case TestStepInitial() when initial != null:
return initial();case TestStepLoading() when loading != null:
return loading();case TestStepSuccess() when success != null:
return success(_that.steps);case TestStepFailure() when failure != null:
return failure(_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class TestStepInitial implements TestStepState {
  const TestStepInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestStepInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TestStepState.initial()';
}


}




/// @nodoc


class TestStepLoading implements TestStepState {
  const TestStepLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestStepLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TestStepState.loading()';
}


}




/// @nodoc


class TestStepSuccess implements TestStepState {
  const TestStepSuccess({required final  List<TestStepEntity> steps}): _steps = steps;
  

 final  List<TestStepEntity> _steps;
 List<TestStepEntity> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}


/// Create a copy of TestStepState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestStepSuccessCopyWith<TestStepSuccess> get copyWith => _$TestStepSuccessCopyWithImpl<TestStepSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestStepSuccess&&const DeepCollectionEquality().equals(other._steps, _steps));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_steps));

@override
String toString() {
  return 'TestStepState.success(steps: $steps)';
}


}

/// @nodoc
abstract mixin class $TestStepSuccessCopyWith<$Res> implements $TestStepStateCopyWith<$Res> {
  factory $TestStepSuccessCopyWith(TestStepSuccess value, $Res Function(TestStepSuccess) _then) = _$TestStepSuccessCopyWithImpl;
@useResult
$Res call({
 List<TestStepEntity> steps
});




}
/// @nodoc
class _$TestStepSuccessCopyWithImpl<$Res>
    implements $TestStepSuccessCopyWith<$Res> {
  _$TestStepSuccessCopyWithImpl(this._self, this._then);

  final TestStepSuccess _self;
  final $Res Function(TestStepSuccess) _then;

/// Create a copy of TestStepState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? steps = null,}) {
  return _then(TestStepSuccess(
steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<TestStepEntity>,
  ));
}


}

/// @nodoc


class TestStepFailure implements TestStepState {
  const TestStepFailure({required this.errorMessage});
  

 final  String errorMessage;

/// Create a copy of TestStepState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestStepFailureCopyWith<TestStepFailure> get copyWith => _$TestStepFailureCopyWithImpl<TestStepFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestStepFailure&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'TestStepState.failure(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $TestStepFailureCopyWith<$Res> implements $TestStepStateCopyWith<$Res> {
  factory $TestStepFailureCopyWith(TestStepFailure value, $Res Function(TestStepFailure) _then) = _$TestStepFailureCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$TestStepFailureCopyWithImpl<$Res>
    implements $TestStepFailureCopyWith<$Res> {
  _$TestStepFailureCopyWithImpl(this._self, this._then);

  final TestStepFailure _self;
  final $Res Function(TestStepFailure) _then;

/// Create a copy of TestStepState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(TestStepFailure(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
