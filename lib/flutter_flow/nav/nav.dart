import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier, [Widget? entryPage]) =>
    GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? entryPage ?? RidecomfirmationWidget()
          : HomeWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? entryPage ?? RidecomfirmationWidget()
              : HomeWidget(),
        ),
        FFRoute(
          name: ServicesWidget.routeName,
          path: ServicesWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ServicesWidget(),
        ),
        FFRoute(
          name: NotificationWidget.routeName,
          path: NotificationWidget.routePath,
          requireAuth: true,
          builder: (context, params) => NotificationWidget(),
        ),
        FFRoute(
          name: ServicependingWidget.routeName,
          path: ServicependingWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ServicependingWidget(),
        ),
        FFRoute(
          name: RidecomfirmationWidget.routeName,
          path: RidecomfirmationWidget.routePath,
          requireAuth: true,
          builder: (context, params) => RidecomfirmationWidget(
            get: params.getParam(
              'get',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['rides'],
            ),
          ),
        ),
        FFRoute(
          name: RidetrackingWidget.routeName,
          path: RidetrackingWidget.routePath,
          requireAuth: true,
          builder: (context, params) => RidetrackingWidget(),
        ),
        FFRoute(
          name: AITravelassistantWidget.routeName,
          path: AITravelassistantWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AITravelassistantWidget(),
        ),
        FFRoute(
          name: PrivacypolicyandtermsandconditionsWidget.routeName,
          path: PrivacypolicyandtermsandconditionsWidget.routePath,
          requireAuth: true,
          builder: (context, params) =>
              PrivacypolicyandtermsandconditionsWidget(),
        ),
        FFRoute(
          name: TermsandconditionsWidget.routeName,
          path: TermsandconditionsWidget.routePath,
          builder: (context, params) => TermsandconditionsWidget(),
        ),
        FFRoute(
          name: SignInWidget.routeName,
          path: SignInWidget.routePath,
          builder: (context, params) => SignInWidget(),
        ),
        FFRoute(
          name: SignUpWidget.routeName,
          path: SignUpWidget.routePath,
          builder: (context, params) => SignUpWidget(),
        ),
        FFRoute(
          name: HomeWidget.routeName,
          path: HomeWidget.routePath,
          builder: (context, params) => HomeWidget(),
        ),
        FFRoute(
          name: DriverEarningsWidget.routeName,
          path: DriverEarningsWidget.routePath,
          builder: (context, params) => DriverEarningsWidget(),
        ),
        FFRoute(
          name: DriverProfileWidget.routeName,
          path: DriverProfileWidget.routePath,
          builder: (context, params) => DriverProfileWidget(),
        ),
        FFRoute(
          name: DriversignupWidget.routeName,
          path: DriversignupWidget.routePath,
          builder: (context, params) => DriversignupWidget(
            photo: params.getParam(
              'photo',
              ParamType.FFUploadedFile,
            ),
          ),
        ),
        FFRoute(
          name: DriversigninWidget.routeName,
          path: DriversigninWidget.routePath,
          builder: (context, params) => DriversigninWidget(),
        ),
        FFRoute(
          name: DriverprivacypolicyWidget.routeName,
          path: DriverprivacypolicyWidget.routePath,
          builder: (context, params) => DriverprivacypolicyWidget(),
        ),
        FFRoute(
          name: DrivertermsandconditionsWidget.routeName,
          path: DrivertermsandconditionsWidget.routePath,
          builder: (context, params) => DrivertermsandconditionsWidget(),
        ),
        FFRoute(
          name: IncomingriderequestWidget.routeName,
          path: IncomingriderequestWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'order': getDoc(['rides'], RidesRecord.fromSnapshot),
          },
          builder: (context, params) => IncomingriderequestWidget(
            order: params.getParam(
              'order',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ActiverideWidget.routeName,
          path: ActiverideWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ActiverideWidget(),
        ),
        FFRoute(
          name: QuotespageWidget.routeName,
          path: QuotespageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => QuotespageWidget(),
        ),
        FFRoute(
          name: DrivererrorpageWidget.routeName,
          path: DrivererrorpageWidget.routePath,
          builder: (context, params) => DrivererrorpageWidget(),
        ),
        FFRoute(
          name: ErrorpageWidget.routeName,
          path: ErrorpageWidget.routePath,
          builder: (context, params) => ErrorpageWidget(),
        ),
        FFRoute(
          name: CourierservicespageWidget.routeName,
          path: CourierservicespageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CourierservicespageWidget(),
        ),
        FFRoute(
          name: SchooltripbookingpageWidget.routeName,
          path: SchooltripbookingpageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => SchooltripbookingpageWidget(),
        ),
        FFRoute(
          name: IndividualtourspageWidget.routeName,
          path: IndividualtourspageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => IndividualtourspageWidget(),
        ),
        FFRoute(
          name: CarhiringpageWidget.routeName,
          path: CarhiringpageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CarhiringpageWidget(),
        ),
        FFRoute(
          name: LiveridetrackerWidget.routeName,
          path: LiveridetrackerWidget.routePath,
          builder: (context, params) => LiveridetrackerWidget(),
        ),
        FFRoute(
          name: AdminsettingspageWidget.routeName,
          path: AdminsettingspageWidget.routePath,
          builder: (context, params) => AdminsettingspageWidget(),
        ),
        FFRoute(
          name: AdminprofilepageWidget.routeName,
          path: AdminprofilepageWidget.routePath,
          builder: (context, params) => AdminprofilepageWidget(),
        ),
        FFRoute(
          name: AdminnotificationpageWidget.routeName,
          path: AdminnotificationpageWidget.routePath,
          builder: (context, params) => AdminnotificationpageWidget(),
        ),
        FFRoute(
          name: AdminloginpageWidget.routeName,
          path: AdminloginpageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminloginpageWidget(),
        ),
        FFRoute(
          name: UserreportspageWidget.routeName,
          path: UserreportspageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => UserreportspageWidget(),
        ),
        FFRoute(
          name: ReportdetailspageWidget.routeName,
          path: ReportdetailspageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ReportdetailspageWidget(),
        ),
        FFRoute(
          name: UserprofilepageWidget.routeName,
          path: UserprofilepageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => UserprofilepageWidget(),
        ),
        FFRoute(
          name: DrivermanagepageWidget.routeName,
          path: DrivermanagepageWidget.routePath,
          builder: (context, params) => DrivermanagepageWidget(),
        ),
        FFRoute(
          name: DrivereditpageWidget.routeName,
          path: DrivereditpageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => DrivereditpageWidget(),
        ),
        FFRoute(
          name: DriveractiveridepageWidget.routeName,
          path: DriveractiveridepageWidget.routePath,
          builder: (context, params) => DriveractiveridepageWidget(),
        ),
        FFRoute(
          name: HomePageWidget.routeName,
          path: HomePageWidget.routePath,
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: RideBookingPageWidget.routeName,
          path: RideBookingPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => RideBookingPageWidget(
            standardVehicleType: params.getParam(
              'standardVehicleType',
              ParamType.String,
            ),
            premiumVehicleType: params.getParam(
              'premiumVehicleType',
              ParamType.String,
            ),
            vipVehicleType: params.getParam(
              'vipVehicleType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: FlightBookingPageWidget.routeName,
          path: FlightBookingPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => FlightBookingPageWidget(),
        ),
        FFRoute(
          name: AdminflightmanagementpageWidget.routeName,
          path: AdminflightmanagementpageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminflightmanagementpageWidget(),
        ),
        FFRoute(
          name: ProcessrequestpageWidget.routeName,
          path: ProcessrequestpageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ProcessrequestpageWidget(),
        ),
        FFRoute(
          name: UsersettingsandsupportpageWidget.routeName,
          path: UsersettingsandsupportpageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => UsersettingsandsupportpageWidget(),
        ),
        FFRoute(
          name: UserPrivacyandsecuritypageWidget.routeName,
          path: UserPrivacyandsecuritypageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => UserPrivacyandsecuritypageWidget(),
        ),
        FFRoute(
          name: UserlanguagepreferencepageWidget.routeName,
          path: UserlanguagepreferencepageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => UserlanguagepreferencepageWidget(),
        ),
        FFRoute(
          name: UserstorageanddatapageWidget.routeName,
          path: UserstorageanddatapageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => UserstorageanddatapageWidget(),
        ),
        FFRoute(
          name: UserhelpcenterpageWidget.routeName,
          path: UserhelpcenterpageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => UserhelpcenterpageWidget(),
        ),
        FFRoute(
          name: UsercontactsupportpageWidget.routeName,
          path: UsercontactsupportpageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => UsercontactsupportpageWidget(),
        ),
        FFRoute(
          name: UserFAQsPageWidget.routeName,
          path: UserFAQsPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => UserFAQsPageWidget(),
        ),
        FFRoute(
          name: RateourapppageWidget.routeName,
          path: RateourapppageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => RateourapppageWidget(),
        ),
        FFRoute(
          name: UsertermsofserviceWidget.routeName,
          path: UsertermsofserviceWidget.routePath,
          requireAuth: true,
          builder: (context, params) => UsertermsofserviceWidget(),
        ),
        FFRoute(
          name: UserdatapolicyWidget.routeName,
          path: UserdatapolicyWidget.routePath,
          requireAuth: true,
          builder: (context, params) => UserdatapolicyWidget(),
        ),
        FFRoute(
          name: UserchangepasswordpageWidget.routeName,
          path: UserchangepasswordpageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => UserchangepasswordpageWidget(),
        ),
        FFRoute(
          name: DriveradminloginpageWidget.routeName,
          path: DriveradminloginpageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => DriveradminloginpageWidget(),
        ),
        FFRoute(
          name: EditdriverpageWidget.routeName,
          path: EditdriverpageWidget.routePath,
          builder: (context, params) => EditdriverpageWidget(),
        ),
        FFRoute(
          name: AdddriverpageWidget.routeName,
          path: AdddriverpageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdddriverpageWidget(
            imageupload: params.getParam(
              'imageupload',
              ParamType.FFUploadedFile,
            ),
            driversigninKey: params.getParam(
              'driversigninKey',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: DriverNotificationPageWidget.routeName,
          path: DriverNotificationPageWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'comfirm': getDoc(['rides'], RidesRecord.fromSnapshot),
          },
          builder: (context, params) => DriverNotificationPageWidget(
            comfirm: params.getParam(
              'comfirm',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: DrivernotificationsettingspageWidget.routeName,
          path: DrivernotificationsettingspageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => DrivernotificationsettingspageWidget(),
        ),
        FFRoute(
          name: MainpageWidget.routeName,
          path: MainpageWidget.routePath,
          builder: (context, params) => MainpageWidget(),
        ),
        FFRoute(
          name: MainsettingspageWidget.routeName,
          path: MainsettingspageWidget.routePath,
          builder: (context, params) => MainsettingspageWidget(),
        ),
        FFRoute(
          name: MainhelppageWidget.routeName,
          path: MainhelppageWidget.routePath,
          builder: (context, params) => MainhelppageWidget(),
        ),
        FFRoute(
          name: MainprivacypolicypageWidget.routeName,
          path: MainprivacypolicypageWidget.routePath,
          builder: (context, params) => MainprivacypolicypageWidget(),
        ),
        FFRoute(
          name: AdminflightbookingpageWidget.routeName,
          path: AdminflightbookingpageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminflightbookingpageWidget(),
        ),
        FFRoute(
          name: AddflightpageWidget.routeName,
          path: AddflightpageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AddflightpageWidget(),
        ),
        FFRoute(
          name: AdmincourierbookingpageWidget.routeName,
          path: AdmincourierbookingpageWidget.routePath,
          builder: (context, params) => AdmincourierbookingpageWidget(),
        ),
        FFRoute(
          name: AdminhotelbookingpageWidget.routeName,
          path: AdminhotelbookingpageWidget.routePath,
          builder: (context, params) => AdminhotelbookingpageWidget(),
        ),
        FFRoute(
          name: AdmintourbookingpageWidget.routeName,
          path: AdmintourbookingpageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdmintourbookingpageWidget(),
        ),
        FFRoute(
          name: AdminaddhotelpageWidget.routeName,
          path: AdminaddhotelpageWidget.routePath,
          builder: (context, params) => AdminaddhotelpageWidget(),
        ),
        FFRoute(
          name: AdminaddtourplacepageWidget.routeName,
          path: AdminaddtourplacepageWidget.routePath,
          builder: (context, params) => AdminaddtourplacepageWidget(),
        ),
        FFRoute(
          name: AdminaddhirecarpageWidget.routeName,
          path: AdminaddhirecarpageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminaddhirecarpageWidget(),
        ),
        FFRoute(
          name: UserfindyourcarpageWidget.routeName,
          path: UserfindyourcarpageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => UserfindyourcarpageWidget(),
        ),
        FFRoute(
          name: UseravailablefightspageWidget.routeName,
          path: UseravailablefightspageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => UseravailablefightspageWidget(),
        ),
        FFRoute(
          name: AvailablehotelpageWidget.routeName,
          path: AvailablehotelpageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AvailablehotelpageWidget(),
        ),
        FFRoute(
          name: UseravailabletourplacespageWidget.routeName,
          path: UseravailabletourplacespageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => UseravailabletourplacespageWidget(),
        ),
        FFRoute(
          name: AdminservicerequestpageWidget.routeName,
          path: AdminservicerequestpageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminservicerequestpageWidget(),
        ),
        FFRoute(
          name: AdmineditflightpageWidget.routeName,
          path: AdmineditflightpageWidget.routePath,
          builder: (context, params) => AdmineditflightpageWidget(),
        ),
        FFRoute(
          name: AdminmanagetourspageWidget.routeName,
          path: AdminmanagetourspageWidget.routePath,
          builder: (context, params) => AdminmanagetourspageWidget(),
        ),
        FFRoute(
          name: ManagecarspagesWidget.routeName,
          path: ManagecarspagesWidget.routePath,
          builder: (context, params) => ManagecarspagesWidget(),
        ),
        FFRoute(
          name: EditCarspageWidget.routeName,
          path: EditCarspageWidget.routePath,
          builder: (context, params) => EditCarspageWidget(),
        ),
        FFRoute(
          name: EdithoteldetailspageWidget.routeName,
          path: EdithoteldetailspageWidget.routePath,
          builder: (context, params) => EdithoteldetailspageWidget(),
        ),
        FFRoute(
          name: ManageHotelspageWidget.routeName,
          path: ManageHotelspageWidget.routePath,
          builder: (context, params) => ManageHotelspageWidget(),
        ),
        FFRoute(
          name: EdittourplacepageWidget.routeName,
          path: EdittourplacepageWidget.routePath,
          builder: (context, params) => EdittourplacepageWidget(),
        ),
        FFRoute(
          name: LiveRidesDashboardWidget.routeName,
          path: LiveRidesDashboardWidget.routePath,
          builder: (context, params) => LiveRidesDashboardWidget(),
        ),
        FFRoute(
          name: BookHotelPageWidget.routeName,
          path: BookHotelPageWidget.routePath,
          builder: (context, params) => BookHotelPageWidget(),
        ),
        FFRoute(
          name: AdminDashBoardOverviewpageWidget.routeName,
          path: AdminDashBoardOverviewpageWidget.routePath,
          builder: (context, params) => AdminDashBoardOverviewpageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/home';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/FLATS_Logo_.png',
                    fit: BoxFit.cover,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
