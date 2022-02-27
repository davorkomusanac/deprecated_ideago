import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ideago/constants.dart';
import '../models/idea/idea.dart';

class StorageService extends ChangeNotifier {
  final List<Idea> _ideas = [];
  final ideaBox = Hive.box<List<Idea>>(kBoxName);

  UnmodifiableListView get ideas => UnmodifiableListView(_ideas);

  void getAllIdeas() {
    var boxIdeas = ideaBox.get(kBoxMainKey, defaultValue: []);
    for (var idea in boxIdeas!) {
      _ideas.add(idea);
    }
    notifyListeners();
  }

  Idea getSingleIdea(Idea idea) {
    return _ideas.firstWhere((element) => element.uid == idea.uid);
  }

  List<Idea> filterIdeas(String searchTerm) {
    return _ideas
        .where(
          (idea) => idea.title.contains(searchTerm) || idea.description.contains(searchTerm),
        )
        .toList();
  }

  void addIdea(Idea idea) {
    _ideas.add(idea);
    ideaBox.put(kBoxMainKey, _ideas);
    notifyListeners();
  }

  void removeIdea(Idea idea) {
    _ideas.removeWhere((element) => element.uid == idea.uid);
    //Instead of calling delete inside box, just replace the List<Idea> with the deleted item
    ideaBox.put(kBoxMainKey, _ideas);
    notifyListeners();
  }

  //Hive doesn't have update, but you just put a new write over old data
  void updateIdea(Idea idea) {
    var index = _ideas.indexWhere((element) => element.uid == idea.uid);
    _ideas[index] = idea;
    ideaBox.put(kBoxMainKey, _ideas);
    notifyListeners();
  }

  //TODO Read ideas from storage, update them, and delete them, and search for them

}
