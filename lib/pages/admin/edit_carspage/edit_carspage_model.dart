import '/flutter_flow/flutter_flow_util.dart';
import 'edit_carspage_widget.dart' show EditCarspageWidget;
import 'package:flutter/material.dart';

class EditCarspageModel extends FlutterFlowModel<EditCarspageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for carType widget.
  FocusNode? carTypeFocusNode;
  TextEditingController? carTypeTextController;
  String? Function(BuildContext, String?)? carTypeTextControllerValidator;
  // State field(s) for carModal widget.
  FocusNode? carModalFocusNode;
  TextEditingController? carModalTextController;
  String? Function(BuildContext, String?)? carModalTextControllerValidator;
  // State field(s) for yearMake widget.
  FocusNode? yearMakeFocusNode;
  TextEditingController? yearMakeTextController;
  String? Function(BuildContext, String?)? yearMakeTextControllerValidator;
  // State field(s) for color widget.
  FocusNode? colorFocusNode;
  TextEditingController? colorTextController;
  String? Function(BuildContext, String?)? colorTextControllerValidator;
  // State field(s) for licensePlate widget.
  FocusNode? licensePlateFocusNode;
  TextEditingController? licensePlateTextController;
  String? Function(BuildContext, String?)? licensePlateTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    carTypeFocusNode?.dispose();
    carTypeTextController?.dispose();

    carModalFocusNode?.dispose();
    carModalTextController?.dispose();

    yearMakeFocusNode?.dispose();
    yearMakeTextController?.dispose();

    colorFocusNode?.dispose();
    colorTextController?.dispose();

    licensePlateFocusNode?.dispose();
    licensePlateTextController?.dispose();
  }
}
