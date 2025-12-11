// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_plan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TestPlanState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestPlanState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TestPlanState()';
}


}

/// @nodoc
class $TestPlanStateCopyWith<$Res>  {
$TestPlanStateCopyWith(TestPlanState _, $Res Function(TestPlanState) __);
}


/// Adds pattern-matching-related methods to [TestPlanState].
extension TestPlanStatePatterns on TestPlanState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TestPlanInitial value)?  initial,TResult Function( TestPlanLoading value)?  loading,TResult Function( TestPlanSuccess value)?  success,TResult Function( TestPlanFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TestPlanInitial() when initial != null:
return initial(_that);case TestPlanLoading() when loading != null:
return loading(_that);case TestPlanSuccess() when success != null:
return success(_that);case TestPlanFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TestPlanInitial value)  initial,required TResult Function( TestPlanLoading value)  loading,required TResult Function( TestPlanSuccess value)  success,required TResult Function( TestPlanFailure value)  failure,}){
final _that = this;
switch (_that) {
case TestPlanInitial():
return initial(_that);case TestPlanLoading():
return loading(_that);case TestPlanSuccess():
return success(_that);case TestPlanFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TestPlanInitial value)?  initial,TResult? Function( TestPlanLoading value)?  loading,TResult? Function( TestPlanSuccess value)?  success,TResult? Function( TestPlanFailure value)?  failure,}){
final _that = this;
switch (_that) {
case TestPlanInitial() when initial != null:
return initial(_that);case TestPlanLoading() when loading != null:
return loading(_that);case TestPlanSuccess() when success != null:
return success(_that);case TestPlanFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<TestCaseEntity> testCases)?  success,TResult Function( String errorMessage)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TestPlanInitial() when initial != null:
return initial();case TestPlanLoading() when loading != null:
return loading();case TestPlanSuccess() when success != null:
return success(_that.testCases);case TestPlanFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<TestCaseEntity> testCases)  success,required TResult Function( String errorMessage)  failure,}) {final _that = this;
switch (_that) {
case TestPlanInitial():
return initial();case TestPlanLoading():
return loading();case TestPlanSuccess():
return success(_that.testCases);case TestPlanFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<TestCaseEntity> testCases)?  success,TResult? Function( String errorMessage)?  failure,}) {final _that = this;
switch (_that) {
case TestPlanInitial() when initial != null:
return initial();case TestPlanLoading() when loading != null:
return loading();case TestPlanSuccess() when success != null:
return success(_that.testCases);case TestPlanFailure() when failure != null:
return failure(_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class TestPlanInitial implements TestPlanState {
  const TestPlanInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestPlanInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TestPlanState.initial()';
}


}




/// @nodoc


class TestPlanLoading implements TestPlanState {
  const TestPlanLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestPlanLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TestPlanState.loading()';
}


}




/// @nodoc


class TestPlanSuccess implements TestPlanState {
  const TestPlanSuccess({required final  List<TestCaseEntity> testCases}): _testCases = testCases;
  

 final  List<TestCaseEntity> _testCases;
 List<TestCaseEntity> get testCases {
  if (_testCases is EqualUnmodifiableListView) return _testCases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_testCases);
}


/// Create a copy of TestPlanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestPlanSuccessCopyWith<TestPlanSuccess> get copyWith => _$TestPlanSuccessCopyWithImpl<TestPlanSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestPlanSuccess&&const DeepCollectionEquality().equals(other._testCases, _testCases));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_testCases));

@override
String toString() {
  return 'TestPlanState.success(testCases: $testCases)';
}


}

/// @nodoc
abstract mixin class $TestPlanSuccessCopyWith<$Res> implements $TestPlanStateCopyWith<$Res> {
  factory $TestPlanSuccessCopyWith(TestPlanSuccess value, $Res Function(TestPlanSuccess) _then) = _$TestPlanSuccessCopyWithImpl;
@useResult
$Res call({
 List<TestCaseEntity> testCases
});




}
/// @nodoc
class _$TestPlanSuccessCopyWithImpl<$Res>
    implements $TestPlanSuccessCopyWith<$Res> {
  _$TestPlanSuccessCopyWithImpl(this._self, this._then);

  final TestPlanSuccess _self;
  final $Res Function(TestPlanSuccess) _then;

/// Create a copy of TestPlanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? testCases = null,}) {
  return _then(TestPlanSuccess(
testCases: null == testCases ? _self._testCases : testCases // ignore: cast_nullable_to_non_nullable
as List<TestCaseEntity>,
  ));
}


}

/// @nodoc


class TestPlanFailure implements TestPlanState {
  const TestPlanFailure({required this.errorMessage});
  

 final  String errorMessage;

/// Create a copy of TestPlanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestPlanFailureCopyWith<TestPlanFailure> get copyWith => _$TestPlanFailureCopyWithImpl<TestPlanFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestPlanFailure&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'TestPlanState.failure(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $TestPlanFailureCopyWith<$Res> implements $TestPlanStateCopyWith<$Res> {
  factory $TestPlanFailureCopyWith(TestPlanFailure value, $Res Function(TestPlanFailure) _then) = _$TestPlanFailureCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$TestPlanFailureCopyWithImpl<$Res>
    implements $TestPlanFailureCopyWith<$Res> {
  _$TestPlanFailureCopyWithImpl(this._self, this._then);

  final TestPlanFailure _self;
  final $Res Function(TestPlanFailure) _then;

/// Create a copy of TestPlanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(TestPlanFailure(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
