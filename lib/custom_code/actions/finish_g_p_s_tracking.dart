// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> finishGPSTracking(
  bool isTracking,
  bool isPaused,
  String? currentSessionID,
  String routePoints,
  DateTimeRange locationTimer,
) async {
  // Check if tracking is active
  if (!isTracking) {
    return 'Tracking is not active.';
  }

  // Check if the session is paused
  if (isPaused) {
    return 'Tracking is paused. Please resume before finishing.';
  }

  // Save the current session data
  try {
    // Here you would typically save the session data to a database or a file
    // For demonstration, we will just print the data
    print('Saving session...');
    print('Session ID: $currentSessionID');
    print('Route Points: $routePoints');
    print('Location Timer: ${locationTimer.start} to ${locationTimer.end}');

    // Simulate saving data with a delay
    await Future.delayed(Duration(seconds: 2));

    // Reset the tracking state
    // This could involve updating state management variables or notifying listeners
    // For example, if using a state management solution like Provider or Riverpod:
    // context.read<TrackingState>().resetTracking();

    // Return success message
    return 'GPS tracking session completed successfully.';
  } catch (e) {
    // Handle any errors that may occur during the saving process
    return 'Error saving session: ${e.toString()}';
  }
}
