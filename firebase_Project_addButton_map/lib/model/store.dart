import 'dart:ffi';

class Store {
  String name;
  String phone;
  String? image;
  String estimate;
  String lat;
  String lng;

  Store({
    this.image,
    required this.name,
    required this.phone,
    required this.estimate,
    required this.lat,
    required this.lng,
  });
}
