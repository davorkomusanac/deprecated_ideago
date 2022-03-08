import 'package:flutter/material.dart';

class AddIdeaButton extends StatelessWidget {
  const AddIdeaButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 32.0, top: 8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.teal),
            onPressed: onPressed,
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
