// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_rating.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionRatingAdapter extends TypeAdapter<_$_QuestionRating> {
  @override
  final int typeId = 2;

  @override
  _$_QuestionRating read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_QuestionRating(
      rating: fields[0] as int,
      questionTitle: fields[1] as String,
      questionDescription: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_QuestionRating obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.rating)
      ..writeByte(1)
      ..write(obj.questionTitle)
      ..writeByte(2)
      ..write(obj.questionDescription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionRatingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionRating _$$_QuestionRatingFromJson(Map<String, dynamic> json) =>
    _$_QuestionRating(
      rating: json['rating'] as int,
      questionTitle: json['questionTitle'] as String,
      questionDescription: json['questionDescription'] as String,
    );

Map<String, dynamic> _$$_QuestionRatingToJson(_$_QuestionRating instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'questionTitle': instance.questionTitle,
      'questionDescription': instance.questionDescription,
    };
