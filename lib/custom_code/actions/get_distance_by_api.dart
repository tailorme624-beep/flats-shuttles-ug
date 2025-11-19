// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// *** NECESSARY IMPORTS MOVED HERE ***
import 'dart:convert';
import 'package:http/http.dart' as http;
import '/flutter_flow/lat_lng.dart';
// **********************************

// NOTE: This key is hardcoded as requested, but ensure you manage
// security for your production app.
// Ensure this dependency is added in Settings > Custom Code > Pubspec Dependencies
// Dependency: http: ^0.13.3
const String GOOGLE_API_KEY = 'AIzaSyBfL0MnkaF7oW8buy1g2iRpeOlUFflp5r8';

/// Calculates the distance in kilometers between two points by calling the Google
/// Directions API.
Future<double> getDistanceByApi(
  // The start location (Pickup)
  LatLng originLatLon,
  // The end location (Drop-off)
  LatLng destinationLatLon,
) async {
  // Base URL for Google Maps Directions API
  const String apiUrl = 'https://maps.googleapis.com/maps/api/directions/json';

  // Format the coordinates for the URL
  final String origin = '${originLatLon.latitude},${originLatLon.longitude}';
  final String destination =
      '${destinationLatLon.latitude},${destinationLatLon.longitude}';

  // Construct the full request URL
  final Uri uri = Uri.parse(
      '$apiUrl?origin=$origin&destination=$destination&mode=driving&key=$GOOGLE_API_KEY');

  try {
    // Send the HTTP GET request
    final http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      // Check if the API returned a successful route
      if (data['status'] == 'OK' &&
          data['routes'] != null &&
          data['routes'].isNotEmpty) {
        // The distance is in meters in the first leg of the first route
        final int distanceMeters =
            data['routes'][0]['legs'][0]['distance']['value'];

        // Convert meters to kilometers
        final double distanceKm = distanceMeters / 1000.0;

        // Return distance rounded to 2 decimal places
        return double.parse(distanceKm.toStringAsFixed(2));
      } else {
        // Log API status errors (e.g., ZERO_RESULTS)
        print('Google Directions API Error: ${data['status']}');
        return 0.0;
      }
    } else {
      // Log failed HTTP request
      print('HTTP Request Failed with status: ${response.statusCode}');
      return 0.0;
    }
  } catch (e) {
    // Log network or parsing errors
    print('An error occurred during distance calculation: $e');
    return 0.0;
  }
}
