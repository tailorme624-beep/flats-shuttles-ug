import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'admin_login_widget.dart' show AdminLoginWidget;
import 'package:flutter/material.dart';

class AdminLoginModel extends FlutterFlowModel<AdminLoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for adminLoginEmail widget.
  FocusNode? adminLoginEmailFocusNode;
  TextEditingController? adminLoginEmailTextController;
  String? Function(BuildContext, String?)?
      adminLoginEmailTextControllerValidator;
  // State field(s) for adminLoginPassword widget.
  final adminLoginPasswordKey = GlobalKey();
  FocusNode? adminLoginPasswordFocusNode;
  TextEditingController? adminLoginPasswordTextController;
  String? adminLoginPasswordSelectedOption;
  late bool adminLoginPasswordVisibility;
  String? Function(BuildContext, String?)?
      adminLoginPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    adminLoginPasswordVisibility = false;
  }

  @override
  void dispose() {
    adminLoginEmailFocusNode?.dispose();
    adminLoginEmailTextController?.dispose();

    adminLoginPasswordFocusNode?.dispose();
  }
}
