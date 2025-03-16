import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'driver_side_finished_widget.dart' show DriverSideFinishedWidget;
import 'package:flutter/material.dart';

class DriverSideFinishedModel
    extends FlutterFlowModel<DriverSideFinishedWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
