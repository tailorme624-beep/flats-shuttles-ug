import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'booking_widget.dart' show BookingWidget;
import 'package:flutter/material.dart';

class BookingModel extends FlutterFlowModel<BookingWidget> {
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
