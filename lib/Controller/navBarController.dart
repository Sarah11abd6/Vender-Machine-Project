import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:vender_machine/Screens/cart/cart_screen.dart';

import '../Screens/home/home_screen.dart';
import '../Screens/machinesScreen.dart';
import '../Screens/profileScreen.dart';

import '../Screens/qrScanner.dart';
import '../constants.dart';

class BottomBarController with ChangeNotifier {
  BuildContext? context;
  String? qrCode;
  PersistentTabController controller = PersistentTabController(initialIndex: 0);
  // BottomBarController(this.context);
  List<Widget> buildScreens() {
    return [
      HomeScreen(),
      const MachinesScreen(),
       QRScrean(),
      const CartScreen(),
      const ProfileScrean(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        textStyle: textStyle.copyWith(),
        icon: const Icon(CupertinoIcons.home),
        title: ("الرئيسية"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        textStyle: textStyle,
        icon: const Icon(Icons.clean_hands_outlined),
        title: ("الماكينات"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
          textStyle: textStyle,
          icon: const Icon(
            Icons.qr_code_scanner_rounded,
            color: white,
          ),
          title: (" "),
          activeColorPrimary: kPrimaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
          onPressed: ((_) =>Get.to(QRScrean())))
          // //   Navigator.push(
          // //     context!,
          // //     MaterialPageRoute<void>(
          // //       builder: (BuildContext context) => const QRScreen(),
          // //     ),
          // //   );
          // // })),
         ,
      PersistentBottomNavBarItem(
        textStyle: textStyle,
        icon: const Icon(Icons.local_grocery_store_outlined),
        title: ("الطلبات"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        textStyle: textStyle,
        icon: const Icon(Icons.account_circle_outlined),
        title: ("حسابي"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

/////////////////////////////////////////////////////////////////
  var currentIndex = 0;

  void changeBottomNavBar(index) {
    currentIndex = index;
    notifyListeners();
  }

  // showBottomSheetFunction(BuildContext context) {}
}
