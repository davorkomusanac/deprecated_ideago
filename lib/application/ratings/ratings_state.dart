part of 'ratings_cubit.dart';

enum RatingsStatus { initial, success, error }

class RatingsState extends Equatable {
  const RatingsState({
    this.status = RatingsStatus.initial,
    this.questionRatings = const <QuestionRating>[],
  });

  final RatingsStatus status;
  final List<QuestionRating> questionRatings;

  RatingsState copyWith({
    RatingsStatus? status,
    List<QuestionRating>? questionRatings,
  }) =>
      RatingsState(
        status: status ?? this.status,
        questionRatings: questionRatings ?? this.questionRatings,
      );

  @override
  List<Object> get props => [status, questionRatings];
}
