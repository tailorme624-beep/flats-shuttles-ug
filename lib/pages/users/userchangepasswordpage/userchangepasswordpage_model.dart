import '/flutter_flow/flutter_flow_util.dart';
import 'userchangepasswordpage_widget.dart' show UserchangepasswordpageWidget;
import 'package:flutter/material.dart';

class UserchangepasswordpageModel
    extends FlutterFlowModel<UserchangepasswordpageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for currentPassword widget.
  FocusNode? currentPasswordFocusNode;
  TextEditingController? currentPasswordTextController;
  late bool currentPasswordVisibility;
  String? Function(BuildContext, String?)?
      currentPasswordTextControllerValidator;
  // State field(s) for newPassword widget.
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordTextController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordTextControllerValidator;
  // State field(s) for comfirmNewPassword widget.
  FocusNode? comfirmNewPasswordFocusNode;
  TextEditingController? comfirmNewPasswordTextController;
  late bool comfirmNewPasswordVisibility;
  String? Function(BuildContext, String?)?
      comfirmNewPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    currentPasswordVisibility = false;
    newPasswordVisibility = false;
    comfirmNewPasswordVisibility = false;
  }

  @override
  void dispose() {
    currentPasswordFocusNode?.dispose();
    currentPasswordTextController?.dispose();

    newPasswordFocusNode?.dispose();
    newPasswordTextController?.dispose();

    comfirmNewPasswordFocusNode?.dispose();
    comfirmNewPasswordTextController?.dispose();
  }
}
