import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_tour_widget.dart' show AddTourWidget;
import 'package:flutter/material.dart';

class AddTourModel extends FlutterFlowModel<AddTourWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for placeName widget.
  FocusNode? placeNameFocusNode;
  TextEditingController? placeNameTextController;
  String? Function(BuildContext, String?)? placeNameTextControllerValidator;
  String? _placeNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kcbfo3vx' /* Enter place name is required */,
      );
    }

    return null;
  }

  // State field(s) for location widget.
  FocusNode? locationFocusNode;
  TextEditingController? locationTextController;
  String? Function(BuildContext, String?)? locationTextControllerValidator;
  String? _locationTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'aizoe2c8' /* Enter location is required */,
      );
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'cah5nryo' /* Describe the place and attract... */,
      );
    }

    return null;
  }

  // State field(s) for costPerPerson widget.
  FocusNode? costPerPersonFocusNode;
  TextEditingController? costPerPersonTextController;
  String? Function(BuildContext, String?)? costPerPersonTextControllerValidator;
  String? _costPerPersonTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'unh8rdwv' /* UGX0.00 is required */,
      );
    }

    return null;
  }

  // State field(s) for duration widget.
  FocusNode? durationFocusNode;
  TextEditingController? durationTextController;
  String? Function(BuildContext, String?)? durationTextControllerValidator;
  String? _durationTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1dcece6d' /* 3 is required */,
      );
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // State field(s) for specialNotes widget.
  FocusNode? specialNotesFocusNode;
  TextEditingController? specialNotesTextController;
  String? Function(BuildContext, String?)? specialNotesTextControllerValidator;
  String? _specialNotesTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kcgixpqk' /* Any special requirements or no... */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    placeNameTextControllerValidator = _placeNameTextControllerValidator;
    locationTextControllerValidator = _locationTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
    costPerPersonTextControllerValidator =
        _costPerPersonTextControllerValidator;
    durationTextControllerValidator = _durationTextControllerValidator;
    specialNotesTextControllerValidator = _specialNotesTextControllerValidator;
  }

  @override
  void dispose() {
    placeNameFocusNode?.dispose();
    placeNameTextController?.dispose();

    locationFocusNode?.dispose();
    locationTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    costPerPersonFocusNode?.dispose();
    costPerPersonTextController?.dispose();

    durationFocusNode?.dispose();
    durationTextController?.dispose();

    specialNotesFocusNode?.dispose();
    specialNotesTextController?.dispose();
  }
}
