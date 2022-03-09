import 'package:flutter/material.dart';

class IdeaTextField extends StatelessWidget {
  const IdeaTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.validator,
    this.autovalidateMode,
    this.minLines,
    this.maxLines,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final int? minLines;
  final int? maxLines;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        autovalidateMode: autovalidateMode,
        minLines: minLines,
        maxLines: maxLines,
        cursorColor: Colors.teal,
        autocorrect: false,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
