import '/flutter_flow/flutter_flow_util.dart';
import 'availablehotelpage_widget.dart' show AvailablehotelpageWidget;
import 'package:flutter/material.dart';

class AvailablehotelpageModel
    extends FlutterFlowModel<AvailablehotelpageWidget> {
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
