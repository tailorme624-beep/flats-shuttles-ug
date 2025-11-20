import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'flight_booking_page_widget.dart' show FlightBookingPageWidget;
import 'package:flutter/material.dart';

class FlightBookingPageModel extends FlutterFlowModel<FlightBookingPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for flying_from widget.
  FocusNode? flyingFromFocusNode;
  TextEditingController? flyingFromTextController;
  String? Function(BuildContext, String?)? flyingFromTextControllerValidator;
  // State field(s) for Flying_to widget.
  FocusNode? flyingToFocusNode;
  TextEditingController? flyingToTextController;
  String? Function(BuildContext, String?)? flyingToTextControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  BookingsRecord? flightbooking;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    flyingFromFocusNode?.dispose();
    flyingFromTextController?.dispose();

    flyingToFocusNode?.dispose();
    flyingToTextController?.dispose();
  }
}
