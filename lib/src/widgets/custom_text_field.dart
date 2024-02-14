import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? labeltext;
  final Widget? prefix;
  final TextEditingController? controller;
  final void Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  const CustomTextField({
    Key? key,
    this.labeltext,
    this.prefix,
    this.controller,
    this.onSubmitted,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: labeltext,
        prefix: prefix,
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            width: 2,
          ),
        ),
      ),
      style: const TextStyle(
        fontSize: 28,
      ),
      onSubmitted: onSubmitted,
    );
  }
}
