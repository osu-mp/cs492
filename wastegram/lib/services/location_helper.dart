import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';

class LocationHelper {
  var locationService = Location();

  Future<LocationData> retrieveLocation() async {
    LocationData locationData;
    try {
      var _serviceEnabled = await locationService.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await locationService.requestService();
        if (!_serviceEnabled) {
          throw ErrorDescription('Failed to enable service..');
        }
      }

      var _permissionGranted = await locationService.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await locationService.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          throw ErrorDescription('Location service permission not granted.');
        }
      }

      locationData = await locationService.getLocation();
    } on PlatformException catch (e) {
      throw ErrorDescription('Error: ${e.toString()}, code: ${e.code}');
    }
    locationData = await locationService.getLocation();

    return locationData;
  }
}