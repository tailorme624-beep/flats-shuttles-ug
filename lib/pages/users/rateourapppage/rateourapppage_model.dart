import '/flutter_flow/flutter_flow_util.dart';
import 'rateourapppage_widget.dart' show RateourapppageWidget;
import 'package:flutter/material.dart';

class RateourapppageModel extends FlutterFlowModel<RateourapppageWidget> {
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
