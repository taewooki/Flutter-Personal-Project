import 'dart:typed_data';

class Store {
  int? id; // Primary Key
  String name;
  String phone;
  String estimate;
  String lat;
  String lng;
  Uint8List image;

  Store(
      {this.id,
      required this.name,
      required this.phone,
      required this.estimate,
      required this.lat,
      required this.lng,
      required this.image});

  Store.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        name = res['name'],
        phone = res['phone'],
        estimate = res['estimate'],
        lat = res['lat'],
        lng = res['lng'],
        image = res['image'];
}
