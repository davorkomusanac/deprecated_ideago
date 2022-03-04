import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ideago/repository/ideas_repository.dart';
import 'package:uuid/uuid.dart';

import '../../data/models/idea/idea.dart';

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
    required String title,
    required String description,
  }) {
    try {
      //TODO Implement Idea construction as it should be
      var idea = Idea(
        uid: const Uuid().v4(),
        title: title,
        description: description,
        categories: <String>[],
        dateTime: DateTime.now(),
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
}

//TODO Try out if putting loading animation while search makes sense, if it is too fast, just go straight to success.
