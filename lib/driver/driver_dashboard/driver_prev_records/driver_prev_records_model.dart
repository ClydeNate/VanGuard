import '/flutter_flow/flutter_flow_util.dart';
import 'driver_prev_records_widget.dart' show DriverPrevRecordsWidget;
import 'package:flutter/material.dart';

class DriverPrevRecordsModel extends FlutterFlowModel<DriverPrevRecordsWidget> {
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
