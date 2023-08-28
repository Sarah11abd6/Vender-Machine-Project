import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vender_machine/Model/machineProduct.dart';
import 'package:vender_machine/providers/cart.dart';

import '../../common_widgets/app_button.dart';
import '../../common_widgets/app_text.dart';
import '../../widgets/item_counter_widget.dart';
import 'favourite_toggle_icon_widget.dart';

// class ProductDetailsScreen extends StatefulWidget {
//   final MachineProduct? groceryItem;
//   final String? heroSuffix;

//   const ProductDetailsScreen(this.groceryItem, {super.key, this.heroSuffix});

//   @override
//   _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
// }

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({this.groceryItem});
  MachineProduct? groceryItem;
  String? heroSuffix;

  int? amount = 1;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            getImageHeaderWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                height: size.height * 0.65,
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        groceryItem!.name!,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      subtitle: AppText(
                        text: groceryItem!.description,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff7C7C7C),
                      ),
                      trailing: const FavoriteToggleIcon(),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        AppText(
                          text: 'سعر الوحدة ',
                          fontWeight: FontWeight.bold,
                        ),
                        // ItemCounterWidget(
                        //   onAmountChanged: (newAmount) {
                        //     // setState(() {
                        //     //   amount = newAmount;
                        //     // });
                        //   },
                        // ),
                        const Spacer(),
                        Text(
                          "\$${getTotalPrice().toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    const Divider(thickness: 1),
                    getProductDataRowWidget("مواصفات الصنف"),
                    const Divider(thickness: 1),
                    getProductDataRowWidget("العناصر الغذائية",
                        customWidget: nutritionWidget()),
                    const Divider(thickness: 1),
                    getProductDataRowWidget(
                      "التقييمات",
                      customWidget: ratingWidget(),
                    ),
                    const Spacer(),
                    AppButton(
                      label: "اضافة الى لطلبات",
                      onPressed: () => cart.addItem(
                        groceryItem!.id.toString(),
                        groceryItem!.price!.toDouble(),
                        groceryItem!.name!,
                        groceryItem!.imagePath!,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getImageHeaderWidget() {
    return Container(
      height: 250,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        gradient: LinearGradient(
            colors: [
              const Color(0xFF3366FF).withOpacity(0.1),
              const Color(0xFF3366FF).withOpacity(0.09),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Hero(
        tag: "GroceryItem:${groceryItem!.name}-${heroSuffix ?? ""}",
        child: Image(
          image: NetworkImage(groceryItem!.imagePath!),
          // image: AssetImage(groceryItem!.imagePath!),
        ),
      ),
    );
  }

  Widget getProductDataRowWidget(String label, {Widget? customWidget}) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Row(
        children: [
          AppText(text: label, fontWeight: FontWeight.w600, fontSize: 16),
          const Spacer(),
          if (customWidget != null) ...[
            customWidget,
            const SizedBox(
              width: 20,
            )
          ],
          const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          )
        ],
      ),
    );
  }

  Widget nutritionWidget() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xffEBEBEB),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const AppText(
        text: "100gm",
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Color(0xff7C7C7C),
      ),
    );
  }

  Widget ratingWidget() {
    Widget starIcon() {
      return const Icon(
        Icons.star,
        color: Color(0xffF3603F),
        size: 20,
      );
    }

    return Row(
      children: [
        starIcon(),
        starIcon(),
        starIcon(),
        starIcon(),
        starIcon(),
      ],
    );
  }

  int getTotalPrice() {
    return amount! * groceryItem!.price!;
  }
}
