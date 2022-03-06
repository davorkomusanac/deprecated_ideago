import 'package:hive_flutter/hive_flutter.dart';

import '../constants.dart';
import '../data/models/idea/idea.dart';

class IdeasRepository {
  final ideaBox = Hive.box<Idea>(kBoxName);

  List<Idea> getAllIdeas() {
    List<Idea> ideas = [];
    var values = ideaBox.values;
    for (Idea idea in values) {
      ideas.add(idea);
    }
    return ideas;
  }

  void addIdea(Idea idea) {
    ideaBox.put(idea.uid, idea);
  }

  void removeIdea(Idea idea) {
    ideaBox.delete(idea.uid);
  }

  //Hive doesn't have update, but you just put a new write over old data
  void updateIdea(Idea idea) {
    ideaBox.put(idea.uid, idea);
  }
}
