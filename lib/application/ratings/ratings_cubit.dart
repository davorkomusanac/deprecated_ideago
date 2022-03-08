import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ideago/data/models/question/question.dart';

part 'ratings_state.dart';

class RatingsCubit extends Cubit<RatingsState> {
  RatingsCubit() : super(const RatingsState());

  void getRatings({required List<Question> questions}) {
    emit(state.copyWith(
      status: RatingsStatus.success,
      questions: questions,
    ));
  }

  void updateRating({
    required int index,
    required int rating,
    required String questionTitle,
    required String questionDescription,
  }) {
    //deep copy the question ratings list and then update the specific rating
    var updatedRatings = state.questions.map((e) => e).toList();
    updatedRatings[index] = Question(
      rating: rating,
      title: questionTitle,
      description: questionDescription,
    );

    emit(state.copyWith(
      status: RatingsStatus.success,
      questions: updatedRatings,
    ));
  }
}
