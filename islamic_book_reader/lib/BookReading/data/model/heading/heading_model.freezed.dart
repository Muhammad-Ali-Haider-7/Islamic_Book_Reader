// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'heading_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HeadingModel _$HeadingModelFromJson(Map<String, dynamic> json) {
  return _HeadingModel.fromJson(json);
}

/// @nodoc
mixin _$HeadingModel {
  String get id => throw _privateConstructorUsedError;
  String get heading => throw _privateConstructorUsedError;
  String get bookId => throw _privateConstructorUsedError;
  int get headingIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeadingModelCopyWith<HeadingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeadingModelCopyWith<$Res> {
  factory $HeadingModelCopyWith(
          HeadingModel value, $Res Function(HeadingModel) then) =
      _$HeadingModelCopyWithImpl<$Res, HeadingModel>;
  @useResult
  $Res call({String id, String heading, String bookId, int headingIndex});
}

/// @nodoc
class _$HeadingModelCopyWithImpl<$Res, $Val extends HeadingModel>
    implements $HeadingModelCopyWith<$Res> {
  _$HeadingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? heading = null,
    Object? bookId = null,
    Object? headingIndex = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String,
      headingIndex: null == headingIndex
          ? _value.headingIndex
          : headingIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HeadingModelImplCopyWith<$Res>
    implements $HeadingModelCopyWith<$Res> {
  factory _$$HeadingModelImplCopyWith(
          _$HeadingModelImpl value, $Res Function(_$HeadingModelImpl) then) =
      __$$HeadingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String heading, String bookId, int headingIndex});
}

/// @nodoc
class __$$HeadingModelImplCopyWithImpl<$Res>
    extends _$HeadingModelCopyWithImpl<$Res, _$HeadingModelImpl>
    implements _$$HeadingModelImplCopyWith<$Res> {
  __$$HeadingModelImplCopyWithImpl(
      _$HeadingModelImpl _value, $Res Function(_$HeadingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? heading = null,
    Object? bookId = null,
    Object? headingIndex = null,
  }) {
    return _then(_$HeadingModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String,
      headingIndex: null == headingIndex
          ? _value.headingIndex
          : headingIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HeadingModelImpl implements _HeadingModel {
  _$HeadingModelImpl(
      {required this.id,
      required this.heading,
      required this.bookId,
      required this.headingIndex});

  factory _$HeadingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HeadingModelImplFromJson(json);

  @override
  final String id;
  @override
  final String heading;
  @override
  final String bookId;
  @override
  final int headingIndex;

  @override
  String toString() {
    return 'HeadingModel(id: $id, heading: $heading, bookId: $bookId, headingIndex: $headingIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeadingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.headingIndex, headingIndex) ||
                other.headingIndex == headingIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, heading, bookId, headingIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HeadingModelImplCopyWith<_$HeadingModelImpl> get copyWith =>
      __$$HeadingModelImplCopyWithImpl<_$HeadingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HeadingModelImplToJson(
      this,
    );
  }
}

abstract class _HeadingModel implements HeadingModel {
  factory _HeadingModel(
      {required final String id,
      required final String heading,
      required final String bookId,
      required final int headingIndex}) = _$HeadingModelImpl;

  factory _HeadingModel.fromJson(Map<String, dynamic> json) =
      _$HeadingModelImpl.fromJson;

  @override
  String get id;
  @override
  String get heading;
  @override
  String get bookId;
  @override
  int get headingIndex;
  @override
  @JsonKey(ignore: true)
  _$$HeadingModelImplCopyWith<_$HeadingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
