// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'arabic_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArabicModel _$ArabicModelFromJson(Map<String, dynamic> json) {
  return _ArabicModel.fromJson(json);
}

/// @nodoc
mixin _$ArabicModel {
  String get contentId => throw _privateConstructorUsedError;
  String get arabic => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArabicModelCopyWith<ArabicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArabicModelCopyWith<$Res> {
  factory $ArabicModelCopyWith(
          ArabicModel value, $Res Function(ArabicModel) then) =
      _$ArabicModelCopyWithImpl<$Res, ArabicModel>;
  @useResult
  $Res call({String contentId, String arabic, String id});
}

/// @nodoc
class _$ArabicModelCopyWithImpl<$Res, $Val extends ArabicModel>
    implements $ArabicModelCopyWith<$Res> {
  _$ArabicModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? arabic = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String,
      arabic: null == arabic
          ? _value.arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArabicModelImplCopyWith<$Res>
    implements $ArabicModelCopyWith<$Res> {
  factory _$$ArabicModelImplCopyWith(
          _$ArabicModelImpl value, $Res Function(_$ArabicModelImpl) then) =
      __$$ArabicModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String contentId, String arabic, String id});
}

/// @nodoc
class __$$ArabicModelImplCopyWithImpl<$Res>
    extends _$ArabicModelCopyWithImpl<$Res, _$ArabicModelImpl>
    implements _$$ArabicModelImplCopyWith<$Res> {
  __$$ArabicModelImplCopyWithImpl(
      _$ArabicModelImpl _value, $Res Function(_$ArabicModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? arabic = null,
    Object? id = null,
  }) {
    return _then(_$ArabicModelImpl(
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String,
      arabic: null == arabic
          ? _value.arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArabicModelImpl implements _ArabicModel {
  _$ArabicModelImpl(
      {required this.contentId, required this.arabic, required this.id});

  factory _$ArabicModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArabicModelImplFromJson(json);

  @override
  final String contentId;
  @override
  final String arabic;
  @override
  final String id;

  @override
  String toString() {
    return 'ArabicModel(contentId: $contentId, arabic: $arabic, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArabicModelImpl &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.arabic, arabic) || other.arabic == arabic) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contentId, arabic, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArabicModelImplCopyWith<_$ArabicModelImpl> get copyWith =>
      __$$ArabicModelImplCopyWithImpl<_$ArabicModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArabicModelImplToJson(
      this,
    );
  }
}

abstract class _ArabicModel implements ArabicModel {
  factory _ArabicModel(
      {required final String contentId,
      required final String arabic,
      required final String id}) = _$ArabicModelImpl;

  factory _ArabicModel.fromJson(Map<String, dynamic> json) =
      _$ArabicModelImpl.fromJson;

  @override
  String get contentId;
  @override
  String get arabic;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$ArabicModelImplCopyWith<_$ArabicModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
