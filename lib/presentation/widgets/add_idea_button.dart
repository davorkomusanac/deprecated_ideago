import 'package:flutter/material.dart';

import '../pages/add_idea_page.dart';

class AddIdea extends StatelessWidget {
  const AddIdea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0, top: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.teal),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddIdeaPage(),
          ),
        ),
        child: const Text("Add new idea"),
      ),
    );
  }
}
