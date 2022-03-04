import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ideago/application/ideas/ideas_cubit.dart';

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
    return TextField(
      controller: _titleController,
      decoration: const InputDecoration(
        labelText: 'Idea',
        hintText: 'Title of your idea..',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          gapPadding: 4,
        ),
      ),
    );
  }

  Widget buildDescriptionTitle() {
    return TextField(
      controller: _descriptionController,
      maxLines: 10,
      decoration: const InputDecoration(
        labelText: 'Description',
        hintText: 'Full description of your idea..',
        floatingLabelBehavior: FloatingLabelBehavior.always,
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
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<IdeasCubit>().createIdea(
                        title: _titleController.text,
                        description: _descriptionController.text,
                      );
                },
                child: const Text("Add Idea"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
