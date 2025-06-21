// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginObject implements DiagnosticableTreeMixin {
  String get userName;
  String get password;

  /// Create a copy of LoginObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      _$LoginObjectCopyWithImpl<LoginObject>(this as LoginObject, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'LoginObject'))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginObject &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, password);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginObject(userName: $userName, password: $password)';
  }
}

/// @nodoc
abstract mixin class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) _then) =
      _$LoginObjectCopyWithImpl;
  @useResult
  $Res call({String userName, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res> implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._self, this._then);

  final LoginObject _self;
  final $Res Function(LoginObject) _then;

  /// Create a copy of LoginObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(_self.copyWith(
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _LoginObject with DiagnosticableTreeMixin implements LoginObject {
  _LoginObject(this.userName, this.password);

  @override
  final String userName;
  @override
  final String password;

  /// Create a copy of LoginObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginObjectCopyWith<_LoginObject> get copyWith =>
      __$LoginObjectCopyWithImpl<_LoginObject>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'LoginObject'))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginObject &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, password);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginObject(userName: $userName, password: $password)';
  }
}

/// @nodoc
abstract mixin class _$LoginObjectCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$LoginObjectCopyWith(
          _LoginObject value, $Res Function(_LoginObject) _then) =
      __$LoginObjectCopyWithImpl;
  @override
  @useResult
  $Res call({String userName, String password});
}

/// @nodoc
class __$LoginObjectCopyWithImpl<$Res> implements _$LoginObjectCopyWith<$Res> {
  __$LoginObjectCopyWithImpl(this._self, this._then);

  final _LoginObject _self;
  final $Res Function(_LoginObject) _then;

  /// Create a copy of LoginObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(_LoginObject(
      null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
