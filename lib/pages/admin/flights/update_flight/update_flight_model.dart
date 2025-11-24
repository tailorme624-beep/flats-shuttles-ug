import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_flight_widget.dart' show UpdateFlightWidget;
import 'package:flutter/material.dart';

class UpdateFlightModel extends FlutterFlowModel<UpdateFlightWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for flightNumber widget.
  FocusNode? flightNumberFocusNode;
  TextEditingController? flightNumberTextController;
  String? Function(BuildContext, String?)? flightNumberTextControllerValidator;
  // State field(s) for aircraftType widget.
  FocusNode? aircraftTypeFocusNode;
  TextEditingController? aircraftTypeTextController;
  String? Function(BuildContext, String?)? aircraftTypeTextControllerValidator;
  // State field(s) for departureAirport widget.
  FocusNode? departureAirportFocusNode;
  TextEditingController? departureAirportTextController;
  String? Function(BuildContext, String?)?
      departureAirportTextControllerValidator;
  // State field(s) for arrivalAirport widget.
  FocusNode? arrivalAirportFocusNode;
  TextEditingController? arrivalAirportTextController;
  String? Function(BuildContext, String?)?
      arrivalAirportTextControllerValidator;
  // State field(s) for departureDate widget.
  FocusNode? departureDateFocusNode;
  TextEditingController? departureDateTextController;
  String? Function(BuildContext, String?)? departureDateTextControllerValidator;
  // State field(s) for departureTime widget.
  FocusNode? departureTimeFocusNode;
  TextEditingController? departureTimeTextController;
  String? Function(BuildContext, String?)? departureTimeTextControllerValidator;
  // State field(s) for arrivalDate widget.
  FocusNode? arrivalDateFocusNode;
  TextEditingController? arrivalDateTextController;
  String? Function(BuildContext, String?)? arrivalDateTextControllerValidator;
  // State field(s) for arrivalTime widget.
  FocusNode? arrivalTimeFocusNode;
  TextEditingController? arrivalTimeTextController;
  String? Function(BuildContext, String?)? arrivalTimeTextControllerValidator;
  // State field(s) for toatlSeats widget.
  FocusNode? toatlSeatsFocusNode;
  TextEditingController? toatlSeatsTextController;
  String? Function(BuildContext, String?)? toatlSeatsTextControllerValidator;
  // State field(s) for availableSeats widget.
  FocusNode? availableSeatsFocusNode;
  TextEditingController? availableSeatsTextController;
  String? Function(BuildContext, String?)?
      availableSeatsTextControllerValidator;
  // State field(s) for economyPrice widget.
  FocusNode? economyPriceFocusNode;
  TextEditingController? economyPriceTextController;
  String? Function(BuildContext, String?)? economyPriceTextControllerValidator;
  // State field(s) for businessPrice widget.
  FocusNode? businessPriceFocusNode;
  TextEditingController? businessPriceTextController;
  String? Function(BuildContext, String?)? businessPriceTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    flightNumberFocusNode?.dispose();
    flightNumberTextController?.dispose();

    aircraftTypeFocusNode?.dispose();
    aircraftTypeTextController?.dispose();

    departureAirportFocusNode?.dispose();
    departureAirportTextController?.dispose();

    arrivalAirportFocusNode?.dispose();
    arrivalAirportTextController?.dispose();

    departureDateFocusNode?.dispose();
    departureDateTextController?.dispose();

    departureTimeFocusNode?.dispose();
    departureTimeTextController?.dispose();

    arrivalDateFocusNode?.dispose();
    arrivalDateTextController?.dispose();

    arrivalTimeFocusNode?.dispose();
    arrivalTimeTextController?.dispose();

    toatlSeatsFocusNode?.dispose();
    toatlSeatsTextController?.dispose();

    availableSeatsFocusNode?.dispose();
    availableSeatsTextController?.dispose();

    economyPriceFocusNode?.dispose();
    economyPriceTextController?.dispose();

    businessPriceFocusNode?.dispose();
    businessPriceTextController?.dispose();
  }
}
