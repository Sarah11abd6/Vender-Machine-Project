import 'package:vender_machine/Model/machineProduct.dart';

class MachineModel {
  String? id;
  String? name;
  String? status;
  String? qrCode;
  List<MachineProduct>? productsList;
  MachineModel({
    this.id,
    this.name,
    this.status,
    this.productsList,
    this.qrCode,
  });
  factory MachineModel.fromJson(Map<String, dynamic> json) => MachineModel(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    qrCode: json["qrCode"],
    productsList: List<MachineProduct>.from(json["productsList"].map((x) => MachineProduct.fromJson(x))),
);

 Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "qrCode": qrCode,
    "questions": List<dynamic>.from(productsList!.map((x) => x.toMap())),
};
}

List<MachineModel> machines = [
  MachineModel(
    id: '1',
    name: 'machine 1',
    status: 'active',
    productsList: [
      MachineProduct(
        id: 1,
        name: 'سنيكرز',
        description: 'شوكولاتة فاخرة بمعايير ',
        price: 3,
        imagePath: 'assets/images/snickers.png',
      ),
      MachineProduct(
        id: 2,
        name: 'جلاكسي',
        description: 'شوكولاتة فاخرة بمعايير ',
        price: 2,
        imagePath: 'assets/images/galaxy.png',
      ),
      MachineProduct(
        id: 3,
        name: 'كيندر',
        description: 'شوكولاتة فاخرة بمعايير ',
        price: 4,
        imagePath: 'assets/images/kinder.png',
      ),
      MachineProduct(
        id: 4,
        name: 'كوكا كولا',
        description: 'مشروب غازي فاخر بمعايير ',
        price: 2,
        imagePath: 'assets/images/cocaColaa.png',
      ),
      MachineProduct(
        id: 5,
        name: 'فانتا',
        description: 'مشروب غازي فاخر بمعايير ',
        price: 1,
        imagePath: 'assets/images/fanta.png',
      ),
      MachineProduct(
        id: 5,
        name: 'بيبسي',
        description: 'مشروب غازي فاخر بمعايير عالمية ',
        price: 20,
        imagePath: 'assets/images/pepsi.png',
      ),
      MachineProduct(
        id: 5,
        name: 'سبرايت',
        description: 'مشروب غازي فاخر بمعايير ',
        price: 2,
        imagePath: 'assets/images/sprite.png',
      ),
      MachineProduct(
        id: 5,
        name: 'عصير الربيع',
        description: 'عصير مانجو فاخر  ',
        price: 1,
        imagePath: 'assets/images/al_rabia.png',
      ),
    ],
  ),
  MachineModel(
    id: '2',
    name: 'machine 2',
    status: 'active',
    productsList: [
      MachineProduct(
        id: 1,
        name: '2سنيكرز',
        description: 'شوكولاتة فاخرة بمعايير ',
        price: 20,
        imagePath: 'assets/images/snickers.png',
      ),
      MachineProduct(
        id: 2,
        name: '2سنيكرز',
        description: 'شوكولاتة فاخرة بمعايير ',
        price: 20,
        imagePath: 'assets/images/snickers.png',
      ),
      MachineProduct(
        id: 3,
        name: '2سنيكرز',
        description: 'شوكولاتة فاخرة بمعايير ',
        price: 20,
        imagePath: 'assets/images/snickers.png',
      ),
      MachineProduct(
        id: 4,
        name: '2سنيكرز',
        description: 'شوكولاتة فاخرة بمعايير ',
        price: 20,
        imagePath: 'assets/images/snickers.png',
      ),
      MachineProduct(
        id: 5,
        name: '2سنيكرز',
        description: 'شوكولاتة فاخرة بمعايير ',
        price: 20,
        imagePath: 'assets/images/snickers.png',
      ),
      MachineProduct(
        id: 6,
        name: '2سنيكرز',
        description: 'شوكولاتة فاخرة بمعايير ',
        price: 20,
        imagePath: 'assets/images/snickers.png',
      ),
      MachineProduct(
        id: 7,
        name: '2سنيكرز',
        description: 'شوكولاتة فاخرة بمعايير ',
        price: 20,
        imagePath: 'assets/images/snickers.png',
      ),
      MachineProduct(
        id: 8,
        name: '2سنيكرز',
        description: 'شوكولاتة فاخرة بمعايير ',
        price: 20,
        imagePath: 'assets/images/snickers.png',
      ),
    ],
  ),
  MachineModel(
    id: '3',
    name: 'machine 1',
    status: 'active',
    productsList: [
      MachineProduct(
        id: 1,
        name: 'سنيكرز',
        description: 'شوكولاتة فاخرة بمعايير ',
        price: 20,
        imagePath: 'assets/images/snickers.png',
      ),
      MachineProduct(
        id: 2,
        name: 'سنيكرز',
        description: 'شوكولاتة فاخرة بمعايير ',
        price: 20,
        imagePath: 'assets/images/snickers.png',
      ),
      MachineProduct(
        id: 3,
        name: 'سنيكرز',
        description: 'شوكولاتة فاخرة بمعايير ',
        price: 20,
        imagePath: 'assets/images/snickers.png',
      ),
      MachineProduct(
        id: 4,
        name: 'سنيكرز',
        description: 'شوكولاتة فاخرة بمعايير ',
        price: 20,
        imagePath: 'assets/images/snickers.png',
      ),
      MachineProduct(
        id: 5,
        name: 'سنيكرز',
        description: 'شوكولاتة فاخرة بمعايير ',
        price: 20,
        imagePath: 'assets/images/snickers.png',
      ),
      MachineProduct(
        id: 6,
        name: 'سنيكرز',
        description: 'شوكولاتة فاخرة بمعايير ',
        price: 20,
        imagePath: 'assets/images/snickers.png',
      ),
      MachineProduct(
        id: 7,
        name: 'سنيكرز',
        description: 'شوكولاتة فاخرة بمعايير ',
        price: 20,
        imagePath: 'assets/images/snickers.png',
      ),
      MachineProduct(
        id: 8,
        name: 'سنيكرز',
        description: 'شوكولاتة فاخرة بمعايير ',
        price: 20,
        imagePath: 'assets/images/snickers.png',
      ),
    ],
  ),
];
