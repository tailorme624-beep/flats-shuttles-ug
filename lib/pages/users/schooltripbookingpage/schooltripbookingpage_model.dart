import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'schooltripbookingpage_widget.dart' show SchooltripbookingpageWidget;
import 'package:flutter/material.dart';

class SchooltripbookingpageModel
    extends FlutterFlowModel<SchooltripbookingpageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for organisationName widget.
  FocusNode? organisationNameFocusNode;
  TextEditingController? organisationNameTextController;
  String? Function(BuildContext, String?)?
      organisationNameTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for numberOfchildren widget.
  FocusNode? numberOfchildrenFocusNode;
  TextEditingController? numberOfchildrenTextController;
  String? Function(BuildContext, String?)?
      numberOfchildrenTextControllerValidator;
  // State field(s) for NumberOfAdults widget.
  FocusNode? numberOfAdultsFocusNode;
  TextEditingController? numberOfAdultsTextController;
  String? Function(BuildContext, String?)?
      numberOfAdultsTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue3;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    organisationNameFocusNode?.dispose();
    organisationNameTextController?.dispose();

    numberOfchildrenFocusNode?.dispose();
    numberOfchildrenTextController?.dispose();

    numberOfAdultsFocusNode?.dispose();
    numberOfAdultsTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
