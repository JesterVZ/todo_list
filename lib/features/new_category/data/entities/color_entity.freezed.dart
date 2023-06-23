// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ColorEntity {
  int get id => throw _privateConstructorUsedError;
  String get hex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ColorEntityCopyWith<ColorEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorEntityCopyWith<$Res> {
  factory $ColorEntityCopyWith(
          ColorEntity value, $Res Function(ColorEntity) then) =
      _$ColorEntityCopyWithImpl<$Res, ColorEntity>;
  @useResult
  $Res call({int id, String hex});
}

/// @nodoc
class _$ColorEntityCopyWithImpl<$Res, $Val extends ColorEntity>
    implements $ColorEntityCopyWith<$Res> {
  _$ColorEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hex = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      hex: null == hex
          ? _value.hex
          : hex // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ColorEntityCopyWith<$Res>
    implements $ColorEntityCopyWith<$Res> {
  factory _$$_ColorEntityCopyWith(
          _$_ColorEntity value, $Res Function(_$_ColorEntity) then) =
      __$$_ColorEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String hex});
}

/// @nodoc
class __$$_ColorEntityCopyWithImpl<$Res>
    extends _$ColorEntityCopyWithImpl<$Res, _$_ColorEntity>
    implements _$$_ColorEntityCopyWith<$Res> {
  __$$_ColorEntityCopyWithImpl(
      _$_ColorEntity _value, $Res Function(_$_ColorEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hex = null,
  }) {
    return _then(_$_ColorEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      hex: null == hex
          ? _value.hex
          : hex // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ColorEntity implements _ColorEntity {
  const _$_ColorEntity({required this.id, required this.hex});

  @override
  final int id;
  @override
  final String hex;

  @override
  String toString() {
    return 'ColorEntity(id: $id, hex: $hex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ColorEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hex, hex) || other.hex == hex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, hex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ColorEntityCopyWith<_$_ColorEntity> get copyWith =>
      __$$_ColorEntityCopyWithImpl<_$_ColorEntity>(this, _$identity);
}

abstract class _ColorEntity implements ColorEntity {
  const factory _ColorEntity(
      {required final int id, required final String hex}) = _$_ColorEntity;

  @override
  int get id;
  @override
  String get hex;
  @override
  @JsonKey(ignore: true)
  _$$_ColorEntityCopyWith<_$_ColorEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
