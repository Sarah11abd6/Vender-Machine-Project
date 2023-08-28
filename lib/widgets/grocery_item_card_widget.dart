import 'package:flutter/material.dart';
import 'package:vender_machine/Model/machineProduct.dart';
import 'package:vender_machine/constants.dart';

import '../common_widgets/app_text.dart';

class GroceryItemCardWidget extends StatelessWidget {
  const GroceryItemCardWidget({Key? key, this.item, this.heroSuffix})
      : super(key: key);
  final MachineProduct? item;
  final String? heroSuffix;

  final double width = 174;
  final double height = 250;
  final Color borderColor = const Color(0xffE2E2E2);
  final double borderRadius = 18;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Hero(
                  tag: "GroceryItem:${item!.imagePath!}-${heroSuffix ?? ""}",
                  // child: Container(),
                  child: imageWidget(item!.imagePath),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AppText(
              text: item!.name,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            AppText(
              text: item!.description,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF7C7C7C),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                AppText(
                  text: "\$${item!.price!.toStringAsFixed(2)}",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                addWidget()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget imageWidget(String? imageUrl) {
    return Container(
      child: imageUrl == null
          ? 
          const CircularProgressIndicator()
          // :Image.asset(imageUrl)
          : Image.network(imageUrl),
    );
  }

  Widget addWidget() {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          // color: const Color(0xff53B175),
          color: kPrimaryColor),
      child: const Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}
