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

      //Sort by index asc
      ideas.sort((prev, next) => prev.index.compareTo(next.index));

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
      var idea = Idea(
        uid: uid,
        title: title,
        description: description,
        dateTime: DateTime.now(),
        questionRatings: initialQuestionRatings,
        ideaRating: 50,
        index: state.ideas.length,
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

  void updateIdea({
    required Idea oldIdea,
    required String title,
    required String description,
  }) {
    try {
      //Create a new updated instance
      var idea = Idea(
        uid: oldIdea.uid,
        title: title,
        description: description,
        dateTime: oldIdea.dateTime,
        questionRatings: oldIdea.questionRatings,
        ideaRating: oldIdea.ideaRating,
        index: oldIdea.index,
      );

      //Update the Idea first in local storage
      _repository.updateIdea(idea);

      //Copy the list of ideas, so that we are not directly mutating the state
      var ideas = state.ideas.map((e) => e.uid == idea.uid ? idea : e).toList();

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
      dateTime: idea.dateTime,
      questionRatings: questions,
      ideaRating: ideaRating,
      index: idea.index,
    );

    //Update the Idea in local storage
    _repository.updateIdea(ratedIdea);

    //Copy the list of ideas, so that we are not directly mutating the state
    var ideas = state.ideas.map((e) => e.uid == ratedIdea.uid ? ratedIdea : e).toList();

    emit(state.copyWith(
      status: IdeasStatus.success,
      ideas: ideas,
      errorMessage: '',
    ));
  }

  void reorderIdeas({required int oldIndex, required int newIndex}) {
    //Check if newIndex bigger than old index, if so, reduce it by 1 for correct placing in list.
    var localNewIndex = newIndex > oldIndex ? newIndex - 1 : newIndex;
    var oldIdeas = [...state.ideas];

    var idea = oldIdeas.removeAt(oldIndex);
    oldIdeas.insert(localNewIndex, idea);

    //Not mutating state directly, so we have to populate an empty list with new Idea instances
    var newIdeas = <Idea>[];
    for (int i = 0; i < oldIdeas.length; i++) {
      var newIdea = Idea(
          uid: oldIdeas[i].uid,
          title: oldIdeas[i].title,
          description: oldIdeas[i].description,
          dateTime: oldIdeas[i].dateTime,
          questionRatings: oldIdeas[i].questionRatings,
          ideaRating: oldIdeas[i].ideaRating,
          index: i);
      newIdeas.add(newIdea);
      _repository.updateIdea(newIdea);
    }

    emit(state.copyWith(
      status: IdeasStatus.success,
      ideas: newIdeas,
      errorMessage: '',
    ));
  }
}
