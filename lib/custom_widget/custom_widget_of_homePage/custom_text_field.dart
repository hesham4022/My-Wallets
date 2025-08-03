import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final int maxlines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChange;
  final TextEditingController? controller;
  const CustomTextField(
      {super.key,
      this.hint,
      this.maxlines = 1,
      this.onSaved,
      this.onChange,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChange,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is required";
        } else {
          return null;
        }
      },
      maxLines: maxlines,
      cursorColor: Colors.amber,
      decoration: InputDecoration(
        hintText: hint,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.amber,
        )),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
