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
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/FLATS_Logo_.png',
            fit: BoxFit.cover,
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
  'services': ParameterData.none(),
  'notification': ParameterData.none(),
  'servicepending': ParameterData.none(),
  'ridecomfirmation': (data) async => ParameterData(
        allParams: {
          'get': getParameter<DocumentReference>(data, 'get'),
        },
      ),
  'ridetracking': ParameterData.none(),
  'AITravelassistant': ParameterData.none(),
  'privacypolicyandtermsandconditions': ParameterData.none(),
  'termsandconditions': ParameterData.none(),
  'SignIn': ParameterData.none(),
  'SignUp': ParameterData.none(),
  'HOME': ParameterData.none(),
  'DriverEarnings': ParameterData.none(),
  'DriverProfile': ParameterData.none(),
  'driversignup': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'driversignin': ParameterData.none(),
  'driverprivacypolicy': ParameterData.none(),
  'drivertermsandconditions': ParameterData.none(),
  'Incomingriderequest': (data) async => ParameterData(
        allParams: {
          'order': await getDocumentParameter<RidesRecord>(
              data, 'order', RidesRecord.fromSnapshot),
        },
      ),
  'activeride': ParameterData.none(),
  'quotespage': ParameterData.none(),
  'drivererrorpage': ParameterData.none(),
  'errorpage': ParameterData.none(),
  'courierservicespage': ParameterData.none(),
  'Hotelbookingpage': ParameterData.none(),
  'schooltripbookingpage': ParameterData.none(),
  'individualtourspage': ParameterData.none(),
  'carhiringpage': ParameterData.none(),
  'AdminDashboard': ParameterData.none(),
  'liveridetracker': ParameterData.none(),
  'adminsettingspage': ParameterData.none(),
  'adminprofilepage': ParameterData.none(),
  'adminnotificationpage': ParameterData.none(),
  'adminloginpage': ParameterData.none(),
  'userreportspage': ParameterData.none(),
  'reportdetailspage': ParameterData.none(),
  'userprofilepage': ParameterData.none(),
  'drivermanagepage': ParameterData.none(),
  'drivereditpage': ParameterData.none(),
  'driveractiveridepage': ParameterData.none(),
  'HomePage': ParameterData.none(),
  'RideBookingPage': (data) async => ParameterData(
        allParams: {
          'standardVehicleType':
              getParameter<String>(data, 'standardVehicleType'),
          'premiumVehicleType':
              getParameter<String>(data, 'premiumVehicleType'),
          'vipVehicleType': getParameter<String>(data, 'vipVehicleType'),
        },
      ),
  'FlightBookingPage': ParameterData.none(),
  'adminflightmanagementpage': ParameterData.none(),
  'processrequestpage': ParameterData.none(),
  'usersettingsandsupportpage': ParameterData.none(),
  'userPrivacyandsecuritypage': ParameterData.none(),
  'userlanguagepreferencepage': ParameterData.none(),
  'userstorageanddatapage': ParameterData.none(),
  'userhelpcenterpage': ParameterData.none(),
  'usercontactsupportpage': ParameterData.none(),
  'UserFAQsPage': ParameterData.none(),
  'Rateourapppage': ParameterData.none(),
  'usertermsofservice': ParameterData.none(),
  'userdatapolicy': ParameterData.none(),
  'userchangepasswordpage': ParameterData.none(),
  'driveradminloginpage': ParameterData.none(),
  'editdriverpage': ParameterData.none(),
  'adddriverpage': (data) async => ParameterData(
        allParams: {
          'driversigninKey':
              getParameter<DocumentReference>(data, 'driversigninKey'),
        },
      ),
  'driverNotificationPage': (data) async => ParameterData(
        allParams: {
          'comfirm': await getDocumentParameter<RidesRecord>(
              data, 'comfirm', RidesRecord.fromSnapshot),
        },
      ),
  'Drivernotificationsettingspage': ParameterData.none(),
  'Mainpage': ParameterData.none(),
  'mainsettingspage': ParameterData.none(),
  'mainhelppage': ParameterData.none(),
  'mainprivacypolicypage': ParameterData.none(),
  'adminflightbookingpage': ParameterData.none(),
  'addflightpage': ParameterData.none(),
  'admincourierbookingpage': ParameterData.none(),
  'adminhotelbookingpage': ParameterData.none(),
  'admintourbookingpage': ParameterData.none(),
  'adminaddhotelpage': ParameterData.none(),
  'adminaddtourplacepage': ParameterData.none(),
  'Adminaddhirecarpage': ParameterData.none(),
  'userfindyourcarpage': ParameterData.none(),
  'useravailablefightspage': ParameterData.none(),
  'availablehotelpage': ParameterData.none(),
  'useravailabletourplacespage': ParameterData.none(),
  'adminservicerequestpage': ParameterData.none(),
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
