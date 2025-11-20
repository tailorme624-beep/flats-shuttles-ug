import '/flutter_flow/flutter_flow_util.dart';
import 'adminloginpage_widget.dart' show AdminloginpageWidget;
import 'package:flutter/material.dart';

class AdminloginpageModel extends FlutterFlowModel<AdminloginpageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Adminemail widget.
  FocusNode? adminemailFocusNode;
  TextEditingController? adminemailTextController;
  String? Function(BuildContext, String?)? adminemailTextControllerValidator;
  // State field(s) for AdminPassword widget.
  FocusNode? adminPasswordFocusNode;
  TextEditingController? adminPasswordTextController;
  late bool adminPasswordVisibility;
  String? Function(BuildContext, String?)? adminPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    adminPasswordVisibility = false;
  }

  @override
  void dispose() {
    adminemailFocusNode?.dispose();
    adminemailTextController?.dispose();

    adminPasswordFocusNode?.dispose();
    adminPasswordTextController?.dispose();
  }
}
