import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';
import 'package:provider/provider.dart';
// import 'package:vender_machine/Model/machineModel.dart';
import 'package:vender_machine/Model/machineProduct.dart';
import 'package:vender_machine/constants.dart';
import 'package:vender_machine/providers/auth.dart';

import '../../Model/model.dart';
import '../../providers/product.dart';
import '../../providers/products.dart';
import '../../widgets/grocery_item_card_widget.dart';
import '../../widgets/search_bar_widget.dart';
import '../product_details/product_details_screen.dart';
import 'grocery_featured_Item_widget.dart';
import 'home_banner_widget.dart';

class HomeScreen extends StatelessWidget {
  // HomeScreen({super.key, this.products});
  // String? barcodeMachine;
  // List<MachineProduct>? products;

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Products>(context);
    // data.fetchAndSetProducts();
    // MachineModel? machine;
    // final auth = Provider.of<Auth>(context);

    // if (barcodeMachine != null) {
    // machine = data.machines.firstWhereOrNull((element)=>
    //    element.name == 'machine 2'
    // );
    // }
    Size size = MediaQuery.of(context).size;
    var height = SizedBox(
      height: size.height * 0.015,
    );

    return Scaffold(
      body: 
      data.machine != null
          ?
           SafeArea(
              child: Container(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        height,
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        // Image.asset("assets/images/login.png"),

                        padded(locationWidget()),
                        Center(child: Text(data.machine!.name!)),
                        height,

                        padded(const SearchBarWidget()),
                        height,

                        padded(HomeBanner()), height,

                        padded(
                          const Text(
                            "الأصناف",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
                          ),
                        ),

                        height,
                        Container(
                          height: 105,
                          child: ListView(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              GroceryFeaturedCard(
                                groceryFeaturedItems[0],
                                color: const Color(0xffF8A44C),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              GroceryFeaturedCard(
                                groceryFeaturedItems[1],
                                color: kPrimaryColor,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        data.machines.length != null
                            ?
                             getHorizontalItemSlider(
                                data.machine!.productsList!)
                               
                            : 
                            CircularProgressIndicator(),

                        // getHorizontalItemSlider(products),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const Center(
              child: Text(
                  'لا يوجد منتجات لعرضها .. امسح باركود الماكينة لعرض المنتجان'),
            ),
    );
  }

  Widget padded(Widget widget) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: widget,
    );
  }

  Widget getHorizontalItemSlider(
    List<MachineProduct> items,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 250,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: items.length,
        // itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => ProductDetailsScreen(
                    groceryItem: items[index],
                  ));
            },
            child: GroceryItemCardWidget(
              item: items[index],
              heroSuffix: '$index +hero',
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 20,
          );
        },
      ),
    );
  }

  Widget locationWidget() {
    String locationIconPath = "assets/images/location_icon.svg";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          locationIconPath,
        ),
        const SizedBox(
          width: 8,
        ),
        const Text(
          "المملكة العربية السعودية-أبها",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
