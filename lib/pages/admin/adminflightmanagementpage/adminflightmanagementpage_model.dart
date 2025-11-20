import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'adminflightmanagementpage_widget.dart'
    show AdminflightmanagementpageWidget;
import 'package:flutter/material.dart';

class AdminflightmanagementpageModel
    extends FlutterFlowModel<AdminflightmanagementpageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchFlight widget.
  FocusNode? searchFlightFocusNode;
  TextEditingController? searchFlightTextController;
  String? Function(BuildContext, String?)? searchFlightTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFlightFocusNode?.dispose();
    searchFlightTextController?.dispose();
  }
}
