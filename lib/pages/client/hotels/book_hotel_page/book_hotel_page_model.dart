import '/flutter_flow/flutter_flow_util.dart';
import 'book_hotel_page_widget.dart' show BookHotelPageWidget;
import 'package:flutter/material.dart';

class BookHotelPageModel extends FlutterFlowModel<BookHotelPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for guestfullName widget.
  FocusNode? guestfullNameFocusNode;
  TextEditingController? guestfullNameTextController;
  String? Function(BuildContext, String?)? guestfullNameTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for specialRequests widget.
  FocusNode? specialRequestsFocusNode;
  TextEditingController? specialRequestsTextController;
  String? Function(BuildContext, String?)?
      specialRequestsTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    guestfullNameFocusNode?.dispose();
    guestfullNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    specialRequestsFocusNode?.dispose();
    specialRequestsTextController?.dispose();
  }
}
