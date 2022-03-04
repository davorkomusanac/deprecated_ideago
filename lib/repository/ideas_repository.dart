import 'package:hive_flutter/hive_flutter.dart';
import 'package:ideago/constants.dart';

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

  //TODO
  // Idea getSingleIdea(Idea idea) {
  //   return _ideas.firstWhere((element) => element.uid == idea.uid);
  // }
  //
  // List<Idea> filterIdeas(String searchTerm) {
  //   return _ideas
  //       .where(
  //         (idea) => idea.title.contains(searchTerm) || idea.description.contains(searchTerm),
  //       )
  //       .toList();
  // }

  void addIdea(Idea idea) {
    ideaBox.put(idea.uid, idea);
  }

  void removeIdea(Idea idea) {
    ideaBox.delete(idea.uid);
  }

  //Hive doesn't have update, but you just put a new write over old data
  void updateIdea(Idea idea) {
    // var index = _ideas.indexWhere((element) => element.uid == idea.uid);
    // _ideas[index] = idea;
    ideaBox.put(idea.uid, idea);
  }

  //TODO Read ideas from storage, update them, and delete them, and search for them

}
