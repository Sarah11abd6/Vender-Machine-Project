import 'package:flutter/material.dart';
import 'package:vender_machine/constants.dart';

import '../../common_widgets/app_text.dart';

class HomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 115,
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
              image: AssetImage(
                "assets/images/banner_background.png",
              ),
              fit: BoxFit.cover)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Image.asset(
              "assets/images/banar.png",
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              AppText(
                text: "تخفيضات وعروض مجانية",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              AppText(
                text: "احصل على خصم يصل الى 40%",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: kPrimaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
