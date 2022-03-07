import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ideago/data/models/question_rating/question_rating.dart';

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
    @HiveField(5) required List<QuestionRating> questionRatings,
    //TODO int sumOfRatings?
    //TODO List<String> categories?
    //TODO int index
    //TODO List<int> ideaRatings
  }) = _Idea;

  factory Idea.fromJson(Map<String, dynamic> json) => _$IdeaFromJson(json);
}
