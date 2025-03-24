// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> startNewRecording(
  bool isTracking,
  bool isPaused,
  String? currentSessionID,
  String routePoints,
  DateTime startTime, // Separated start and end times
  DateTime endTime,
) async {
  // Check if tracking is currently active
  if (isTracking) {
    // Stop the existing tracking session
    await stopTracking(currentSessionID, endTime);
  }

  // Handle the paused state
  if (isPaused) {
    // Resume tracking if it was paused
    await resumeTracking(currentSessionID);
  } else {
    // Start a new recording session
    await startTracking(routePoints, startTime, endTime);
  }
}
