import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'add_driver_widget.dart' show AddDriverWidget;
import 'package:flutter/material.dart';

class AddDriverModel extends FlutterFlowModel<AddDriverWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for licenseNumber widget.
  FocusNode? licenseNumberFocusNode;
  TextEditingController? licenseNumberTextController;
  String? Function(BuildContext, String?)? licenseNumberTextControllerValidator;
  // State field(s) for vehicleNumebr widget.
  FocusNode? vehicleNumebrFocusNode;
  TextEditingController? vehicleNumebrTextController;
  String? Function(BuildContext, String?)? vehicleNumebrTextControllerValidator;
  // State field(s) for createDriverUsername widget.
  FocusNode? createDriverUsernameFocusNode;
  TextEditingController? createDriverUsernameTextController;
  String? Function(BuildContext, String?)?
      createDriverUsernameTextControllerValidator;
  // State field(s) for createDriverPassword widget.
  FocusNode? createDriverPasswordFocusNode;
  TextEditingController? createDriverPasswordTextController;
  late bool createDriverPasswordVisibility;
  String? Function(BuildContext, String?)?
      createDriverPasswordTextControllerValidator;
  // State field(s) for comfirmDriverPassword widget.
  FocusNode? comfirmDriverPasswordFocusNode;
  TextEditingController? comfirmDriverPasswordTextController;
  late bool comfirmDriverPasswordVisibility;
  String? Function(BuildContext, String?)?
      comfirmDriverPasswordTextControllerValidator;
  // Stores action output result for [Cloud Function - createDriverUser] action in createDriverButton widget.
  CreateDriverUserCloudFunctionCallResponse? cloudFunctionwx8;

  @override
  void initState(BuildContext context) {
    createDriverPasswordVisibility = false;
    comfirmDriverPasswordVisibility = false;
  }

  @override
  void dispose() {
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    licenseNumberFocusNode?.dispose();
    licenseNumberTextController?.dispose();

    vehicleNumebrFocusNode?.dispose();
    vehicleNumebrTextController?.dispose();

    createDriverUsernameFocusNode?.dispose();
    createDriverUsernameTextController?.dispose();

    createDriverPasswordFocusNode?.dispose();
    createDriverPasswordTextController?.dispose();

    comfirmDriverPasswordFocusNode?.dispose();
    comfirmDriverPasswordTextController?.dispose();
  }
}
