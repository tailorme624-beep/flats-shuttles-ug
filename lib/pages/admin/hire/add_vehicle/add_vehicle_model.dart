import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_vehicle_widget.dart' show AddVehicleWidget;
import 'package:flutter/material.dart';

class AddVehicleModel extends FlutterFlowModel<AddVehicleWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for carMake widget.
  FocusNode? carMakeFocusNode;
  TextEditingController? carMakeTextController;
  String? Function(BuildContext, String?)? carMakeTextControllerValidator;
  // State field(s) for carModel widget.
  FocusNode? carModelFocusNode;
  TextEditingController? carModelTextController;
  String? Function(BuildContext, String?)? carModelTextControllerValidator;
  // State field(s) for yearMake widget.
  FocusNode? yearMakeFocusNode;
  TextEditingController? yearMakeTextController;
  String? Function(BuildContext, String?)? yearMakeTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for numberOfSeat widget.
  FocusNode? numberOfSeatFocusNode;
  TextEditingController? numberOfSeatTextController;
  String? Function(BuildContext, String?)? numberOfSeatTextControllerValidator;
  // State field(s) for dailyRate widget.
  FocusNode? dailyRateFocusNode;
  TextEditingController? dailyRateTextController;
  String? Function(BuildContext, String?)? dailyRateTextControllerValidator;
  // State field(s) for weeklyRate widget.
  FocusNode? weeklyRateFocusNode;
  TextEditingController? weeklyRateTextController;
  String? Function(BuildContext, String?)? weeklyRateTextControllerValidator;
  // State field(s) for TextFieldmonthlyRate widget.
  FocusNode? textFieldmonthlyRateFocusNode;
  TextEditingController? textFieldmonthlyRateTextController;
  String? Function(BuildContext, String?)?
      textFieldmonthlyRateTextControllerValidator;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for licensePlate widget.
  FocusNode? licensePlateFocusNode;
  TextEditingController? licensePlateTextController;
  String? Function(BuildContext, String?)? licensePlateTextControllerValidator;
  // State field(s) for carDescription widget.
  FocusNode? carDescriptionFocusNode;
  TextEditingController? carDescriptionTextController;
  String? Function(BuildContext, String?)?
      carDescriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    carMakeFocusNode?.dispose();
    carMakeTextController?.dispose();

    carModelFocusNode?.dispose();
    carModelTextController?.dispose();

    yearMakeFocusNode?.dispose();
    yearMakeTextController?.dispose();

    numberOfSeatFocusNode?.dispose();
    numberOfSeatTextController?.dispose();

    dailyRateFocusNode?.dispose();
    dailyRateTextController?.dispose();

    weeklyRateFocusNode?.dispose();
    weeklyRateTextController?.dispose();

    textFieldmonthlyRateFocusNode?.dispose();
    textFieldmonthlyRateTextController?.dispose();

    licensePlateFocusNode?.dispose();
    licensePlateTextController?.dispose();

    carDescriptionFocusNode?.dispose();
    carDescriptionTextController?.dispose();
  }
}
