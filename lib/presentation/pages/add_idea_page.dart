import 'package:flutter/material.dart';

class AddIdeaPage extends StatefulWidget {
  const AddIdeaPage({Key? key}) : super(key: key);

  @override
  State<AddIdeaPage> createState() => _AddIdeaPageState();
}

class _AddIdeaPageState extends State<AddIdeaPage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _categoriesController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _categoriesController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _categoriesController.dispose();
    super.dispose();
  }

  Widget buildIdeaTitle() {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Idea',
        hintText: 'Title of your idea..',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          gapPadding: 4,
        ),
      ),
    );
  }

  Widget buildDescriptionTitle() {
    return const TextField(
      maxLines: 10,
      decoration: InputDecoration(
        labelText: 'Description',
        hintText: 'Full description of your idea..',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          gapPadding: 4,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add idea'),
        ),
        body: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: buildIdeaTitle(),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: buildDescriptionTitle(),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: buildDescriptionTitle(),
            ),
          ],
        ),
      ),
    );
  }
}
