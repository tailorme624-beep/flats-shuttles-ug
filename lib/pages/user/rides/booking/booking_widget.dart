import 'package:flutter/material.dart';
// ... other imports ...
import 'package:intl/intl.dart'; // Add for number formatting

class _BookingWidgetState extends State<BookingWidget> {
  late BookingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  // --- Mock Data to simulate inputs until user selects location/address ---
  String mockPickupAddress = 'Your Current Location (Picked)';
  String mockDropoffAddress = 'Destination Address (Selected)';
  double mockDistanceKm = 12.5; // Example: 12.5 km trip
  // --------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingModel());

    // Initialize mock data in the model
    _model.vehicleType = 'standard';
    _model.pickupAddress = mockPickupAddress;
    _model.dropoffAddress = mockDropoffAddress;
    _model.distanceKm = mockDistanceKm;
    _model.paymentMethod = 'Cash'; // Default payment method

    // Calculate initial fare
    _model.estimatedFare = calculateEstimatedFare(
        _model.vehicleType, _model.distanceKm);

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Booking'});
    
    // ... rest of initState ...
  }

  // New function to update fare and state
  void updateVehicleType(String newType) {
    safeSetState(() {
      _model.vehicleType = newType;
      // 🚨 CRITICAL FIX: Recalculate fare on vehicle type change
      _model.estimatedFare = calculateEstimatedFare(
          _model.vehicleType, _model.distanceKm);
    });
  }
  
  // Placeholder for the fare calculation logic (as defined above)
  double calculateEstimatedFare(String vehicleType, double distanceKm) {
    const double baseStandard = 30000.0;
    const double basePremium = 40000.0;
    const double baseVip = 70000.0;
    const double ratePerKmOverage = 3500.0;
    const double freeDistanceKm = 5.0;

    double basePrice;
    switch (vehicleType.toLowerCase()) {
      case 'premium':
        basePrice = basePremium;
        break;
      case 'vip':
        basePrice = baseVip;
        break;
      case 'standard':
      default:
        basePrice = baseStandard;
    }

    double distanceOverage = (distanceKm > freeDistanceKm)
        ? (distanceKm - freeDistanceKm)
        : 0.0;
    double extraCharge = distanceOverage * ratePerKmOverage;

    return basePrice + extraCharge;
  }
  
  String formatUgx(double amount) {
    final formatter = NumberFormat('#,##0', 'en_US');
    return 'UGX ${formatter.format(amount.round())}';
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Booking',
      color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF5F5DC),
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: true,
            title: Text(
              FFLocalizations.of(context).getText(
                'n3wversz' /* Book a Ride */,
              ),
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    font: GoogleFonts.interTight(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                    ),
                    color: Color(0xFFF5F5DC),
                    fontSize: 20,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2,
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Section 1: Location Input (Simulated) ---
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5DC),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Color(0xFF556B2F),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '6el2lptr' /* Pickup & Destination */,
                              style: FlutterFlowTheme.of(context).titleMedium,
                            ),
                            // NOTE: Replaced FFButtonWidget with Text to simulate Text Field Output
                            // In real FF, this would be a TextField widget setting model.pickupAddress
                            Text(
                              'Pickup: ${_model.pickupAddress}',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Text(
                              'Dropoff: ${_model.dropoffAddress}',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            // DROP DOWN FOR PAYMENT METHOD (Added fix for missing dropdown)
                            // NOTE: You would typically use a FlutterFlow Dropdown widget here.
                            Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: DropdownButtonFormField<String>(
                                value: _model.paymentMethod.isNotEmpty ? _model.paymentMethod : null,
                                decoration: InputDecoration(
                                  labelText: 'Select Payment Method',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                items: ['Cash', 'Mobile Money', 'Card']
                                    .map((label) => DropdownMenuItem(
                                          child: Text(label),
                                          value: label,
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  safeSetState(() {
                                    _model.paymentMethod = value!;
                                  });
                                },
                              ),
                            ),
                          ].divide(SizedBox(height: 16)),
                        ),
                      ),
                    ),
                  ),
                  
                  // --- Section 2: Vehicle Type & Dynamic Pricing ---
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Color(0xFF556B2F),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'waf0b36x' /* Select Vehicle Type */,
                              style: FlutterFlowTheme.of(context).titleMedium,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Standard Vehicle
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      updateVehicleType('standard');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: _model.vehicleType == 'standard'
                                            ? Color(0xFFF5F5DC)
                                            : FlutterFlowTheme.of(context).alternate,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Color(0xFF556B2F), width: 2),
                                      ),
                                      child: Column(
                                        children: [
                                          Icon(Icons.directions_car, size: 32, color: FlutterFlowTheme.of(context).primary),
                                          Text('Standard', style: FlutterFlowTheme.of(context).bodyMedium),
                                          Text('UGX 30,000', style: FlutterFlowTheme.of(context).bodySmall),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // Premium Vehicle
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      updateVehicleType('premium');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: _model.vehicleType == 'premium'
                                            ? Color(0xFFF5F5DC)
                                            : FlutterFlowTheme.of(context).alternate,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Color(0xFF556B2F), width: 2),
                                      ),
                                      child: Column(
                                        children: [
                                          Icon(Icons.car_rental, size: 32, color: FlutterFlowTheme.of(context).primary),
                                          Text('Premium', style: FlutterFlowTheme.of(context).bodyMedium),
                                          Text('UGX 40,000', style: FlutterFlowTheme.of(context).bodySmall),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // VIP Vehicle
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      updateVehicleType('vip');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: _model.vehicleType == 'vip'
                                            ? Color(0xFFF5F5DC)
                                            : FlutterFlowTheme.of(context).alternate,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Color(0xFF556B2F), width: 2),
                                      ),
                                      child: Column(
                                        children: [
                                          FaIcon(FontAwesomeIcons.vimeoV, size: 32, color: FlutterFlowTheme.of(context).primary),
                                          Text('VIP', style: FlutterFlowTheme.of(context).bodyMedium),
                                          Text('UGX 70,000', style: FlutterFlowTheme.of(context).bodySmall),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 12)),
                            ),
                            // Dynamic Fare Calculation Display
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Text(
                                'Estimated Fare: ${formatUgx(_model.estimatedFare)}',
                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                  color: Color(0xFF942B2E),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Text(
                              'Base Fare + Extra Charge for distance > 5km',
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // --- Section 3: Trip Summary (Displaying Calculated Values) ---
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      // ... container decoration ...
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            // ... Trip Summary Header ...
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Vehicle Type:', style: FlutterFlowTheme.of(context).bodyMedium),
                                Text(_model.vehicleType.toUpperCase(), style: FlutterFlowTheme.of(context).bodyMedium),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Estimated Distance:', style: FlutterFlowTheme.of(context).bodyMedium),
                                Text('${_model.distanceKm.toStringAsFixed(1)} km', style: FlutterFlowTheme.of(context).bodyMedium),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Payment Method:', style: FlutterFlowTheme.of(context).bodyMedium),
                                Text(_model.paymentMethod, style: FlutterFlowTheme.of(context).bodyMedium),
                              ],
                            ),
                            Divider(thickness: 2, color: FlutterFlowTheme.of(context).primary),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Estimated Fare:', style: FlutterFlowTheme.of(context).titleMedium),
                                Text(
                                  formatUgx(_model.estimatedFare), // 🚨 CRITICAL FIX: Display calculated fare
                                  style: FlutterFlowTheme.of(context).titleMedium.override(color: Color(0xFF942B2E)),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(height: 8)),
                        ),
                      ),
                    ),
                  ),

                  // --- Action Button ---
                  Align(
                    alignment: AlignmentDirectional(0, 1),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: FFButtonWidget(
                        onPressed: () {
                          // TODO: Implement navigation/Firestore ride request action here
                          print('Requesting ride with fare: ${_model.estimatedFare}');
                        },
                        text: FFLocalizations.of(context).getText(
                          'ee7hitse' /* Confirm & Request Ride */,
                        ),
                        // ... button options ...
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 24))
                    .addToStart(SizedBox(height: 16))
                    .addToEnd(SizedBox(height: 32)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
