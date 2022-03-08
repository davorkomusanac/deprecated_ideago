part of 'ratings_cubit.dart';

enum RatingsStatus { initial, success, error }

class RatingsState extends Equatable {
  const RatingsState({
    this.status = RatingsStatus.initial,
    this.questions = const <Question>[],
  });

  final RatingsStatus status;
  final List<Question> questions;

  RatingsState copyWith({
    RatingsStatus? status,
    List<Question>? questions,
  }) =>
      RatingsState(
        status: status ?? this.status,
        questions: questions ?? this.questions,
      );

  @override
  List<Object> get props => [status, questions];
}
