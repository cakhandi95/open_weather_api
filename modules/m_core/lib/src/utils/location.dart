import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

///
/// Created by Handy on 11/08/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class Location {

  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}