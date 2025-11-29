import '/flutter_flow/flutter_flow_util.dart';
import 'update_driver_profile_widget.dart' show UpdateDriverProfileWidget;
import 'package:flutter/material.dart';

class UpdateDriverProfileModel
    extends FlutterFlowModel<UpdateDriverProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for driverfullName widget.
  FocusNode? driverfullNameFocusNode;
  TextEditingController? driverfullNameTextController;
  String? Function(BuildContext, String?)?
      driverfullNameTextControllerValidator;
  // State field(s) for driverPhoneNumber widget.
  FocusNode? driverPhoneNumberFocusNode;
  TextEditingController? driverPhoneNumberTextController;
  String? Function(BuildContext, String?)?
      driverPhoneNumberTextControllerValidator;
  // State field(s) for driverEmail widget.
  FocusNode? driverEmailFocusNode;
  TextEditingController? driverEmailTextController;
  String? Function(BuildContext, String?)? driverEmailTextControllerValidator;
  // State field(s) for vehicleModal widget.
  FocusNode? vehicleModalFocusNode;
  TextEditingController? vehicleModalTextController;
  String? Function(BuildContext, String?)? vehicleModalTextControllerValidator;
  // State field(s) for licensePlate widget.
  FocusNode? licensePlateFocusNode;
  TextEditingController? licensePlateTextController;
  String? Function(BuildContext, String?)? licensePlateTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    driverfullNameFocusNode?.dispose();
    driverfullNameTextController?.dispose();

    driverPhoneNumberFocusNode?.dispose();
    driverPhoneNumberTextController?.dispose();

    driverEmailFocusNode?.dispose();
    driverEmailTextController?.dispose();

    vehicleModalFocusNode?.dispose();
    vehicleModalTextController?.dispose();

    licensePlateFocusNode?.dispose();
    licensePlateTextController?.dispose();
  }
}
