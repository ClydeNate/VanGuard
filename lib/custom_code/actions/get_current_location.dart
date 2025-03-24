// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

/// "Gets the current GPS location and returns latitude, longitude, altitude,
/// speed, and accuracy."
// "Gets the current GPS location and returns latitude, longitude, altitude, speed, and accuracy."
import 'package:geolocator/geolocator.dart';

Future<String> getCurrentLocation() async {
  // Check if location services are enabled
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  // Check for location permission
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied.');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // Get the current position
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  // Create a string with the location details
  String locationDetails =
      'Latitude: ${position.latitude}, Longitude: ${position.longitude}, '
      'Altitude: ${position.altitude}, Speed: ${position.speed}, '
      'Accuracy: ${position.accuracy}';

  return locationDetails;
}
