import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vender_machine/Model/machineProduct.dart';

import '../../common_widgets/app_button.dart';
import '../../providers/cart.dart';
import '../../widgets/chart_item_widget.dart';
import 'checkout_bottom_sheet.dart';
import 'column_with_seprator.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: true);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                // cart.itemCount.toString(),
                "طلباتي",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: size.height * 0.65,
                child: ListView.separated(
                  itemBuilder: ((context, index) => ChartItemWidget(
                        // item: cart.items.values.toList()[index],
                        id: cart.items.values.toList()[index].id,
                        productId: cart.items.keys.toList()[index],
                        price: cart.items.values.toList()[index].price,
                        title: cart.items.values.toList()[index].title,
                        imageUrl: cart.items.values.toList()[index].imageUrl,
                        quantity: cart.items.values.toList()[index].quantity,
                      )),
                  separatorBuilder: ((context, index) => const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: Divider(
                          thickness: 1,
                        ),
                      )),
                  itemCount: cart.itemCount,
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              getCheckoutButton(context, cart.totalAmount)
            ],
          ),
        ),
      ),
    );
  }

  Widget getCheckoutButton(BuildContext context, double totalAmmount) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: AppButton(
        label: "تأكيد الطلب",
        fontWeight: FontWeight.w600,
        padding: const EdgeInsets.symmetric(vertical: 20),
        trailingWidget: getButtonPriceWidget(totalAmmount),
        onPressed: () {
          showBottomSheet(context);
        },
      ),
    );
  }

  Widget getButtonPriceWidget(double totalAmmount) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: const Color(0xff489E67),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        // "\$12.96",
        '\$${totalAmmount}',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return const CheckoutBottomSheet();
        });
  }
}
