// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'idea.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IdeaAdapter extends TypeAdapter<_$_Idea> {
  @override
  final int typeId = 1;

  @override
  _$_Idea read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Idea(
      uid: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      dateTime: fields[4] as DateTime,
      questionRatings: (fields[5] as List).cast<Question>(),
      ideaRating: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Idea obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.dateTime)
      ..writeByte(5)
      ..write(obj.questionRatings)
      ..writeByte(6)
      ..write(obj.ideaRating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IdeaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Idea _$$_IdeaFromJson(Map<String, dynamic> json) => _$_Idea(
      uid: json['uid'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      questionRatings: (json['questionRatings'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      ideaRating: json['ideaRating'] as int,
    );

Map<String, dynamic> _$$_IdeaToJson(_$_Idea instance) => <String, dynamic>{
      'uid': instance.uid,
      'title': instance.title,
      'description': instance.description,
      'dateTime': instance.dateTime.toIso8601String(),
      'questionRatings': instance.questionRatings,
      'ideaRating': instance.ideaRating,
    };
