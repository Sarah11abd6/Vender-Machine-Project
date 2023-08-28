import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vender_machine/Screens/onboarding/screen_one.dart';
import 'package:vender_machine/constants.dart';



import 'bottomNavBar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>  const OnboardingScreenOne(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height:MediaQuery.of(context).size.height ,
      width:MediaQuery.of(context).size.width ,
      color: kPrimaryColor,
      child: Image.asset(
            "assets/images/logo.png",
            height: 100,
            width: 100,
          ),
      // FlutterLogo(size: MediaQuery.of(context).size.height),
    );
  }
}
