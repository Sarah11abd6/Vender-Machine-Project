import 'package:flutter/material.dart';
import 'package:vender_machine/Model/machineProduct.dart';

class MachineProductsScreen extends StatelessWidget {
  List<MachineProduct>? productsList ;
  MachineProductsScreen({super.key, this.productsList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المنتجات')),
      body: ListView.separated(
          itemBuilder: ((context, index) => ListTile(
            title: Text(productsList![index].name!),
            subtitle: Text(productsList![index].description!),
          )),
          separatorBuilder: ((context, index) => const SizedBox(
                height: 15,
              )),
          itemCount: productsList!.length),
    );
  }
}
