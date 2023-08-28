import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import 'product_details/machineProducts.dart';

class MachinesScreen extends StatelessWidget {
  const MachinesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ماكينات البيع'),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: ((context, index) {
            return InkWell(
              onTap: () {
                Get.to(() => MachineProductsScreen(productsList: data.machines[index].productsList,));
              },
              child: ListTile(
                title: Text(data.machines[index].name!),
                subtitle: Text(data.machines[index].qrCode!),
                trailing: Text(data.machines[index].status!),
              ),
            );
          }),
          separatorBuilder: ((context, index) =>const SizedBox(
                height: 15,
              )),
          itemCount: data.machines.length),
    );
  }
}
