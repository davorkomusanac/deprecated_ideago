import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';

part 'idea.freezed.dart';
part 'idea.g.dart';

@freezed
class Idea with _$Idea {
  @HiveType(typeId: 1)
  factory Idea({
    @HiveField(0) required String uid,
    @HiveField(1) required String title,
    @HiveField(2) required String description,
    @HiveField(3) required List<String> categories,
    @HiveField(4) required DateTime dateTime,
  }) = _Idea;

  factory Idea.fromJson(Map<String, dynamic> json) => _$IdeaFromJson(json);
}
//TODO Extend Idea model (add categories, additional properties, etc)
//TODO Implement with Hive or some other data storage
//TODO add Index as a field

///
///
/// 1. Be able to Add Ideas
/// 2. Be able to Update Ideas
/// 3. Be able to Read Ideas
/// 4. Be able to Delete Ideas
///
/// 5. Be able to search for ideas
///
