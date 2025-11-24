import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'driver_information_widget.dart' show DriverInformationWidget;
import 'package:flutter/material.dart';

class DriverInformationModel extends FlutterFlowModel<DriverInformationWidget> {
  ///  Local state fields for this page.

  String? vehicleImage;

  String? drivingLicense;

  String? personalPhoto;

  ///  State fields for stateful widgets in this page.

  // State field(s) for driverfullName widget.
  FocusNode? driverfullNameFocusNode;
  TextEditingController? driverfullNameTextController;
  String? Function(BuildContext, String?)?
      driverfullNameTextControllerValidator;
  // State field(s) for driverEmail widget.
  FocusNode? driverEmailFocusNode;
  TextEditingController? driverEmailTextController;
  String? Function(BuildContext, String?)? driverEmailTextControllerValidator;
  // State field(s) for driverPhoneNumber widget.
  FocusNode? driverPhoneNumberFocusNode;
  TextEditingController? driverPhoneNumberTextController;
  String? Function(BuildContext, String?)?
      driverPhoneNumberTextControllerValidator;
  // State field(s) for NIN widget.
  FocusNode? ninFocusNode;
  TextEditingController? ninTextController;
  String? Function(BuildContext, String?)? ninTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for vehicleModal widget.
  FocusNode? vehicleModalFocusNode;
  TextEditingController? vehicleModalTextController;
  String? Function(BuildContext, String?)? vehicleModalTextControllerValidator;
  // State field(s) for licensePlate widget.
  FocusNode? licensePlateFocusNode;
  TextEditingController? licensePlateTextController;
  String? Function(BuildContext, String?)? licensePlateTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for comfirm_password widget.
  FocusNode? comfirmPasswordFocusNode;
  TextEditingController? comfirmPasswordTextController;
  late bool comfirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      comfirmPasswordTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    comfirmPasswordVisibility = false;
  }

  @override
  void dispose() {
    driverfullNameFocusNode?.dispose();
    driverfullNameTextController?.dispose();

    driverEmailFocusNode?.dispose();
    driverEmailTextController?.dispose();

    driverPhoneNumberFocusNode?.dispose();
    driverPhoneNumberTextController?.dispose();

    ninFocusNode?.dispose();
    ninTextController?.dispose();

    vehicleModalFocusNode?.dispose();
    vehicleModalTextController?.dispose();

    licensePlateFocusNode?.dispose();
    licensePlateTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    comfirmPasswordFocusNode?.dispose();
    comfirmPasswordTextController?.dispose();
  }
}
