import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';

part 'question_rating.freezed.dart';
part 'question_rating.g.dart';

@freezed
class QuestionRating with _$QuestionRating {
  @HiveType(typeId: 2)
  factory QuestionRating({
    @HiveField(0) required int rating,
    @HiveField(1) required String questionTitle,
    @HiveField(2) required String questionDescription,
  }) = _QuestionRating;

  factory QuestionRating.fromJson(Map<String, dynamic> json) => _$QuestionRatingFromJson(json);
}
