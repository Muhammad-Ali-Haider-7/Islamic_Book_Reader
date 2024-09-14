// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fontSize_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FontSizeModel _$FontSizeModelFromJson(Map<String, dynamic> json) {
  return _FontSizeModel.fromJson(json);
}

/// @nodoc
mixin _$FontSizeModel {
  int get heading => throw _privateConstructorUsedError;
  int get content => throw _privateConstructorUsedError;
  int get arabic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FontSizeModelCopyWith<FontSizeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FontSizeModelCopyWith<$Res> {
  factory $FontSizeModelCopyWith(
          FontSizeModel value, $Res Function(FontSizeModel) then) =
      _$FontSizeModelCopyWithImpl<$Res, FontSizeModel>;
  @useResult
  $Res call({int heading, int content, int arabic});
}

/// @nodoc
class _$FontSizeModelCopyWithImpl<$Res, $Val extends FontSizeModel>
    implements $FontSizeModelCopyWith<$Res> {
  _$FontSizeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? heading = null,
    Object? content = null,
    Object? arabic = null,
  }) {
    return _then(_value.copyWith(
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as int,
      arabic: null == arabic
          ? _value.arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FontSizeModelImplCopyWith<$Res>
    implements $FontSizeModelCopyWith<$Res> {
  factory _$$FontSizeModelImplCopyWith(
          _$FontSizeModelImpl value, $Res Function(_$FontSizeModelImpl) then) =
      __$$FontSizeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int heading, int content, int arabic});
}

/// @nodoc
class __$$FontSizeModelImplCopyWithImpl<$Res>
    extends _$FontSizeModelCopyWithImpl<$Res, _$FontSizeModelImpl>
    implements _$$FontSizeModelImplCopyWith<$Res> {
  __$$FontSizeModelImplCopyWithImpl(
      _$FontSizeModelImpl _value, $Res Function(_$FontSizeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? heading = null,
    Object? content = null,
    Object? arabic = null,
  }) {
    return _then(_$FontSizeModelImpl(
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as int,
      arabic: null == arabic
          ? _value.arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FontSizeModelImpl implements _FontSizeModel {
  _$FontSizeModelImpl(
      {required this.heading, required this.content, required this.arabic});

  factory _$FontSizeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FontSizeModelImplFromJson(json);

  @override
  final int heading;
  @override
  final int content;
  @override
  final int arabic;

  @override
  String toString() {
    return 'FontSizeModel(heading: $heading, content: $content, arabic: $arabic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FontSizeModelImpl &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.arabic, arabic) || other.arabic == arabic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, heading, content, arabic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FontSizeModelImplCopyWith<_$FontSizeModelImpl> get copyWith =>
      __$$FontSizeModelImplCopyWithImpl<_$FontSizeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FontSizeModelImplToJson(
      this,
    );
  }
}

abstract class _FontSizeModel implements FontSizeModel {
  factory _FontSizeModel(
      {required final int heading,
      required final int content,
      required final int arabic}) = _$FontSizeModelImpl;

  factory _FontSizeModel.fromJson(Map<String, dynamic> json) =
      _$FontSizeModelImpl.fromJson;

  @override
  int get heading;
  @override
  int get content;
  @override
  int get arabic;
  @override
  @JsonKey(ignore: true)
  _$$FontSizeModelImplCopyWith<_$FontSizeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
