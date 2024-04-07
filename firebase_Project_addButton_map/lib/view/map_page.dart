import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:latlong2/latlong.dart' as latlng;

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late Position currentPosition;
  late int kindChoice;
  late double lat;
  late double lng;
  late MapController mapController;
  late bool canRun;
  late String location;

  late List<dynamic> arguments = Get.arguments;
  late List<List<double>> locationData;

  @override
  void initState() {
    super.initState();
    kindChoice = 0;
    mapController = MapController();
    canRun = false;
    location = arguments[0];
    lat = (arguments[1] as double);
    lng = (arguments[2] as double);

    checkLocationPermission();
    locationData = [
      [(arguments[1] as double)],
      [(arguments[2] as double)]
    ];
  }

  checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      getCurrentLocation();
    }
  }

  getCurrentLocation() async {
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((position) {
      currentPosition = position;
      canRun = true;
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('위치 보기'),
      ),
      body: canRun
          ? flutterMap()
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  // widgets
  Widget flutterMap() {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(center: latlng.LatLng(lat, lng), initialZoom: 17.0),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
        ),
        MarkerLayer(
          markers: [
            Marker(
                width: 80,
                height: 80,
                point: latlng.LatLng(lat, lng),
                child: Column(
                  children: [
                    Text(
                      location[kindChoice],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Icon(Icons.pin_drop, size: 50, color: Colors.red),
                  ],
                ))
          ],
        )
      ],
    );
  }
}
