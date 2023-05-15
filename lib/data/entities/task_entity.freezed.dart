// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskEntity _$TaskEntityFromJson(Map<String, dynamic> json) {
  return _TaskEntity.fromJson(json);
}

/// @nodoc
mixin _$TaskEntity {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskEntityCopyWith<TaskEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskEntityCopyWith<$Res> {
  factory $TaskEntityCopyWith(
          TaskEntity value, $Res Function(TaskEntity) then) =
      _$TaskEntityCopyWithImpl<$Res, TaskEntity>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$TaskEntityCopyWithImpl<$Res, $Val extends TaskEntity>
    implements $TaskEntityCopyWith<$Res> {
  _$TaskEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskEntityCopyWith<$Res>
    implements $TaskEntityCopyWith<$Res> {
  factory _$$_TaskEntityCopyWith(
          _$_TaskEntity value, $Res Function(_$_TaskEntity) then) =
      __$$_TaskEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$_TaskEntityCopyWithImpl<$Res>
    extends _$TaskEntityCopyWithImpl<$Res, _$_TaskEntity>
    implements _$$_TaskEntityCopyWith<$Res> {
  __$$_TaskEntityCopyWithImpl(
      _$_TaskEntity _value, $Res Function(_$_TaskEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$_TaskEntity(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskEntity implements _TaskEntity {
  const _$_TaskEntity({required this.name});

  factory _$_TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$$_TaskEntityFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'TaskEntity(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskEntity &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskEntityCopyWith<_$_TaskEntity> get copyWith =>
      __$$_TaskEntityCopyWithImpl<_$_TaskEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskEntityToJson(
      this,
    );
  }
}

abstract class _TaskEntity implements TaskEntity {
  const factory _TaskEntity({required final String name}) = _$_TaskEntity;

  factory _TaskEntity.fromJson(Map<String, dynamic> json) =
      _$_TaskEntity.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_TaskEntityCopyWith<_$_TaskEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
