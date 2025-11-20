import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'ride_booking_page_widget.dart' show RideBookingPageWidget;
import 'package:flutter/material.dart';

class RideBookingPageModel extends FlutterFlowModel<RideBookingPageWidget> {
  ///  Local state fields for this page.
  /// user's current location
  LatLng? pickupLocation;

  /// user's final destination
  LatLng? dropoffLocation;

  /// distance from the pickup location to dropoff location
  double? tripdistanceKM = 0.0;

  /// initial fare for a ride
  double? selectedVehiclebaseFare = 0.0;

  /// finalcalculations
  double? totalFare = 0.0;

  DateTimeRange? durationSecs;

  String? vehicleType;

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Custom Action - getDistanceByApi] action in GoogleMap widget.
  double? apidistance;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for pickuplocation widget.
  FocusNode? pickuplocationFocusNode;
  TextEditingController? pickuplocationTextController;
  String? Function(BuildContext, String?)?
      pickuplocationTextControllerValidator;
  // State field(s) for drop-off-location widget.
  FocusNode? dropOffLocationFocusNode;
  TextEditingController? dropOffLocationTextController;
  String? Function(BuildContext, String?)?
      dropOffLocationTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    pickuplocationFocusNode?.dispose();
    pickuplocationTextController?.dispose();

    dropOffLocationFocusNode?.dispose();
    dropOffLocationTextController?.dispose();
  }
}
