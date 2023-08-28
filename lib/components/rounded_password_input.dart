import 'package:flutter/material.dart';

import '../constants.dart';
import 'input_container.dart';

class RoundedPasswordInput extends StatelessWidget {
  RoundedPasswordInput({Key? key, required this.hint, this.controller,this.validate})
      : super(key: key);

  final String? hint;
  TextEditingController? controller;
  final dynamic validate;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextFormField(
        validator: validate,
        controller: controller,
        cursorColor: kPrimaryColor,
        obscureText: true,
        decoration: InputDecoration(
            icon: const Icon(Icons.lock, color: kPrimaryColor),
            hintText: hint,
            border: InputBorder.none),
      ),
    );
  }
}
