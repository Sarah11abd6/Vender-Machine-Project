import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/slanding_clipper.dart';
import 'screen_three.dart';

class OnboardingScreenTwo extends StatelessWidget {
  const OnboardingScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RotatedBox(
                quarterTurns: 2,
                child: ClipPath(
                  clipper: SlandingClipper(),
                  child: Container(
                    height: size.height * 0.4,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              Image.asset(
                'assets/images/register.png',
                height: size.height * 0.4,
              ),
              SizedBox(
                height: size.height * 0.2,
              )
            ],
          ),
          Positioned(
            top: size.height * 0.05,
            child: Container(
              width: size.width,
              padding: const EdgeInsets.all(appPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'سهولة الوصول إلى الماكينة',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: white,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    'انتقل من خلال آلات البيع باستخدام جهازك ببساطة عن طريق مسح رمز الباركود الخاص  بماكينة البيع',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: appPadding / 4),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    border: Border.all(color: black, width: 2),
                    shape: BoxShape.circle,
                    color: white,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: appPadding / 4),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      border: Border.all(color: black, width: 2),
                      shape: BoxShape.circle,
                      color: kPrimaryColor),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: appPadding / 4),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    border: Border.all(color: black, width: 2),
                    shape: BoxShape.circle,
                    color: white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: appPadding * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => print('Skip'),
                    child: const Text(
                      'تخطي',
                      style: TextStyle(
                        color: black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: appPadding),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const OnboardingScreenThree(),
                        ),
                      );
                    },
                    backgroundColor: white,
                    child: const Icon(
                      Icons.navigate_before_outlined,
                      color: black,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
