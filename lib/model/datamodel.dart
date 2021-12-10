class CarsDataModel {
  Cars? cars;

  CarsDataModel({this.cars});

  CarsDataModel.fromJson(Map<String, dynamic> json) {
    cars = json['cars'] != null ? new Cars.fromJson(json['cars']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cars != null) {
      data['cars'] = this.cars!.toJson();
    }
    return data;
  }
}

class Cars {
  List<Nissan>? nissan;
  List<Ford>? ford;

  Cars({this.nissan, this.ford});

  Cars.fromJson(Map<String, dynamic> json) {
    if (json['Nissan'] != null) {
      nissan = <Nissan>[];
      json['Nissan'].forEach((v) {
        nissan!.add(new Nissan.fromJson(v));
      });
    }
    if (json['Ford'] != null) {
      ford = <Ford>[];
      json['Ford'].forEach((v) {
        ford!.add(new Ford.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nissan != null) {
      data['Nissan'] = this.nissan!.map((v) => v.toJson()).toList();
    }
    if (this.ford != null) {
      data['Ford'] = this.ford!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Nissan {
  String ?model;
  int? doors;

  Nissan({this.model, this.doors});

  Nissan.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    doors = json['doors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this.model;
    data['doors'] = this.doors;
    return data;
  }
}
class Ford {
  String? model;
  int? doors;

  Ford({this.model, this.doors});

  Ford.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    doors = json['doors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this.model;
    data['doors'] = this.doors;
    return data;
  }
}