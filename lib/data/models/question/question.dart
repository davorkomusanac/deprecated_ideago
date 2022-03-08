import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  @HiveType(typeId: 2)
  factory Question({
    @HiveField(0) required int rating,
    @HiveField(1) required String title,
    @HiveField(2) required String description,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
}
