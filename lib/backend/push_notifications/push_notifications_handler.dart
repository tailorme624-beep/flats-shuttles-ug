import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.white,
          child: Image.asset(
            'assets/images/Fauget.png',
            fit: BoxFit.fitWidth,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Services': ParameterData.none(),
  'Notification': ParameterData.none(),
  'PendingRequest': ParameterData.none(),
  'Comfirmation': (data) async => ParameterData(
        allParams: {
          'get': getParameter<DocumentReference>(data, 'get'),
        },
      ),
  'Tracking': ParameterData.none(),
  'AIAssistant': ParameterData.none(),
  'PrivacyPolicy': ParameterData.none(),
  'TermsAndConditions': ParameterData.none(),
  'SignIn': ParameterData.none(),
  'SignUp': ParameterData.none(),
  'Home': ParameterData.none(),
  'DriverProfile': ParameterData.none(),
  'DriverInformation': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'driverprivacypolicy': ParameterData.none(),
  'DriverTerms': ParameterData.none(),
  'IncomingRequest': (data) async => ParameterData(
        allParams: {
          'order': await getDocumentParameter<RidesRecord>(
              data, 'order', RidesRecord.fromSnapshot),
        },
      ),
  'ActiveRide': ParameterData.none(),
  'Quotes': ParameterData.none(),
  'DriverErrorPage': ParameterData.none(),
  'ErrorPage': ParameterData.none(),
  'CourierBooking': ParameterData.none(),
  'SchoolTripBooking': ParameterData.none(),
  'IndividualTours': ParameterData.none(),
  'CarHire': ParameterData.none(),
  'liveridetracker': ParameterData.none(),
  'AdminSetting': ParameterData.none(),
  'AdminProfile': ParameterData.none(),
  'AdminNotifications': ParameterData.none(),
  'AdminLogin': ParameterData.none(),
  'AdminReports': ParameterData.none(),
  'ReportDetails': ParameterData.none(),
  'MyProfile': ParameterData.none(),
  'AdminDrivers': ParameterData.none(),
  'UpdateDriverProfile': ParameterData.none(),
  'AcceptedRide': ParameterData.none(),
  'Booking': ParameterData.none(),
  'FlightBooking': ParameterData.none(),
  'AdminFlights': (data) async => ParameterData(
        allParams: {
          'airline': getParameter<String>(data, 'airline'),
        },
      ),
  'Settings': ParameterData.none(),
  'PrivacySecurity': ParameterData.none(),
  'LanguagePreferences': ParameterData.none(),
  'StorageAndData': ParameterData.none(),
  'HelpCenter': ParameterData.none(),
  'ContactSupport': ParameterData.none(),
  'FAQs': ParameterData.none(),
  'RateDriver': ParameterData.none(),
  'TermsOfService': ParameterData.none(),
  'Policies': ParameterData.none(),
  'ChangePassword': ParameterData.none(),
  'DriverLogin': ParameterData.none(),
  'UpdateDriver': ParameterData.none(),
  'AddDriver': ParameterData.none(),
  'DriverNotifications': (data) async => ParameterData(
        allParams: {
          'comfirm': await getDocumentParameter<RidesRecord>(
              data, 'comfirm', RidesRecord.fromSnapshot),
        },
      ),
  'DriverSettings': ParameterData.none(),
  'FlightBookingsAdmin': ParameterData.none(),
  'AddFlightAdmin': ParameterData.none(),
  'AdminCouriers': ParameterData.none(),
  'HotelBookingsAdmin': ParameterData.none(),
  'TourBookingAdmin': ParameterData.none(),
  'AddHotel': ParameterData.none(),
  'AddTour': ParameterData.none(),
  'AddVehicle': ParameterData.none(),
  'FindYourCar': ParameterData.none(),
  'AvailableFlights': ParameterData.none(),
  'availablehotelpage': ParameterData.none(),
  'AvailableTourPlaces': ParameterData.none(),
  'AdminRequests': ParameterData.none(),
  'UpdateFlight': ParameterData.none(),
  'AdminTours': ParameterData.none(),
  'AdminVehicles': ParameterData.none(),
  'UpdateVehicle': ParameterData.none(),
  'UpdateHotel': ParameterData.none(),
  'AdminHotels': ParameterData.none(),
  'UpdateTourAdmin': ParameterData.none(),
  'AdminRides': ParameterData.none(),
  'bookHotelPage': ParameterData.none(),
  'AdminDashboard': ParameterData.none(),
  'RideHistory': ParameterData.none(),
  'CourierPricing': ParameterData.none(),
  'AdminEditDriver': ParameterData.none(),
  'CourierTracking': ParameterData.none(),
  'AboutUs': ParameterData.none(),
  'DriverDashboard': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
