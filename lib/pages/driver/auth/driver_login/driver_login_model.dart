import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'driver_login_widget.dart' show DriverLoginWidget;
import 'package:flutter/material.dart';

class DriverLoginModel extends FlutterFlowModel<DriverLoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for driverUserName widget.
  FocusNode? driverUserNameFocusNode;
  TextEditingController? driverUserNameTextController;
  String? Function(BuildContext, String?)?
      driverUserNameTextControllerValidator;
  // State field(s) for driverPassword widget.
  FocusNode? driverPasswordFocusNode;
  TextEditingController? driverPasswordTextController;
  late bool driverPasswordVisibility;
  String? Function(BuildContext, String?)?
      driverPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    driverPasswordVisibility = false;
  }

  @override
  void dispose() {
    driverUserNameFocusNode?.dispose();
    driverUserNameTextController?.dispose();

    driverPasswordFocusNode?.dispose();
    driverPasswordTextController?.dispose();
  }
}
