import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'driver_active_ride_widget.dart' show DriverActiveRideWidget;
import 'package:flutter/material.dart';

class DriverActiveRideModel extends FlutterFlowModel<DriverActiveRideWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
