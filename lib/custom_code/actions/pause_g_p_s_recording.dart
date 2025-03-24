// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> pauseGPSRecording(
  bool? isTracking,
  bool? isPaused,
  String? currentSessionID,
  String? routePoints,
  DateTime startTime, // Using startTime
  DateTime endTime, // Using endTime instead of a range
) async {
  // Check if the GPS is currently tracking
  if (isTracking == true) {
    // Check if the recording is already paused
    if (isPaused == true) {
      return 'GPS recording is already paused.';
    }

    // Pause the GPS recording logic here
    // Example: stopping location updates
    // await stopLocationUpdates();

    // Optionally update database with new paused status
    // Assuming you're using Supabase to track session status
    final supabase = Supabase.instance.client;
    await supabase
        .from('gps_sessions')
        .update({'status': 'paused', 'end_time': endTime.toIso8601String()}).eq(
            'id', currentSessionID);

    return 'GPS recording paused successfully.';
  } else {
    return 'No active GPS recording session to pause.';
  }
}
