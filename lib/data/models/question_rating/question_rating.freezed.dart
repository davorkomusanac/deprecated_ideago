// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'question_rating.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionRating _$QuestionRatingFromJson(Map<String, dynamic> json) {
  return _QuestionRating.fromJson(json);
}

/// @nodoc
class _$QuestionRatingTearOff {
  const _$QuestionRatingTearOff();

  _QuestionRating call(
      {@HiveField(0) required int rating,
      @HiveField(1) required String questionTitle,
      @HiveField(2) required String questionDescription}) {
    return _QuestionRating(
      rating: rating,
      questionTitle: questionTitle,
      questionDescription: questionDescription,
    );
  }

  QuestionRating fromJson(Map<String, Object?> json) {
    return QuestionRating.fromJson(json);
  }
}

/// @nodoc
const $QuestionRating = _$QuestionRatingTearOff();

/// @nodoc
mixin _$QuestionRating {
  @HiveField(0)
  int get rating => throw _privateConstructorUsedError;
  @HiveField(1)
  String get questionTitle => throw _privateConstructorUsedError;
  @HiveField(2)
  String get questionDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionRatingCopyWith<QuestionRating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionRatingCopyWith<$Res> {
  factory $QuestionRatingCopyWith(
          QuestionRating value, $Res Function(QuestionRating) then) =
      _$QuestionRatingCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int rating,
      @HiveField(1) String questionTitle,
      @HiveField(2) String questionDescription});
}

/// @nodoc
class _$QuestionRatingCopyWithImpl<$Res>
    implements $QuestionRatingCopyWith<$Res> {
  _$QuestionRatingCopyWithImpl(this._value, this._then);

  final QuestionRating _value;
  // ignore: unused_field
  final $Res Function(QuestionRating) _then;

  @override
  $Res call({
    Object? rating = freezed,
    Object? questionTitle = freezed,
    Object? questionDescription = freezed,
  }) {
    return _then(_value.copyWith(
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      questionTitle: questionTitle == freezed
          ? _value.questionTitle
          : questionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      questionDescription: questionDescription == freezed
          ? _value.questionDescription
          : questionDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$QuestionRatingCopyWith<$Res>
    implements $QuestionRatingCopyWith<$Res> {
  factory _$QuestionRatingCopyWith(
          _QuestionRating value, $Res Function(_QuestionRating) then) =
      __$QuestionRatingCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int rating,
      @HiveField(1) String questionTitle,
      @HiveField(2) String questionDescription});
}

/// @nodoc
class __$QuestionRatingCopyWithImpl<$Res>
    extends _$QuestionRatingCopyWithImpl<$Res>
    implements _$QuestionRatingCopyWith<$Res> {
  __$QuestionRatingCopyWithImpl(
      _QuestionRating _value, $Res Function(_QuestionRating) _then)
      : super(_value, (v) => _then(v as _QuestionRating));

  @override
  _QuestionRating get _value => super._value as _QuestionRating;

  @override
  $Res call({
    Object? rating = freezed,
    Object? questionTitle = freezed,
    Object? questionDescription = freezed,
  }) {
    return _then(_QuestionRating(
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      questionTitle: questionTitle == freezed
          ? _value.questionTitle
          : questionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      questionDescription: questionDescription == freezed
          ? _value.questionDescription
          : questionDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 2)
class _$_QuestionRating implements _QuestionRating {
  _$_QuestionRating(
      {@HiveField(0) required this.rating,
      @HiveField(1) required this.questionTitle,
      @HiveField(2) required this.questionDescription});

  factory _$_QuestionRating.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionRatingFromJson(json);

  @override
  @HiveField(0)
  final int rating;
  @override
  @HiveField(1)
  final String questionTitle;
  @override
  @HiveField(2)
  final String questionDescription;

  @override
  String toString() {
    return 'QuestionRating(rating: $rating, questionTitle: $questionTitle, questionDescription: $questionDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuestionRating &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality()
                .equals(other.questionTitle, questionTitle) &&
            const DeepCollectionEquality()
                .equals(other.questionDescription, questionDescription));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(questionTitle),
      const DeepCollectionEquality().hash(questionDescription));

  @JsonKey(ignore: true)
  @override
  _$QuestionRatingCopyWith<_QuestionRating> get copyWith =>
      __$QuestionRatingCopyWithImpl<_QuestionRating>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionRatingToJson(this);
  }
}

abstract class _QuestionRating implements QuestionRating {
  factory _QuestionRating(
      {@HiveField(0) required int rating,
      @HiveField(1) required String questionTitle,
      @HiveField(2) required String questionDescription}) = _$_QuestionRating;

  factory _QuestionRating.fromJson(Map<String, dynamic> json) =
      _$_QuestionRating.fromJson;

  @override
  @HiveField(0)
  int get rating;
  @override
  @HiveField(1)
  String get questionTitle;
  @override
  @HiveField(2)
  String get questionDescription;
  @override
  @JsonKey(ignore: true)
  _$QuestionRatingCopyWith<_QuestionRating> get copyWith =>
      throw _privateConstructorUsedError;
}
