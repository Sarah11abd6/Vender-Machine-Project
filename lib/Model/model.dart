import 'machineProduct.dart';

class MachineHome {
  List<MachineModel>? machines;
  MachineHome(this.machines);
  MachineHome.fromjson(Map<String, dynamic> json) {
    if (json['machines'] != null) {
      machines = <MachineModel>[];
      json['machines'].forEach((v) {
        machines!.add(MachineModel.fromJson(v));
      });
    }
  }
}

class MachineModel {
  // String? id;
  String? name;
  String? status;
  String? qrCode;
  List<MachineProduct>? productsList = [];

  MachineModel.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    name = json['name'];
    status = json['status'];
    qrCode = json['qrCode'];

    if (json['products'] != null) {
      productsList = <MachineProduct>[];
      json['products'].forEach((v) {
        productsList!.add(MachineProduct.fromJson(v));
      });
    }
  }
}
