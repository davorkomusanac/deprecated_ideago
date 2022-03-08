import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ideago/application/ideas/ideas_cubit.dart';
import 'package:ideago/constants.dart';
import 'package:ideago/presentation/pages/rate_idea_page/rate_idea_page.dart';
import 'package:ideago/presentation/widgets/add_idea_button.dart';
import 'package:uuid/uuid.dart';

import '../../application/ratings/ratings_cubit.dart';

class AddIdeaPage extends StatefulWidget {
  const AddIdeaPage({Key? key}) : super(key: key);

  @override
  State<AddIdeaPage> createState() => _AddIdeaPageState();
}

class _AddIdeaPageState extends State<AddIdeaPage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _categoriesController;
  final _formKey = GlobalKey<FormState>();

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

  Widget buildIdeaTitleTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: TextFormField(
        controller: _titleController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Your Idea must have a name';
          } else {
            return null;
          }
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: Colors.teal,
        autocorrect: false,
        decoration: const InputDecoration(
          labelText: 'Idea',
          hintText: 'Title of your idea..',
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }

  Widget buildIdeaDescriptionTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: TextField(
        controller: _descriptionController,
        minLines: 10,
        maxLines: 30,
        cursorColor: Colors.teal,
        autocorrect: false,
        decoration: const InputDecoration(
          labelText: 'Description',
          hintText: 'Full description of your idea..',
          floatingLabelBehavior: FloatingLabelBehavior.always,
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
          backgroundColor: Colors.teal,
          title: const Text('Add idea'),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              buildIdeaTitleTextField(),
              buildIdeaDescriptionTextField(),
              AddIdeaButton(
                text: 'Add idea',
                onPressed: () {
                  var valid = _formKey.currentState?.validate() ?? false;
                  if (valid) {
                    //generating uid here since it is also needed for RateIdeaPage
                    var uid = const Uuid().v4();
                    context.read<IdeasCubit>().addIdea(
                          uid: uid,
                          title: _titleController.text,
                          description: _descriptionController.text,
                        );
                    context.read<RatingsCubit>().getRatings(questions: initialQuestionRatings);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RateIdeaPage(ideaUid: uid),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
