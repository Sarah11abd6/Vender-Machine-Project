import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Controller/navBarController.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input.dart';
import '../../../components/rounded_password_input.dart';
import '../../../providers/auth.dart';
import '../../bottomNavBar.dart';

class RegisterForm extends StatelessWidget {
   GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RegisterForm({
    Key? key,
    required this.animationDuration,
    required this.isLogin,
    required this.size,
    required this.defaultLoginSize,
    required this.formKey
   
  }) : super(key: key);

  final bool? isLogin;
  final Duration? animationDuration;
  final Size? size;
  final double? defaultLoginSize;
  

  @override
  Widget build(BuildContext context) {

    final auth = Provider.of<Auth>(context);

  
    return AnimatedOpacity(
      opacity: isLogin! ? 0.0 : 1.0,
      duration: animationDuration! * 5,
      child: Visibility(
        visible: !isLogin!,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: size!.width,
            height: defaultLoginSize,
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'مرحبا بك',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    SizedBox(height: size!.height * 0.05),
                    Image.asset(
                      'assets/images/register.png',
                      height: size!.height * 0.3,
                    ),
                    SizedBox(height: size!.height * 0.03),
                     RoundedInput(icon: Icons.mail, hint: 'الاسم',
                    validat:(String? value) {
                        if (value!.isEmpty) {
                          return 'يجب ادخال الاسم ';
                        }
                      } ,
                      controller: auth.nameController,
                    ),
                    RoundedInput(
                      validat: (String? value) {
                        if (value!.isEmpty) {
                          return 'يجب ادخال الايميل ';
                        }
                      },
                      controller: auth.emailController1,
                      icon: Icons.face_rounded,
                      hint: 'عنوان البريد الالكتروني',
                    ),
                    RoundedPasswordInput(
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'يجب ادخال كلمة المرور ';
                          }
                        },
                        hint: 'كلمة المرور',
                        controller: auth.passwordController1),
                    const SizedBox(height: 10),
                    auth.isLoading!
                        ? const Center(child: CircularProgressIndicator())
                        : RoundedButton(
                            title: 'انشاء الحساب',
                            onPress: () async {
                              if (formKey.currentState!.validate()) {
                                await auth.signIn(
                                  auth.emailController1.text,
                                  auth.passwordController1.text,
                                );
                              }
                            },
                          ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
