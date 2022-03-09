import 'package:flutter/material.dart';
import 'package:ideago/presentation/pages/add_idea_page/add_idea_page.dart';

import '../widgets/add_idea_button.dart';
import '../widgets/build_ideas.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("IdeaGo"),
      ),
      body: Column(
        children: [
          const BuildIdeas(),
          IdeaButton(
            text: 'Add new idea',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddIdeaPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
