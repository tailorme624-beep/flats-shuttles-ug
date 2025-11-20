import '/flutter_flow/flutter_flow_util.dart';
import 'addflightpage_widget.dart' show AddflightpageWidget;
import 'package:flutter/material.dart';

class AddflightpageModel extends FlutterFlowModel<AddflightpageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for flightNumber widget.
  FocusNode? flightNumberFocusNode;
  TextEditingController? flightNumberTextController;
  String? Function(BuildContext, String?)? flightNumberTextControllerValidator;
  // State field(s) for airline widget.
  FocusNode? airlineFocusNode;
  TextEditingController? airlineTextController;
  String? Function(BuildContext, String?)? airlineTextControllerValidator;
  // State field(s) for aircraftType widget.
  FocusNode? aircraftTypeFocusNode;
  TextEditingController? aircraftTypeTextController;
  String? Function(BuildContext, String?)? aircraftTypeTextControllerValidator;
  // State field(s) for departure widget.
  FocusNode? departureFocusNode;
  TextEditingController? departureTextController;
  String? Function(BuildContext, String?)? departureTextControllerValidator;
  // State field(s) for arrival widget.
  FocusNode? arrivalFocusNode;
  TextEditingController? arrivalTextController;
  String? Function(BuildContext, String?)? arrivalTextControllerValidator;
  // State field(s) for flightDuration widget.
  FocusNode? flightDurationFocusNode;
  TextEditingController? flightDurationTextController;
  String? Function(BuildContext, String?)?
      flightDurationTextControllerValidator;
  // State field(s) for economyPrice widget.
  FocusNode? economyPriceFocusNode;
  TextEditingController? economyPriceTextController;
  String? Function(BuildContext, String?)? economyPriceTextControllerValidator;
  // State field(s) for bussinessPrice widget.
  FocusNode? bussinessPriceFocusNode;
  TextEditingController? bussinessPriceTextController;
  String? Function(BuildContext, String?)?
      bussinessPriceTextControllerValidator;
  // State field(s) for economySeats widget.
  FocusNode? economySeatsFocusNode;
  TextEditingController? economySeatsTextController;
  String? Function(BuildContext, String?)? economySeatsTextControllerValidator;
  // State field(s) for businessSeats widget.
  FocusNode? businessSeatsFocusNode;
  TextEditingController? businessSeatsTextController;
  String? Function(BuildContext, String?)? businessSeatsTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    flightNumberFocusNode?.dispose();
    flightNumberTextController?.dispose();

    airlineFocusNode?.dispose();
    airlineTextController?.dispose();

    aircraftTypeFocusNode?.dispose();
    aircraftTypeTextController?.dispose();

    departureFocusNode?.dispose();
    departureTextController?.dispose();

    arrivalFocusNode?.dispose();
    arrivalTextController?.dispose();

    flightDurationFocusNode?.dispose();
    flightDurationTextController?.dispose();

    economyPriceFocusNode?.dispose();
    economyPriceTextController?.dispose();

    bussinessPriceFocusNode?.dispose();
    bussinessPriceTextController?.dispose();

    economySeatsFocusNode?.dispose();
    economySeatsTextController?.dispose();

    businessSeatsFocusNode?.dispose();
    businessSeatsTextController?.dispose();
  }
}
