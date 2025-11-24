import '/flutter_flow/flutter_flow_util.dart';
import 'rate_driver_widget.dart' show RateDriverWidget;
import 'package:flutter/material.dart';

class RateDriverModel extends FlutterFlowModel<RateDriverWidget> {
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
