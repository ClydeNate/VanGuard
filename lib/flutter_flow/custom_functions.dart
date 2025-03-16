import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';

String? getETAETD() {
  Future<Map<String, dynamic>> getETAETD(
      String origin, String destination) async {
    final apiKey = "YOUR_GOOGLE_MAPS_API_KEY";
    final url = Uri.parse(
        "https://maps.googleapis.com/maps/api/distancematrix/json?origins=$origin&destinations=$destination&key=$apiKey");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['rows'][0]['elements'][0]['status'] == "OK") {
        return {
          "duration": data['rows'][0]['elements'][0]['duration']['text'],
          "distance": data['rows'][0]['elements'][0]['distance']['text']
        };
      } else {
        throw Exception("Error fetching ETA/ETD");
      }
    } else {
      throw Exception("Failed to fetch ETA/ETD");
    }
  }
}

String? backgroundLocationTracking() {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services are disabled.");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        throw Exception("Location permissions are permanently denied.");
      }
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
