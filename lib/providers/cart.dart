import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:vender_machine/constants.dart';
import 'package:vender_machine/widgets/snackBar.dart';

class CartItem {
  final String? id;
  final String? productId;
  final String? title;
  int? quantity;
  final double? price;
  final String? imageUrl;

  CartItem(
      {this.id,
      this.title,
      this.productId,
      this.quantity,
      this.price,
      this.imageUrl,});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price! * cartItem.quantity!;
    });
    return total;
  }

  void addItem(
    String productId,
    double price,
    String title,
    String? imageUrl,
  ) {
    if (_items.containsKey(productId)) {
      // change quantity...
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity! + 1,
          imageUrl: imageUrl,
        ),
      );
           snack('تم', 'تم زيادة طلبك بمقدار احد');
      print('MMMMMMMMMMMMMMMMMMMM');
      items.forEach((key, value) {
        print(value.price);
      });
      print('MMMMMMMMMMMMMMMMMMMM');
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
          imageUrl: imageUrl
        ),
      );
      print('MMMMMMMMMMMMMMMMMMMM');
      print(productId);
      print('MMMMMMMMMMMMMMMMMMMM');
      snack('نجاح', ' تم اضافة طلبك بنجااح');

    }


    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    print(productId);
    notifyListeners();
       snack('تم', 'تم حذف الطلب بنجاح');

  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity! > 1) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity! - 1,
                imageUrl: existingCartItem.imageUrl,
              ));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
