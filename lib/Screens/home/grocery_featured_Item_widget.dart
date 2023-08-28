import 'package:flutter/material.dart';
import 'package:vender_machine/constants.dart';

import '../../common_widgets/app_text.dart';

class GroceryFeaturedItem {
  final String name;
  final String imagePath;

  GroceryFeaturedItem(this.name, this.imagePath);
}

var groceryFeaturedItems = [
  GroceryFeaturedItem("شوكولاته", "assets/images/chocolates.png"),
  GroceryFeaturedItem("مشروبات", "assets/images/drinks.png"),
];

class GroceryFeaturedCard extends StatelessWidget {
  const GroceryFeaturedCard(this.groceryFeaturedItem,
      {super.key, this.color = kPrimaryColor});

  final GroceryFeaturedItem groceryFeaturedItem;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.5,
      height: 105,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 17),
      decoration: BoxDecoration(
          color: color.withOpacity(0.25),
          borderRadius: BorderRadius.circular(18)),
      child: Row(
        children: [
          Expanded(
            child: Image(
              image: AssetImage(groceryFeaturedItem.imagePath),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          AppText(
            text: groceryFeaturedItem.name,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )
        ],
      ),
    );
  }
}
