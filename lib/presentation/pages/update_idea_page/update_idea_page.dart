import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ideago/presentation/pages/update_idea_page/widgets/delete_idea_button.dart';

import '../../../application/ideas/ideas_cubit.dart';
import '../../../data/models/idea/idea.dart';
import '../../widgets/add_idea_button.dart';
import '../../widgets/idea_text_field.dart';

class UpdateIdeaPage extends StatefulWidget {
  const UpdateIdeaPage({Key? key, required this.idea}) : super(key: key);

  final Idea idea;

  @override
  State<UpdateIdeaPage> createState() => _UpdateIdeaPageState();
}

class _UpdateIdeaPageState extends State<UpdateIdeaPage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.idea.title);
    _descriptionController = TextEditingController(text: widget.idea.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Add idea'),
          actions: [
            DeleteIdeaButton(idea: widget.idea),
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              IdeaTextField(
                controller: _titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Your Idea must have a name';
                  } else {
                    return null;
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                labelText: 'Idea',
                hintText: 'Title of your idea..',
              ),
              IdeaTextField(
                controller: _descriptionController,
                minLines: 10,
                maxLines: 30,
                labelText: 'Description',
                hintText: 'Full description of your idea..',
              ),
              IdeaButton(
                text: 'Update idea',
                onPressed: () {
                  var valid = _formKey.currentState?.validate() ?? false;
                  if (valid) {
                    context.read<IdeasCubit>().updateIdea(
                          oldIdea: widget.idea,
                          title: _titleController.text,
                          description: _descriptionController.text,
                        );
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
