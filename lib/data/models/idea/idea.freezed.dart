// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'idea.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Idea _$IdeaFromJson(Map<String, dynamic> json) {
  return _Idea.fromJson(json);
}

/// @nodoc
class _$IdeaTearOff {
  const _$IdeaTearOff();

  _Idea call(
      {@HiveField(0) required String uid,
      @HiveField(1) required String title,
      @HiveField(2) required String description,
      @HiveField(4) required DateTime dateTime,
      @HiveField(5) required List<Question> questionRatings,
      @HiveField(6) required int ideaRating}) {
    return _Idea(
      uid: uid,
      title: title,
      description: description,
      dateTime: dateTime,
      questionRatings: questionRatings,
      ideaRating: ideaRating,
    );
  }

  Idea fromJson(Map<String, Object?> json) {
    return Idea.fromJson(json);
  }
}

/// @nodoc
const $Idea = _$IdeaTearOff();

/// @nodoc
mixin _$Idea {
  @HiveField(0)
  String get uid => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  String get description => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime get dateTime => throw _privateConstructorUsedError;
  @HiveField(5)
  List<Question> get questionRatings => throw _privateConstructorUsedError;
  @HiveField(6)
  int get ideaRating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdeaCopyWith<Idea> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdeaCopyWith<$Res> {
  factory $IdeaCopyWith(Idea value, $Res Function(Idea) then) =
      _$IdeaCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String uid,
      @HiveField(1) String title,
      @HiveField(2) String description,
      @HiveField(4) DateTime dateTime,
      @HiveField(5) List<Question> questionRatings,
      @HiveField(6) int ideaRating});
}

/// @nodoc
class _$IdeaCopyWithImpl<$Res> implements $IdeaCopyWith<$Res> {
  _$IdeaCopyWithImpl(this._value, this._then);

  final Idea _value;
  // ignore: unused_field
  final $Res Function(Idea) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? dateTime = freezed,
    Object? questionRatings = freezed,
    Object? ideaRating = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      questionRatings: questionRatings == freezed
          ? _value.questionRatings
          : questionRatings // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      ideaRating: ideaRating == freezed
          ? _value.ideaRating
          : ideaRating // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$IdeaCopyWith<$Res> implements $IdeaCopyWith<$Res> {
  factory _$IdeaCopyWith(_Idea value, $Res Function(_Idea) then) =
      __$IdeaCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String uid,
      @HiveField(1) String title,
      @HiveField(2) String description,
      @HiveField(4) DateTime dateTime,
      @HiveField(5) List<Question> questionRatings,
      @HiveField(6) int ideaRating});
}

/// @nodoc
class __$IdeaCopyWithImpl<$Res> extends _$IdeaCopyWithImpl<$Res>
    implements _$IdeaCopyWith<$Res> {
  __$IdeaCopyWithImpl(_Idea _value, $Res Function(_Idea) _then)
      : super(_value, (v) => _then(v as _Idea));

  @override
  _Idea get _value => super._value as _Idea;

  @override
  $Res call({
    Object? uid = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? dateTime = freezed,
    Object? questionRatings = freezed,
    Object? ideaRating = freezed,
  }) {
    return _then(_Idea(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      questionRatings: questionRatings == freezed
          ? _value.questionRatings
          : questionRatings // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      ideaRating: ideaRating == freezed
          ? _value.ideaRating
          : ideaRating // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1)
class _$_Idea with DiagnosticableTreeMixin implements _Idea {
  _$_Idea(
      {@HiveField(0) required this.uid,
      @HiveField(1) required this.title,
      @HiveField(2) required this.description,
      @HiveField(4) required this.dateTime,
      @HiveField(5) required this.questionRatings,
      @HiveField(6) required this.ideaRating});

  factory _$_Idea.fromJson(Map<String, dynamic> json) => _$$_IdeaFromJson(json);

  @override
  @HiveField(0)
  final String uid;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final String description;
  @override
  @HiveField(4)
  final DateTime dateTime;
  @override
  @HiveField(5)
  final List<Question> questionRatings;
  @override
  @HiveField(6)
  final int ideaRating;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Idea(uid: $uid, title: $title, description: $description, dateTime: $dateTime, questionRatings: $questionRatings, ideaRating: $ideaRating)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Idea'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('dateTime', dateTime))
      ..add(DiagnosticsProperty('questionRatings', questionRatings))
      ..add(DiagnosticsProperty('ideaRating', ideaRating));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Idea &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality()
                .equals(other.questionRatings, questionRatings) &&
            const DeepCollectionEquality()
                .equals(other.ideaRating, ideaRating));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(questionRatings),
      const DeepCollectionEquality().hash(ideaRating));

  @JsonKey(ignore: true)
  @override
  _$IdeaCopyWith<_Idea> get copyWith =>
      __$IdeaCopyWithImpl<_Idea>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IdeaToJson(this);
  }
}

abstract class _Idea implements Idea {
  factory _Idea(
      {@HiveField(0) required String uid,
      @HiveField(1) required String title,
      @HiveField(2) required String description,
      @HiveField(4) required DateTime dateTime,
      @HiveField(5) required List<Question> questionRatings,
      @HiveField(6) required int ideaRating}) = _$_Idea;

  factory _Idea.fromJson(Map<String, dynamic> json) = _$_Idea.fromJson;

  @override
  @HiveField(0)
  String get uid;
  @override
  @HiveField(1)
  String get title;
  @override
  @HiveField(2)
  String get description;
  @override
  @HiveField(4)
  DateTime get dateTime;
  @override
  @HiveField(5)
  List<Question> get questionRatings;
  @override
  @HiveField(6)
  int get ideaRating;
  @override
  @JsonKey(ignore: true)
  _$IdeaCopyWith<_Idea> get copyWith => throw _privateConstructorUsedError;
}
