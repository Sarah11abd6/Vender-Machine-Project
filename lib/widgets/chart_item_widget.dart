import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vender_machine/Model/machineProduct.dart';
import 'package:vender_machine/providers/cart.dart';

import '../common_widgets/app_text.dart';
import 'item_counter_widget.dart';

class ChartItemWidget extends StatelessWidget {
  ChartItemWidget(
      // this.item,
      {
    Key? key,
    this.id,
    this.productId,
    this.title,
    this.price,
    this.imageUrl,
    this.quantity,
  }) : super(key: key);
  // final CartItem? item;
  // final MachineProduct? item;
  final String? id;
  final String? productId;
  final String? title;
  int? quantity;
  final double? price;
  final String? imageUrl;

  final double height = 110;

  final Color borderColor = const Color(0xffE2E2E2);

  final double borderRadius = 18;

  int amount = 1;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: true);

    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            imageWidget(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: title,
                  // text: widget.item!.title!,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 5,
                ),
                // AppText(
                //     text: widget.item!.description,
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     color:  const Color(0xff7C7C7C)),
                const SizedBox(
                  height: 12,
                ),
                const Spacer(),

                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Provider.of<Cart>(context, listen: false)
                            .removeSingleItem(productId!);
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(
                            color: const Color(0xffE2E2E2),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.remove,
                            color: quantity! <= 0
                                ? const Color(0xff7C7C7C)
                                : Colors.black,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 18),
                    Container(
                        width: 30,
                        child: Center(
                          child: Text(
                            quantity.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        )),
                    const SizedBox(width: 18),
                    GestureDetector(
                      onTap: () {
                        Provider.of<Cart>(context, listen: false).addItem(
                          productId!,
                          price!,
                          title!,
                          imageUrl,
                        );
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(
                            color: const Color(0xffE2E2E2),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: (() {
                    Provider.of<Cart>(context, listen: false)
                        .removeItem(productId!);
                  }),
                  child: const Icon(
                    Icons.close,
                    color: Color(0xff7C7C7C),
                    size: 25,
                  ),
                ),
                const Spacer(
                  flex: 5,
                ),
                Container(
                  width: 70,
                  child: AppText(
                    text: "\$${price! * quantity!}",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.right,
                  ),
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget imageWidget() {
    return Container(
      width: 100,
      child: Image.network(imageUrl!),
      // child: Image.asset(imageUrl!),
    );
  }

  double getPrice() {
    return price! * amount;
  }
}
