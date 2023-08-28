import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/app_button.dart';
import '../../common_widgets/app_text.dart';
import '../../components/rounded_input.dart';
import '../product_details/order_failed_dialog.dart';

class CheckoutBottomSheet extends StatefulWidget {
  const CheckoutBottomSheet({super.key});

  @override
  _CheckoutBottomSheetState createState() => _CheckoutBottomSheetState();
}

class _CheckoutBottomSheetState extends State<CheckoutBottomSheet> {
  Widget getDivider() {
    return const Divider(
      thickness: 1,
      color: Color(0xFFE2E2E2),
    );
  }

  Widget termsAndConditionsAgreement(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'من خلال المتابعة فأنت توافق على سياسة',
          style: TextStyle(
            color: const Color(0xFF7C7C7C),
            fontSize: 14,
            fontFamily: Theme.of(context).textTheme.bodyText1!.fontFamily,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
                text: " شروط",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            TextSpan(text: " و"),
            TextSpan(
                text: " الأحكام",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ]),
    );
  }

  Widget checkoutRow(String? label,
      {String? trailingText, Widget? trailingWidget}) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Row(
        children: [
          AppText(
            text: label,
            fontSize: 18,
            color: const Color(0xFF7C7C7C),
            fontWeight: FontWeight.w600,
          ),
          const Spacer(),
          trailingText == null
              ? trailingWidget!
              : AppText(
                  text: trailingText,
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
          // const SizedBox(
          //   width: 20,
          // ),
          // const Icon(
          //   Icons.arrow_forward_ios,
          //   size: 20,
          // )
        ],
      ),
    );
  }

  void onPlaceOrderClicked() {
    Navigator.pop(context);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const OrderFailedDialogue();
        });
  }

  Widget cardInput(
      {TextInputType? keyType,
      String? hintText,
      IconData? icon,
      var controller}) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width / 1.12,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
        ),
        // inputFormatters: [
        //   FilteringTextInputFormatter.digitsOnly,
        //   LengthLimitingTextInputFormatter(16),
        //   CardInputFormatter(),
        // ],
        onChanged: (value) {
          var text = value.replaceAll(RegExp(r'\s+\b|\b\s'), ' ');
          setState(() {
            // cardNumberController.value = cardNumberController.value
            //     .copyWith(
            //         text: text,
            //         selection:
            //             TextSelection.collapsed(offset: text.length),
            //         composing: TextRange.empty);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 30,
      ),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Wrap(
        children: <Widget>[
          Row(
            children: [
              const AppText(
                text: "الدفع",
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 25,
                  ))
            ],
          ),
          const SizedBox(
            height: 45,
          ),
          Form(
              child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              cardInput(
                  keyType: TextInputType.number,
                  hintText: 'رقم البطاقة',
                  icon: Icons.payment),
              const SizedBox(
                height: 20,
              ),
              cardInput(
                  keyType: TextInputType.number,
                  hintText: 'الاسم الرباعي',
                  icon: Icons.person),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.4,
                      child: cardInput(
                          keyType: TextInputType.number,
                          hintText: 'MM/YY',
                          icon: Icons.calendar_today),
                    ),
                    const SizedBox(width: 14),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.4,
                      child: cardInput(
                        keyType: TextInputType.number,
                        hintText: 'CVV',
                        icon: Icons.lock_outline,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
          getDivider(),
          checkoutRow("اجمالي الفاتورة ", trailingText: "\$13.97"),
          getDivider(),
          const SizedBox(
            height: 30,
          ),
          termsAndConditionsAgreement(context),
          Container(
            margin: const EdgeInsets.only(
              top: 20,
            ),
            child: AppButton(
              label: "تأكيد الدفع",
              fontWeight: FontWeight.w600,
              // padding: const EdgeInsets.symmetric(
              //   vertical: 25,
              // ),
              onPressed: () {
                onPlaceOrderClicked();
              },
            ),
          ),
        ],
      ),
    );
  }
}
