import '/flutter_flow/flutter_flow_util.dart';
import 'city_routes_widget.dart' show CityRoutesWidget;
import 'package:flutter/material.dart';

class CityRoutesModel extends FlutterFlowModel<CityRoutesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
