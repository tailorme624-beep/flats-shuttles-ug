import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'booking_widget.dart' show BookingWidget;
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookingModel extends FlutterFlowModel<BookingWidget> {
  /// Local state fields for this page.
  
  // --- Location Fields ---
  
  /// The specific address string for the pickup location (from user input/map search).
  String pickupAddress = '';

  /// The LatLng value for the pickup location.
  LatLng? pickupLocation;

  /// The specific address string for the dropoff location (from user input/map search).
  String dropoffAddress = '';

  /// The LatLng value for the dropoff location.
  LatLng? dropoffLocation;

  // --- Ride/Fare Calculation Fields ---

  /// The distance in kilometers between pickup and dropoff.
  double distanceKm = 0.0;

  /// The currently selected vehicle type ('standard', 'premium', 'vip').
  String vehicleType = 'standard';

  /// The base fare for the currently selected vehicle type (e.g., UGX 30000).
  double selectedVehicleBaseFare = 0.0;

  /// The dynamically calculated final estimated fare (Base + Overage).
  double estimatedFare = 0.0;
  
  // --- Payment & Time Fields ---

  /// The selected payment method (e.g., 'Cash', 'Card').
  String paymentMethod = '';
  
  /// Estimated duration in seconds (if needed for display, otherwise remove)
  int durationSecs = 0; 

  @override
  void initState(BuildContext context) {
    // Set initial values that ensure the UI doesn't crash on null/empty data
    // The actual values will be set on map selection/initialization in the Widget's initState
    pickupAddress = 'Current Location';
    dropoffAddress = 'Select Destination';
    vehicleType = 'standard';
    paymentMethod = 'Cash'; 
  }

  @override
  void dispose() {}
}
