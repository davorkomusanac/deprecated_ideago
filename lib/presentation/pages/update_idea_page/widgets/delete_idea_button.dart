import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ideago/application/ideas/ideas_cubit.dart';
import 'package:ideago/data/models/idea/idea.dart';

class DeleteIdeaButton extends StatelessWidget {
  const DeleteIdeaButton({
    Key? key,
    required this.idea,
  }) : super(key: key);

  final Idea idea;

  void iosDialog(BuildContext context) {
    showCupertinoDialog<void>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Confirm deleting this idea'),
        content: const Text('Note: This action cannot be undone'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: const Text('No'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: const Text('Yes'),
            isDestructiveAction: true,
            onPressed: () {
              context.read<IdeasCubit>().deleteIdea(idea);
              Navigator.pop(context);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  void androidDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm deleting this idea'),
        content: const Text('Note: This action cannot be undone'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              context.read<IdeasCubit>().deleteIdea(idea);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () => Platform.isIOS ? iosDialog(context) : androidDialog(context),
    );
  }
}
