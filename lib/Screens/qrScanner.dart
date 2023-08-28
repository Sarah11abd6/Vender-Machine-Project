import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:vender_machine/Screens/bottomNavBar.dart';
import 'package:vender_machine/widgets/snackBar.dart';

import '../providers/products.dart';


class QRScrean extends StatelessWidget {
  QRScrean({super.key});

  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Products>(context);
    return Scaffold(
        body: Stack(children: [
      MobileScanner(
          allowDuplicates: false,
          controller: cameraController,
          onDetect: (barcode, args) {
            if (barcode.rawValue == null) {
              debugPrint('Failed to scan Barcode');
            } else if (barcode.rawValue!.contains(RegExp('Machine'), 0)) {
              final String code = barcode.rawValue!;
              debugPrint('Barcode found! $code');
              data.currentMachine(code);
              Get.offAll(() => ButtomNavBar());
            } else {
              cameraController.dispose();
              snack('خطأ', 'لم يتم التعرف على الماكينة');

              Get.offAll(ButtomNavBar());

              //  ()=> data.showPopUp();
            }
          }),
      Column(
        children: [
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: (context, state, child) {
                switch (state as TorchState) {
                  case TorchState.off:
                    return const Icon(Icons.flash_off, color: Colors.grey);
                  case TorchState.on:
                    return const Icon(Icons.flash_on, color: Colors.yellow);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.cameraFacingState,
              builder: (context, state, child) {
                switch (state as CameraFacing) {
                  case CameraFacing.front:
                    return const Icon(Icons.camera_alt);
                  case CameraFacing.back:
                    return const Icon(Icons.cameraswitch_rounded);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
    ]));
  }
}
