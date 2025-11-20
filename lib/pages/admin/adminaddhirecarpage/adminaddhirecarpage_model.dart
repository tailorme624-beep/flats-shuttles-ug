import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'adminaddhirecarpage_widget.dart' show AdminaddhirecarpageWidget;
import 'package:flutter/material.dart';

class AdminaddhirecarpageModel
    extends FlutterFlowModel<AdminaddhirecarpageWidget> {
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
  // State field(s) for nameOfSeat widget.
  FocusNode? nameOfSeatFocusNode;
  TextEditingController? nameOfSeatTextController;
  String? Function(BuildContext, String?)? nameOfSeatTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;

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

    nameOfSeatFocusNode?.dispose();
    nameOfSeatTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController5?.dispose();

    textFieldFocusNode2?.dispose();
    textController6?.dispose();

    textFieldFocusNode3?.dispose();
    textController7?.dispose();

    textFieldFocusNode4?.dispose();
    textController8?.dispose();

    textFieldFocusNode5?.dispose();
    textController9?.dispose();
  }
}
