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
      categories: (fields[3] as List).cast<String>(),
      dateTime: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Idea obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.categories)
      ..writeByte(4)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is IdeaAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_Idea _$$_IdeaFromJson(Map<String, dynamic> json) => _$_Idea(
      uid: json['uid'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      categories: (json['categories'] as List<dynamic>).map((e) => e as String).toList(),
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_IdeaToJson(_$_Idea instance) => <String, dynamic>{
      'uid': instance.uid,
      'title': instance.title,
      'description': instance.description,
      'categories': instance.categories,
      'dateTime': instance.dateTime.toIso8601String(),
    };
