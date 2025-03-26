// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future<String> pauseGPSRecording(
  bool? isTracking,
  bool? isPaused,
  String? currentSessionID,
  String? routePoints,
  DateTime startTime,
  DateTime endTime,
) async {
  if (isTracking == true) {
    if (isPaused == true) {
      return 'GPS recording is already paused.';
    }

    final supabase = Supabase.instance.client; // Fix here

    await supabase
        .from('gps_sessions')
        .update({'status': 'paused', 'end_time': endTime.toIso8601String()}).eq(
            'id', currentSessionID);

    return 'GPS recording paused successfully.';
  } else {
    return 'No active GPS recording session to pause.';
  }
}
