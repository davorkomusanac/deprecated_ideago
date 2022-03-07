import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ideago/data/models/question_rating/question_rating.dart';

part 'ratings_state.dart';

class RatingsCubit extends Cubit<RatingsState> {
  RatingsCubit() : super(const RatingsState());

  void updateRating({required QuestionRating rating}) {
    //state.questionRatings.whe
  }
}
