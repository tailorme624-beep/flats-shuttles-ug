import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'reportdetailspage_widget.dart' show ReportdetailspageWidget;
import 'package:flutter/material.dart';

class ReportdetailspageModel extends FlutterFlowModel<ReportdetailspageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for adminNotes widget.
  FocusNode? adminNotesFocusNode;
  TextEditingController? adminNotesTextController;
  String? Function(BuildContext, String?)? adminNotesTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    adminNotesFocusNode?.dispose();
    adminNotesTextController?.dispose();
  }
}
