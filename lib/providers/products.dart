import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vender_machine/Model/machineProduct.dart';
// import 'package:vender_machine/Model/machineModel.dart';
// import 'package:vender_machine/Model/machineModel.dart';

// import '../models/http_exception.dart';
import '../Model/model.dart';
import '../Screens/bottomNavBar.dart';
import './product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [];
  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  List<MachineModel> machines = [];
  MachineModel? machine;
  List<MachineProduct> products = [];
  List<MachineProduct> cartList = [];

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }
  MachineHome? machineHome;
  // List<MachineHome> machines = [];
  Future<void> fetchAndSetProducts() async {
    const url =
        'https://vender-machine-3ecd6-default-rtdb.firebaseio.com/machines.json';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        print('no data found');
        return;
      }

      print(' the exctracted data is :${machineHome}');

      extractedData.forEach((prodData) {
        // print(prodData);
        machines.add(MachineModel.fromJson(prodData));
      });

      // machines = extractedData;
      print('MMMMMMMMMMMMMMMMMMMMMM');
      // print(machine!.name);
      print('MMMMMMMMMMMMMMMMMMMMMM');

      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  void currentMachine(String? qrCode) {
    machine = machines.firstWhere((element) => element.qrCode == qrCode);
    notifyListeners();
  }


}
