import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ideago/repository/ideas_repository.dart';

import '../../constants.dart';
import '../../data/models/idea/idea.dart';
import '../../data/models/question/question.dart';

part 'ideas_state.dart';

class IdeasCubit extends Cubit<IdeasState> {
  IdeasCubit(this._repository) : super(const IdeasState());

  final IdeasRepository _repository;

  void getAllIdeas() {
    try {
      final ideas = _repository.getAllIdeas();

      emit(state.copyWith(
        status: IdeasStatus.success,
        ideas: ideas,
        errorMessage: '',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: IdeasStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  void addIdea({
    required String uid,
    required String title,
    required String description,
  }) {
    try {
      //TODO Implement Idea construction as it should be
      var idea = Idea(
        uid: uid,
        title: title,
        description: description,
        categories: <String>[],
        dateTime: DateTime.now(),
        questionRatings: initialQuestionRatings,
        ideaRating: 50,
      );

      _repository.addIdea(idea);
      var updatedIdeas = [...state.ideas, idea];

      emit(state.copyWith(
        status: IdeasStatus.success,
        ideas: updatedIdeas,
        errorMessage: '',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: IdeasStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  void deleteIdea(Idea idea) {
    try {
      _repository.removeIdea(idea);
      var updatedIdeas = [...state.ideas];
      updatedIdeas.removeWhere((element) => idea.uid == element.uid);

      emit(state.copyWith(
        status: IdeasStatus.success,
        ideas: updatedIdeas,
        errorMessage: '',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: IdeasStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  void rateIdeaQuestion({
    required String ideaUid,
    required List<Question> questions,
  }) {
    //Calculate total idea Rating
    var ideaRating = questions.fold<int>(0, (prev, next) => prev + next.rating);

    var idea = state.ideas.firstWhere((element) => element.uid == ideaUid);

    //Create a new updated Idea instance with the new rating
    var ratedIdea = Idea(
      uid: idea.uid,
      title: idea.title,
      description: idea.description,
      categories: idea.categories,
      dateTime: idea.dateTime,
      questionRatings: questions,
      ideaRating: ideaRating,
    );

    //Copy the list of ideas, so that we are not directly mutating the state
    var ideas = state.ideas.map((e) => e.uid == ratedIdea.uid ? ratedIdea : e).toList();

    emit(state.copyWith(
      status: IdeasStatus.success,
      ideas: ideas,
      errorMessage: '',
    ));
  }
}
