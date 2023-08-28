import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../components/rounded_button.dart';
import '../../../components/rounded_input.dart';
import '../../../components/rounded_password_input.dart';
import '../../../providers/auth.dart';

class LoginForm extends StatelessWidget {
  GlobalKey<FormState> fKey = GlobalKey<FormState>();
  LoginForm({
    Key? key,
    @required this.isLogin,
    @required this.animationDuration,
    @required this.size,
    @required this.defaultLoginSize,
    required this.fKey,
  }) : super(key: key);

  final bool? isLogin;
  final Duration? animationDuration;
  final Size? size;
  final double? defaultLoginSize;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return AnimatedOpacity(
      opacity: isLogin! ? 1.0 : 0.0,
      duration: animationDuration! * 4,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: size!.width,
          height: defaultLoginSize,
          child: Form(
            key: fKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'مرحبا بعودتك',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(height: size!.height * 0.08),
                  Image.asset(
                    'assets/images/login.png',
                    height: size!.height * 0.3,
                  ),
                  SizedBox(height: size!.height * 0.05),
                  RoundedInput(
                    icon: Icons.mail,
                    hint: 'البريد الالكتروني',
                    controller: auth.emailController,
                    validat: (String? value) {
                      if (value!.isEmpty) {
                        return 'يجب ادخال البريد الايميل';
                      }
                    },
                  ),
                  RoundedPasswordInput(
                    hint: 'كلمة المرور',
                    controller: auth.passwordController,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'يجب ادخال كلمة المرور';
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  auth.isLoading!
                      ? const Center(child: CircularProgressIndicator())
                      : RoundedButton(
                          title: 'تسجيل الدخول',
                          onPress: () async {
                            if (fKey.currentState!.validate()) {
                              await auth.login(
                                auth.emailController.text,
                                auth.passwordController.text,
                              );
                            }
                          }),
                  const SizedBox(height: 10),

                  SizedBox(
                    height: size!.height * 0.1 / 3,
                    child: InkWell(
                      onTap: ()async {
                      await auth.signInWithGoogle();
                    },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('تسجيل الدخول باستخدام جوجل'),
                          // Image.asset('assets/images/pulses.png'),
                          SvgPicture.asset('assets/images/googl.svg')
                        ],
                      ),
                    ),
                  )
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     await auth.signInWithGoogle();
                  //   },
                  //   child: const Icon(Icons.login),
                  //   // child: Image.asset('assets/images/google.png'),

                  // )
                  // SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
