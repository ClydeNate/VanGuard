import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'driver_side_finished_model.dart';
export 'driver_side_finished_model.dart';

/// login as a driver
class DriverSideFinishedWidget extends StatefulWidget {
  const DriverSideFinishedWidget({
    super.key,
    this.city,
  });

  /// cities
  final LatLng? city;

  static String routeName = 'DriverSideFinished';
  static String routePath = '/driverSideFinished';

  @override
  State<DriverSideFinishedWidget> createState() =>
      _DriverSideFinishedWidgetState();
}

class _DriverSideFinishedWidgetState extends State<DriverSideFinishedWidget> {
  late DriverSideFinishedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DriverSideFinishedModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitChasingDots(
              color: FlutterFlowTheme.of(context).secondary,
              size: 50.0,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF1F4F8),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              'Record Data',
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Google Sans Family',
                    fontSize: 24.0,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black],
                    stops: [0.7, 1.0],
                    begin: AlignmentDirectional(0.0, 1.0),
                    end: AlignmentDirectional(0, -1.0),
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Builder(builder: (context) {
                    final _googleMapMarker = currentUserLocationValue;
                    return FlutterFlowGoogleMap(
                      controller: _model.googleMapsController,
                      onCameraIdle: (latLng) =>
                          safeSetState(() => _model.googleMapsCenter = latLng),
                      initialLocation: _model.googleMapsCenter ??=
                          LatLng(13.106061, -59.613158),
                      markers: [
                        if (_googleMapMarker != null)
                          FlutterFlowMarker(
                            _googleMapMarker.serialize(),
                            _googleMapMarker,
                          ),
                      ],
                      markerColor: GoogleMarkerColor.red,
                      mapType: MapType.normal,
                      style: GoogleMapStyle.standard,
                      initialZoom: 14.0,
                      allowInteraction: true,
                      allowZoom: true,
                      showZoomControls: true,
                      showLocation: true,
                      showCompass: true,
                      showMapToolbar: false,
                      showTraffic: true,
                      centerMapOnMarkerTap: true,
                    );
                  }),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 2.27),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.749,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.1, 0.43),
                        child: Text(
                          'Press Pause or Stop to record the progress',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Google Sans Family',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.72, 0.27),
                        child: Text(
                          '00:00',
                          textAlign: TextAlign.end,
                          style: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: 'Google Sans Family',
                                color: FlutterFlowTheme.of(context).alternate,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w800,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.71, 0.16),
                        child: Text(
                          'Speed ',
                          textAlign: TextAlign.end,
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Google Sans Family',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.69, 0.16),
                        child: Text(
                          'Speed ',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Google Sans Family',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.65, 0.27),
                        child: Text(
                          'Time Allocated',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Google Sans Family',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Progress Recorded!',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Google Sans Family',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.07, 0.94),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(DriverDashbboardWidget.routeName);
                  },
                  text: 'Exit',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.75,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Google Sans Family',
                          color: Colors.white,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.06, 0.8),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(DriverSideRecordWidget.routeName);

                    await actions.startNewRecording(
                      false,
                      false,
                      '',
                      getCurrentRouteStack(context)
                          .contains(widget!.city?.toString())
                          .toString(),
                      getCurrentTimestamp,
                      getCurrentTimestamp,
                    );
                  },
                  text: 'Record New Entry',
                  options: FFButtonOptions(
                    width: 294.4,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Google Sans Family',
                          color: Colors.white,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
