import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../constants.dart';

SnackbarController snack(
  String? message,
  String? messageText,
) {
  return Get.showSnackbar(
    
    GetSnackBar(
      
      message: message,
      messageText: Text(
      messageText!,
        style: TextStyle(color: white),
      ),
      backgroundColor: kPrimaryColor,
      overlayColor: kBackgroundColor,
      borderColor: kPrimaryColor,
      duration: Duration(seconds: 2),
      
    ),
  );
}
