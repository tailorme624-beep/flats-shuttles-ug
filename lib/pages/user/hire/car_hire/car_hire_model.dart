import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'car_hire_widget.dart' show CarHireWidget;
import 'package:flutter/material.dart';

class CarHireModel extends FlutterFlowModel<CarHireWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for pickupLocation widget.
  FocusNode? pickupLocationFocusNode;
  TextEditingController? pickupLocationTextController;
  String? Function(BuildContext, String?)?
      pickupLocationTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for dropoffLocation widget.
  FocusNode? dropoffLocationFocusNode;
  TextEditingController? dropoffLocationTextController;
  String? Function(BuildContext, String?)?
      dropoffLocationTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    pickupLocationFocusNode?.dispose();
    pickupLocationTextController?.dispose();

    dropoffLocationFocusNode?.dispose();
    dropoffLocationTextController?.dispose();
  }
}
