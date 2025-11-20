import '/flutter_flow/flutter_flow_util.dart';
import 'editdriverpage_widget.dart' show EditdriverpageWidget;
import 'package:flutter/material.dart';

class EditdriverpageModel extends FlutterFlowModel<EditdriverpageWidget> {
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
