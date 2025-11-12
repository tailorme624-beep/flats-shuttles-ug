// ride_booking_screen.dart - Single file for FlutterFlow Custom Widget import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart'; // Add 'intl' package to your pubspec.yaml for number formatting

// --- 1. DATA MODELS & ENUMS (TypeScript Interface Equivalents) ---

enum RideType {
  standard,
  premium,
  van,
}

// Helper for location data
class LocationData {
  final String address;
  final double? latitude;
  final double? longitude;

  const LocationData({
    required this.address,
    this.latitude,
    this.longitude,
  });

  LocationData copyWith({
    String? address,
    double? latitude,
    double? longitude,
  }) {
    return LocationData(
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}

// Equivalent of User
class User {
  final String? uid;
  final String fullName;
  final String email;
  final String? contact;

  const User({
    this.uid,
    required this.fullName,
    required this.email,
    this.contact,
  });
}

// Equivalent of Driver
class Driver {
  final String name;
  final String rating;
  final String vehicleModel;
  final String licensePlate;
  final String imageUrl;

  const Driver({
    required this.name,
    required this.rating,
    required this.vehicleModel,
    required this.licensePlate,
    required this.imageUrl,
  });
}

// Equivalent of GroundingChunk
class GroundingChunk {
  final String? title;
  final String? uri;

  const GroundingChunk({this.title, this.uri});
}

// Equivalent of BookingDetails (the main state object)
class BookingDetails {
  final LocationData pickup;
  final LocationData dropoff;
  final RideType rideType;
  final double distance; // in km
  final double estimatedFare;
  final String estimatedArrivalTime;
  final String clientFullName;
  final String clientEmail;
  final String clientContact;
  final int passengers;
  final Driver? driver;
  final String? originatingServiceTitle;

  const BookingDetails({
    required this.pickup,
    required this.dropoff,
    this.rideType = RideType.standard,
    this.distance = 0.0,
    this.estimatedFare = 0.0,
    this.estimatedArrivalTime = "5-10 min",
    this.clientFullName = '',
    this.clientEmail = '',
    this.clientContact = '',
    this.passengers = 1,
    this.driver,
    this.originatingServiceTitle,
  });

  BookingDetails copyWith({
    LocationData? pickup,
    LocationData? dropoff,
    RideType? rideType,
    double? distance,
    double? estimatedFare,
    String? estimatedArrivalTime,
    String? clientFullName,
    String? clientEmail,
    String? clientContact,
    int? passengers,
    Driver? driver,
    String? originatingServiceTitle,
  }) {
    return BookingDetails(
      pickup: pickup ?? this.pickup,
      dropoff: dropoff ?? this.dropoff,
      rideType: rideType ?? this.rideType,
      distance: distance ?? this.distance,
      estimatedFare: estimatedFare ?? this.estimatedFare,
      estimatedArrivalTime: estimatedArrivalTime ?? this.estimatedArrivalTime,
      clientFullName: clientFullName ?? this.clientFullName,
      clientEmail: clientEmail ?? this.clientEmail,
      clientContact: clientContact ?? this.clientContact,
      passengers: passengers ?? this.passengers,
      driver: driver ?? this.driver,
      originatingServiceTitle:
          originatingServiceTitle ?? this.originatingServiceTitle,
    );
  }
}

class RideOption {
  final RideType id;
  final String name;
  // In FlutterFlow, you might use a local asset or built-in icon
  final IconData icon;

  const RideOption({required this.id, required this.name, required this.icon});
}

const List<RideOption> RIDE_OPTIONS = [
  RideOption(
      id: RideType.standard, name: 'Standard', icon: Icons.directions_car),
  RideOption(id: RideType.premium, name: 'Premium', icon: Icons.star),
  RideOption(id: RideType.van, name: 'Van/SUV', icon: Icons.airport_shuttle),
];

// --- 2. SERVICE STUBS (Logic Equivalents) ---

// Placeholder for fareService.calculateFare
double calculateFare(RideType type, double distance) {
  double baseRate = 5000; // UGX Base Rate
  double ratePerKm = type == RideType.premium ? 1500 : 1000;

  return baseRate + (ratePerKm * distance);
}

// Placeholder for geminiService.getEstimatedDistanceAndRoute
class DistanceResult {
  final double? distance;
  final String? routeSummary;
  final String? error;

  DistanceResult({this.distance, this.routeSummary, this.error});
}

Future<DistanceResult> getEstimatedDistanceAndRoute(
    String pickup, String dropoff) async {
  await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

  if (pickup.isEmpty || dropoff.isEmpty) {
    return DistanceResult(error: "Addresses are required for estimation.");
  }

  // Mock distance calculation
  final double mockDistance = (pickup.length + dropoff.length).toDouble() * 0.4;

  return DistanceResult(
    distance: mockDistance > 2 ? mockDistance : 5.5,
    routeSummary: "Route optimized for time using secondary roads.",
  );
}

// Placeholder for geminiService.getTripSuggestions
class SuggestionResult {
  final String suggestionText;
  final List<GroundingChunk>? sources;

  SuggestionResult({required this.suggestionText, this.sources});
}

Future<SuggestionResult> getTripSuggestions(String dropoffAddress) async {
  await Future.delayed(const Duration(milliseconds: 800));

  String suggestion =
      "Your destination is a vibrant area with many cafes. Consider trying 'The Corner Bistro' for lunch.";
  if (dropoffAddress.toLowerCase().contains('airport')) {
    suggestion =
        "Warning: Check-in times are currently busy. Allow an extra hour for delays.";
  }

  return SuggestionResult(
    suggestionText: suggestion,
    sources: [
      const GroundingChunk(title: "Travel Guide", uri: "https://travel.com"),
    ],
  );
}

// --- 3. WIDGET CLASS (React Component Equivalent) ---

class RideBookingScreen extends StatefulWidget {
  // Props converted to final fields
  final BookingDetails initialBookingDetails;
  final void Function(BookingDetails updatedBookingDetails) onConfirmBooking;
  final VoidCallback onBack;
  final User? currentUser;

  // Custom FlutterFlow properties can be added here
  final Color primaryBrandColor;
  final Color secondaryBrandColor;

  const RideBookingScreen({
    super.key,
    required this.initialBookingDetails,
    required this.onConfirmBooking,
    required this.onBack,
    this.currentUser,
    this.primaryBrandColor = const Color(0xFFC2185B), // Example primary color
    this.secondaryBrandColor = Colors.purpleAccent, // Example secondary color
  });

  @override
  State<RideBookingScreen> createState() => _RideBookingScreenState();
}

// --- 4. STATE CLASS (React Hooks/State Logic Equivalent) ---

class _RideBookingScreenState extends State<RideBookingScreen> {
  // State variables (equivalent of useState)
  late BookingDetails _bookingDetails;

  String? _tripSuggestion;
  List<GroundingChunk>? _suggestionSources;
  bool _isLoadingGeminiSuggestion = false;

  bool _isEstimatingDistance = false;
  String? _routeSummary;
  String? _estimationError;
  late bool _distanceManuallySet;

  // Focus nodes for input fields (optional but good practice)
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _dropoffController = TextEditingController();
  final TextEditingController _distanceController = TextEditingController();
  // ... controllers for other fields ...

  @override
  void initState() {
    super.initState();
    _bookingDetails = widget.initialBookingDetails;
    _distanceManuallySet = widget.initialBookingDetails.distance > 0;

    // Set initial controller values
    _pickupController.text = _bookingDetails.pickup.address;
    _dropoffController.text = _bookingDetails.dropoff.address;
    _distanceController.text = _bookingDetails.distance > 0
        ? _bookingDetails.distance.toStringAsFixed(1)
        : "0";

    // Pre-fill client details from current user
    if (widget.currentUser != null) {
      _bookingDetails = _bookingDetails.copyWith(
        clientFullName: _bookingDetails.clientFullName.isNotEmpty
            ? _bookingDetails.clientFullName
            : widget.currentUser!.fullName,
        clientEmail: _bookingDetails.clientEmail.isNotEmpty
            ? _bookingDetails.clientEmail
            : widget.currentUser!.email,
        clientContact: _bookingDetails.clientContact.isNotEmpty
            ? _bookingDetails.clientContact
            : widget.currentUser!.contact,
      );
    }

    // Initial async calls
    if (_bookingDetails.dropoff.address.trim().isNotEmpty) {
      _fetchGeminiTripSuggestion();
    }
    _attemptDistanceEstimation();
  }

  @override
  void dispose() {
    // Dispose controllers to free up memory
    _pickupController.dispose();
    _dropoffController.dispose();
    _distanceController.dispose();
    super.dispose();
  }

  // Equivalent of handleBookingDetailChange (combines change logic and setState)
  void _handleBookingDetailChange(String name, dynamic value) {
    setState(() {
      BookingDetails newDetails = _bookingDetails;
      bool shouldCheckDistance = false;

      // 1. Update the booking details based on the field name
      if (name == "pickupAddress") {
        newDetails = newDetails.copyWith(
            pickup: newDetails.pickup.copyWith(address: value));
        _distanceManuallySet = false;
        _routeSummary = null;
        _estimationError = null;
        shouldCheckDistance = true;
      } else if (name == "dropoffAddress") {
        newDetails = newDetails.copyWith(
            dropoff: newDetails.dropoff.copyWith(address: value));
        _distanceManuallySet = false;
        _routeSummary = null;
        _estimationError = null;
        shouldCheckDistance = true;
        _fetchGeminiTripSuggestion();
      } else if (name == "passengers") {
        newDetails = newDetails.copyWith(passengers: int.tryParse(value) ?? 1);
      } else if (name == "rideType") {
        newDetails = newDetails.copyWith(rideType: value as RideType);
        shouldCheckDistance = true;
      } else if (name == "distance") {
        final double numValue = double.tryParse(value) ?? 0.0;
        newDetails =
            newDetails.copyWith(distance: numValue >= 0 ? numValue : 0);
        _distanceManuallySet = true;
        _routeSummary = null;
        _estimationError = null;
        shouldCheckDistance = true;
      } else if (name == "clientFullName") {
        newDetails = newDetails.copyWith(clientFullName: value);
      } else if (name == "clientEmail") {
        newDetails = newDetails.copyWith(clientEmail: value);
      } else if (name == "clientContact") {
        newDetails = newDetails.copyWith(clientContact: value);
      }

      // 2. Recalculate fare
      if (shouldCheckDistance && newDetails.distance > 0) {
        newDetails = newDetails.copyWith(
            estimatedFare:
                calculateFare(newDetails.rideType, newDetails.distance));
      } else if (shouldCheckDistance && newDetails.distance <= 0) {
        newDetails = newDetails.copyWith(estimatedFare: 0.0);
      }

      _bookingDetails = newDetails;

      // 3. Trigger distance estimation (The useEffect equivalent)
      if (shouldCheckDistance) {
        _attemptDistanceEstimation();
      }
    });
  }

  // Equivalent of attemptDistanceEstimation (useCallback logic)
  Future<void> _attemptDistanceEstimation() async {
    if (_bookingDetails.pickup.address.trim().length > 2 &&
        _bookingDetails.dropoff.address.trim().length > 2 &&
        !_distanceManuallySet) {
      if (_isEstimatingDistance) return;

      setState(() {
        _isEstimatingDistance = true;
        _routeSummary = null;
        _estimationError = null;
      });

      await Future.delayed(const Duration(milliseconds: 1000));

      final result = await getEstimatedDistanceAndRoute(
          _bookingDetails.pickup.address, _bookingDetails.dropoff.address);

      if (mounted) {
        setState(() {
          if (result.distance != null) {
            _bookingDetails = _bookingDetails.copyWith(
              distance: result.distance,
              estimatedFare:
                  calculateFare(_bookingDetails.rideType, result.distance!),
            );
            _distanceController.text = result.distance!.toStringAsFixed(1);
            _routeSummary =
                result.routeSummary ?? "Route summary not available.";
            _estimationError = null;
          } else {
            // Keep existing distance if AI fails, or set to 0
            _bookingDetails = _bookingDetails.copyWith(
              estimatedFare: _bookingDetails.distance > 0
                  ? calculateFare(
                      _bookingDetails.rideType, _bookingDetails.distance)
                  : 0,
            );
            _routeSummary = null;
            _estimationError = result.routeSummary ??
                result.error ??
                "Failed to estimate distance. Please enter manually.";
          }
          _isEstimatingDistance = false;
        });
      }
    } else if (_distanceManuallySet && _bookingDetails.distance > 0) {
      // Re-run fare calculation if distance is manually set
      setState(() {
        _bookingDetails = _bookingDetails.copyWith(
          estimatedFare:
              calculateFare(_bookingDetails.rideType, _bookingDetails.distance),
        );
      });
    } else if (_bookingDetails.distance <= 0) {
      setState(() {
        _bookingDetails = _bookingDetails.copyWith(estimatedFare: 0.0);
      });
    }
  }

  // Equivalent of fetchGeminiTripSuggestion
  Future<void> _fetchGeminiTripSuggestion() async {
    if (_bookingDetails.dropoff.address.trim().isEmpty) {
      setState(() {
        _tripSuggestion = null;
        _suggestionSources = null;
      });
      return;
    }

    setState(() {
      _isLoadingGeminiSuggestion = true;
    });

    try {
      final suggestionResult =
          await getTripSuggestions(_bookingDetails.dropoff.address);
      if (mounted) {
        setState(() {
          _tripSuggestion = suggestionResult.suggestionText;
          _suggestionSources = suggestionResult.sources;
        });
      }
    } catch (error) {
      if (mounted) {
        setState(() {
          _tripSuggestion = "Could not load trip suggestion at this time.";
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingGeminiSuggestion = false;
        });
      }
    }
  }

  // --- 5. WIDGET BUILDER (JSX Equivalent) ---
  @override
  Widget build(BuildContext context) {
    // NumberFormat is used for 'toLocaleString()' equivalent
    final String estimatedFareString = _bookingDetails.estimatedFare > 0
        ? NumberFormat('#,###').format(_bookingDetails.estimatedFare)
        : (_isEstimatingDistance ? 'Calculating...' : 'Enter details');

    // Use Theme colors as placeholders for Tailwind classes
    final Color primaryColor = widget.primaryBrandColor;
    final Color secondaryColor = widget.secondaryBrandColor;
    final Color textColor =
        Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black87;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildCard(
            title: "Confirm Your Ride",
            children: [
              // 1. Originating Service Banner
              if (_bookingDetails.originatingServiceTitle != null &&
                  _bookingDetails.originatingServiceTitle!.isNotEmpty)
                _buildInfoBanner(
                  icon: Icons.info_outline,
                  message:
                      "Booking initiated for service: **${_bookingDetails.originatingServiceTitle!}**. Please confirm details below.",
                  color: primaryColor,
                  backgroundColor: primaryColor.withOpacity(0.1),
                ),
              const SizedBox(height: 16),

              // 2. Ride Details
              _buildSectionTitle("Ride Details", primaryColor),
              _buildInnerCard(
                children: [
                  _buildInput(
                    label: "Pickup Location",
                    controller: _pickupController,
                    onChanged: (v) =>
                        _handleBookingDetailChange("pickupAddress", v),
                    icon: Icons.location_on,
                    iconColor: Colors.green,
                  ),
                  _buildInput(
                    label: "Drop-off Location",
                    controller: _dropoffController,
                    onChanged: (v) =>
                        _handleBookingDetailChange("dropoffAddress", v),
                    icon: Icons.location_on,
                    iconColor: Colors.red,
                  ),

                  // Estimation Status
                  if (_isEstimatingDistance)
                    _buildStatusIndicator(
                      icon: Icons.access_time,
                      text: "Estimating distance with Gemini AI...",
                      color: Colors.amber.shade700,
                      backgroundColor: Colors.amber.withOpacity(0.1),
                      isAnimating: true,
                    ),
                  if (!_isEstimatingDistance && _estimationError != null)
                    _buildStatusIndicator(
                      icon: Icons.info_outline,
                      text: _estimationError!,
                      color: Colors.red.shade700,
                      backgroundColor: Colors.red.withOpacity(0.1),
                    ),
                  if (!_isEstimatingDistance &&
                      _routeSummary != null &&
                      _estimationError == null)
                    _buildStatusIndicator(
                      icon: Icons.auto_awesome,
                      text: "AI Route: $_routeSummary",
                      color: Colors.deepPurple,
                      backgroundColor: Colors.deepPurple.withOpacity(0.1),
                      isItalic: true,
                    ),

                  Row(
                    children: [
                      Expanded(child: _buildRideTypeDropdown(secondaryColor)),
                      const SizedBox(width: 12),
                      Expanded(child: _buildDistanceInput(secondaryColor)),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Icon(Icons.access_time, color: primaryColor, size: 20),
                        const SizedBox(width: 8),
                        Text(
                            "Est. Arrival: ${_bookingDetails.estimatedArrivalTime}",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, color: textColor)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 3. Passenger & Contact Details
              _buildSectionTitle("Passenger & Contact Details", primaryColor),
              _buildInnerCard(
                children: [
                  _buildInput(
                    label: "Number of Passengers",
                    value: _bookingDetails.passengers.toString(),
                    onChanged: (v) =>
                        _handleBookingDetailChange('passengers', v),
                    icon: Icons.group,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  _buildInput(
                    label: "Full Name (for this booking)",
                    value: _bookingDetails.clientFullName,
                    onChanged: (v) =>
                        _handleBookingDetailChange('clientFullName', v),
                    icon: Icons.person,
                  ),
                  _buildInput(
                    label: "Email (for this booking)",
                    value: _bookingDetails.clientEmail,
                    onChanged: (v) =>
                        _handleBookingDetailChange('clientEmail', v),
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  _buildInput(
                    label: "Contact Phone (for this booking)",
                    value: _bookingDetails.clientContact,
                    onChanged: (v) =>
                        _handleBookingDetailChange('clientContact', v),
                    icon: Icons.phone,
                    keyboardType: TextInputType.phone,
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 4. Driver Details
              if (_bookingDetails.driver != null) ...[
                _buildSectionTitle("Driver Details", primaryColor),
                _buildDriverDetails(_bookingDetails.driver!),
                const SizedBox(height: 24),
              ],

              // 5. Fare Estimate
              _buildSectionTitle("Fare Estimate", primaryColor),
              _buildFareEstimate(
                  primaryColor, secondaryColor, estimatedFareString),
              const SizedBox(height: 24),

              // 6. Trip Insights by Gemini
              if (_tripSuggestion != null || _isLoadingGeminiSuggestion)
                _buildTripInsights(primaryColor),
              const SizedBox(height: 24),

              // 7. Action Buttons
              _buildActionButtons(primaryColor),
            ],
          ),
        ],
      ),
    );
  }

  // --- UI Helper Widgets (Equivalent of Custom Components) ---

  Widget _buildCard({required String title, required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildInnerCard({required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context)
            .scaffoldBackgroundColor, // Lighter background for inner card
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [BoxShadow(color: Colors.black45, blurRadius: 2)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            children.expand((w) => [w, const SizedBox(height: 12)]).toList()
              ..removeLast(),
      ),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: Text(
        title,
        style:
            TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
      ),
    );
  }

  Widget _buildInfoBanner(
      {required IconData icon,
      required String message,
      required Color color,
      required Color backgroundColor}) {
    // Basic Markdown support for bold text in Flutter
    final parts = message.split('**');

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 8),
          Flexible(
            child: Text.rich(
              TextSpan(
                children: parts.map((text) {
                  final isBold = parts.indexOf(text) % 2 != 0;
                  return TextSpan(
                    text: text,
                    style: TextStyle(
                      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                      fontSize: 14,
                      color: color.darken(0.1),
                    ),
                  );
                }).toList(),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusIndicator(
      {required IconData icon,
      required String text,
      required Color color,
      required Color backgroundColor,
      bool isItalic = false,
      bool isAnimating = false}) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 8.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            if (isAnimating)
              SizedBox(
                  width: 16,
                  height: 16,
                  child:
                      CircularProgressIndicator(strokeWidth: 2, color: color))
            else
              Icon(icon, color: color, size: 18),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                text,
                style: TextStyle(
                  color: color,
                  fontSize: 13,
                  fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildInput({
    required String label,
    TextEditingController? controller,
    String? value,
    required ValueChanged<String> onChanged,
    required IconData icon,
    Color? iconColor,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    String placeholder = '',
    bool disabled = false,
    bool isItalic = false,
  }) {
    // If value is provided but no controller, create a temporary one for display
    final effectiveController =
        controller ?? TextEditingController(text: value);
    if (value != null && controller == null) {
      effectiveController.text = value; // Update if the state changes the value
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 13, fontWeight: FontWeight.w500, color: Colors.grey)),
        const SizedBox(height: 4),
        TextField(
          controller: effectiveController,
          onChanged: (v) {
            // Only update via onChanged if we aren't using an external controller that handles its own updates
            if (controller == null) {
              onChanged(v);
            }
          },
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          enabled: !disabled,
          style: TextStyle(
              fontStyle: isItalic ? FontStyle.italic : FontStyle.normal),
          decoration: InputDecoration(
            hintText: placeholder,
            prefixIcon: Icon(icon, color: iconColor),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            filled: disabled,
            fillColor: disabled ? Colors.grey.shade100 : Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildRideTypeDropdown(Color secondaryColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Ride Type",
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w500, color: Colors.grey)),
        const SizedBox(height: 4),
        DropdownButtonFormField<RideType>(
          value: _bookingDetails.rideType,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            // Use primary color for focus (like Tailwind ring-brand-primary)
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: secondaryColor, width: 2)),
          ),
          items: RIDE_OPTIONS.map((opt) {
            return DropdownMenuItem(
              value: opt.id,
              child: Row(
                children: [
                  Icon(opt.icon, size: 20),
                  const SizedBox(width: 8),
                  Text(opt.name),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              _handleBookingDetailChange('rideType', value);
            }
          },
        ),
      ],
    );
  }

  Widget _buildDistanceInput(Color secondaryColor) {
    final bool isEstimated = _bookingDetails.distance > 0 &&
        _routeSummary != null &&
        !_distanceManuallySet &&
        !_isEstimatingDistance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Distance (km)",
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w500, color: Colors.grey)),
        const SizedBox(height: 4),
        _buildInput(
          label: '',
          controller: _distanceController,
          onChanged: (v) => _handleBookingDetailChange('distance', v),
          icon: Icons.swap_horiz,
          placeholder: "Enter distance or let AI estimate",
          disabled: _isEstimatingDistance,
          isItalic: isEstimated,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          // Allows digits and one decimal point
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))
          ],
        ),
        if (isEstimated)
          const Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Text("Distance estimated by AI.",
                style: TextStyle(fontSize: 11, color: Colors.grey)),
          ),
      ],
    );
  }

  Widget _buildDriverDetails(Driver driver) {
    return _buildInnerCard(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(driver.imageUrl),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(driver.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600)),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(driver.rating, style: const TextStyle(fontSize: 14)),
                  ],
                ),
                Text("${driver.vehicleModel} (${driver.licensePlate})",
                    style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFareEstimate(
      Color primaryColor, Color secondaryColor, String estimatedFareString) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: secondaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            "UGX $estimatedFareString",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: primaryColor),
          ),
          const SizedBox(height: 4),
          Text(
            _bookingDetails.pickup.address.isNotEmpty &&
                    _bookingDetails.dropoff.address.isNotEmpty &&
                    _bookingDetails.distance > 0
                ? "This is an estimate. Actual fare may vary."
                : "Enter pickup, dropoff & distance for fare estimate.",
            style: const TextStyle(fontSize: 12, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTripInsights(Color primaryColor) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.auto_awesome, color: primaryColor),
              const SizedBox(width: 8),
              Text("Trip Insights by Gemini",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primaryColor)),
            ],
          ),
          const SizedBox(height: 8),
          if (_isLoadingGeminiSuggestion)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.auto_awesome,
                        color: primaryColor.withOpacity(0.7)),
                    const SizedBox(width: 8),
                    Text("Loading trip suggestion...",
                        style: TextStyle(color: Colors.grey.shade600)),
                  ],
                ),
              ),
            )
          else if (_tripSuggestion != null) ...[
            Text(_tripSuggestion!,
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: Colors.grey.shade700)),
            if (_suggestionSources != null && _suggestionSources!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Sources:",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    ..._suggestionSources!
                        .where((s) => s.uri != null)
                        .map((source) => Text(
                              source.title ?? source.uri!,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue.shade700,
                                  decoration: TextDecoration.underline),
                            ))
                        .toList(),
                  ],
                ),
              )
          ],
        ],
      ),
    );
  }

  Widget _buildActionButtons(Color primaryColor) {
    final bool isConfirmDisabled = _bookingDetails.pickup.address.isEmpty ||
        _bookingDetails.dropoff.address.isEmpty ||
        _bookingDetails.distance <= 0 ||
        _isEstimatingDistance;

    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: widget.onBack,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade300,
              foregroundColor: Colors.black87,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text("Back",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: isConfirmDisabled ? null : _onConfirm,
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              disabledBackgroundColor: primaryColor.withOpacity(0.5),
            ),
            child: _isEstimatingDistance
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                        color: Colors.white, strokeWidth: 2))
                : const Text("Confirm & Book Now",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ),
        ),
      ],
    );
  }

  // Final confirmation logic
  void _onConfirm() {
    if (_bookingDetails.pickup.address.isEmpty ||
        _bookingDetails.dropoff.address.isEmpty) {
      // In FlutterFlow, use FFAppState update or showSnackbar Action
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please enter both pickup and drop-off locations.")));
      return;
    }
    if (_bookingDetails.distance <= 0 && !_isEstimatingDistance) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              "Distance must be greater than 0. Please wait for AI estimation or enter manually.")));
      return;
    }
    if (_bookingDetails.clientFullName.isEmpty ||
        _bookingDetails.clientEmail.isEmpty ||
        _bookingDetails.clientContact.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              "Please ensure your contact details (Full Name, Email, Phone) are filled in.")));
      return;
    }

    // Final fare calculation before confirming
    final double finalFare =
        calculateFare(_bookingDetails.rideType, _bookingDetails.distance);
    widget.onConfirmBooking(_bookingDetails.copyWith(estimatedFare: finalFare));
  }
}

// Extension to simulate darken color functionality (for text in banners)
extension on Color {
  Color darken(double amount) {
    assert(amount >= 0 && amount <= 1);
    final int r = (red * (1.0 - amount)).round();
    final int g = (green * (1.0 - amount)).round();
    final int b = (blue * (1.0 - amount)).round();
    return Color.fromARGB(
        alpha, r.clamp(0, 255), g.clamp(0, 255), b.clamp(0, 255));
  }
}
