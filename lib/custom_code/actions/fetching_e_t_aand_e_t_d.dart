// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions

import 'dart:convert';
import 'package:http/http.dart' as http;

Future fetchingETAandETD() async {
  final String apiKey = "YOUR_API_KEY_HERE";
  final String origin = "New York, NY";
  final String destination = "Los Angeles, CA";

  final String url =
      "https://maps.googleapis.com/maps/api/distancematrix/json?origins=$origin&destinations=$destination&key=$apiKey";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    final String eta = data["rows"][0]["elements"][0]["duration"]["text"];
    final String etd = data["rows"][0]["elements"][0]["distance"]["text"];

    print("ETA: $eta");
    print("ETD: $etd");

    return {"ETA": eta, "ETD": etd};
  } else {
    throw Exception("Failed to fetch data");
  }
}
