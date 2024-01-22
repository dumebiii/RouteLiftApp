class Checkoutt {
  String? deliveryAddress;
  String? deliveryTime;
  DriverInfo? driverInfo;

  Checkoutt({this.deliveryAddress, this.deliveryTime, this.driverInfo});

  Checkoutt.fromJson(Map<String, dynamic> json) {
    deliveryAddress = json['deliveryAddress'];
    deliveryTime = json['deliveryTime'];
    driverInfo = json['driverInfo'] != null
        ? DriverInfo.fromJson(json['driverInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deliveryAddress'] = deliveryAddress;
    data['deliveryTime'] = deliveryTime;
    if (driverInfo != null) {
      data['driverInfo'] = driverInfo!.toJson();
    }
    return data;
  }
}

class DriverInfo {
  String? name;
  String? number;

  DriverInfo({this.name, this.number});

  DriverInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['number'] = number;
    return data;
  }
}
