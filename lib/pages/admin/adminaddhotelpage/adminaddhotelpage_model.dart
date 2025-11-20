import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'adminaddhotelpage_widget.dart' show AdminaddhotelpageWidget;
import 'package:flutter/material.dart';

class AdminaddhotelpageModel extends FlutterFlowModel<AdminaddhotelpageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for hotelName widget.
  FocusNode? hotelNameFocusNode;
  TextEditingController? hotelNameTextController;
  String? Function(BuildContext, String?)? hotelNameTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for starRating widget.
  FocusNode? starRatingFocusNode;
  TextEditingController? starRatingTextController;
  String? Function(BuildContext, String?)? starRatingTextControllerValidator;
  // State field(s) for pricePerNight widget.
  FocusNode? pricePerNightFocusNode;
  TextEditingController? pricePerNightTextController;
  String? Function(BuildContext, String?)? pricePerNightTextControllerValidator;
  // State field(s) for totalRooms widget.
  FocusNode? totalRoomsFocusNode;
  TextEditingController? totalRoomsTextController;
  String? Function(BuildContext, String?)? totalRoomsTextControllerValidator;
  // State field(s) for availableRooms widget.
  FocusNode? availableRoomsFocusNode;
  TextEditingController? availableRoomsTextController;
  String? Function(BuildContext, String?)?
      availableRoomsTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for website widget.
  FocusNode? websiteFocusNode;
  TextEditingController? websiteTextController;
  String? Function(BuildContext, String?)? websiteTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    hotelNameFocusNode?.dispose();
    hotelNameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    starRatingFocusNode?.dispose();
    starRatingTextController?.dispose();

    pricePerNightFocusNode?.dispose();
    pricePerNightTextController?.dispose();

    totalRoomsFocusNode?.dispose();
    totalRoomsTextController?.dispose();

    availableRoomsFocusNode?.dispose();
    availableRoomsTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    websiteFocusNode?.dispose();
    websiteTextController?.dispose();
  }
}
