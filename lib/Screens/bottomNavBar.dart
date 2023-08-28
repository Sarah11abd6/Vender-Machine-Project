import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../../Controller/navBarController.dart';

class ButtomNavBar extends StatelessWidget {
  // ButtomNavBar({super.key, this.qrCode});
  // String? qrCode;

  // const ButtomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  tabBarController = Provider.of<BottomBarController>(context);
    // tabBarController.qrCode = qrCode;
    return PersistentTabView(
      context,
      onItemSelected: ((index) => tabBarController.changeBottomNavBar(index)),
      padding: const NavBarPadding.all(5),
      controller: tabBarController.controller,
      screens: tabBarController.buildScreens(),
      items: tabBarController.navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.grey[200]!, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,
      navBarHeight: 60,
      // Choose the nav bar style with this property.
    );
  }
}
