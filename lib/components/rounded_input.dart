import 'package:flutter/material.dart';

import '../constants.dart';
import 'input_container.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput(
      {Key? key,
      required this.icon,
      required this.hint,
      this.controller,
      this.validat})
      : super(key: key);

  final IconData? icon;
  final String? hint;
  final TextEditingController? controller;
  final dynamic validat;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextFormField(
      validator: validat,
      controller: controller,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
          icon: Icon(icon, color: kPrimaryColor),
          hintText: hint,
          border: InputBorder.none),
    ));
  }
}
