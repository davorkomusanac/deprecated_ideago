import 'package:hive_flutter/hive_flutter.dart';
import 'package:ideago/constants.dart';
import '../data/models/idea/idea.dart';

class IdeasRepository {
  final ideaBox = Hive.box<List<Idea>>(kBoxName);

  List<Idea> getAllIdeas() {
    List<Idea> ideas = [];
    List<Idea>? boxIdeas = ideaBox.get(kBoxMainKey, defaultValue: []);
    for (Idea idea in boxIdeas!) {
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

  //Hive box stores the whole list in one key, so the whole new updated lit needs to be put as a value for a new write
  void addIdea(List<Idea> ideas) {
    ideaBox.put(kBoxMainKey, ideas);
  }

  void removeIdea(List<Idea> ideas) {
    //Instead of calling delete inside box, just replace the List<Idea> with the deleted item
    ideaBox.put(kBoxMainKey, ideas);
  }

  //Hive doesn't have update, but you just put a new write over old data
  void updateIdea(List<Idea> ideas) {
    // var index = _ideas.indexWhere((element) => element.uid == idea.uid);
    // _ideas[index] = idea;
    // removeWhere
    ideaBox.put(kBoxMainKey, ideas);
  }

  //TODO Read ideas from storage, update them, and delete them, and search for them

}
