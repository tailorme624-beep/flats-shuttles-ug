import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/main.dart';
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

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : HomeWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : HomeWidget(),
        ),
        FFRoute(
          name: ServicesWidget.routeName,
          path: ServicesWidget.routePath,
          builder: (context, params) => ServicesWidget(),
        ),
        FFRoute(
          name: NotificationWidget.routeName,
          path: NotificationWidget.routePath,
          builder: (context, params) => NotificationWidget(),
        ),
        FFRoute(
          name: PendingRequestWidget.routeName,
          path: PendingRequestWidget.routePath,
          requireAuth: true,
          builder: (context, params) => PendingRequestWidget(),
        ),
        FFRoute(
          name: ComfirmationWidget.routeName,
          path: ComfirmationWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ComfirmationWidget(
            get: params.getParam(
              'get',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['rides'],
            ),
          ),
        ),
        FFRoute(
            name: TrackingWidget.routeName,
            path: TrackingWidget.routePath,
            requireAuth: true,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'Tracking')
                : NavBarPage(
                    initialPage: 'Tracking',
                    page: TrackingWidget(),
                  )),
        FFRoute(
          name: AIAssistantWidget.routeName,
          path: AIAssistantWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'AIAssistant')
              : AIAssistantWidget(),
        ),
        FFRoute(
          name: PrivacyPolicyWidget.routeName,
          path: PrivacyPolicyWidget.routePath,
          builder: (context, params) => PrivacyPolicyWidget(),
        ),
        FFRoute(
          name: TermsAndConditionsWidget.routeName,
          path: TermsAndConditionsWidget.routePath,
          builder: (context, params) => TermsAndConditionsWidget(),
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
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'Home')
                : NavBarPage(
                    initialPage: 'Home',
                    page: HomeWidget(
                      isFirstTine: params.getParam(
                        'isFirstTine',
                        ParamType.bool,
                      ),
                    ),
                  )),
        FFRoute(
          name: DriverProfileWidget.routeName,
          path: DriverProfileWidget.routePath,
          requireAuth: true,
          builder: (context, params) => DriverProfileWidget(),
        ),
        FFRoute(
          name: DriverInformationWidget.routeName,
          path: DriverInformationWidget.routePath,
          requireAuth: true,
          builder: (context, params) => DriverInformationWidget(
            photo: params.getParam(
              'photo',
              ParamType.FFUploadedFile,
            ),
          ),
        ),
        FFRoute(
          name: DriverPrivacyPolicyWidget.routeName,
          path: DriverPrivacyPolicyWidget.routePath,
          builder: (context, params) => DriverPrivacyPolicyWidget(),
        ),
        FFRoute(
          name: DriverTermsWidget.routeName,
          path: DriverTermsWidget.routePath,
          builder: (context, params) => DriverTermsWidget(),
        ),
        FFRoute(
          name: IncomingRequestWidget.routeName,
          path: IncomingRequestWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'order': getDoc(['rides'], RidesRecord.fromSnapshot),
          },
          builder: (context, params) => IncomingRequestWidget(
            order: params.getParam(
              'order',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: DriverActiveRideWidget.routeName,
          path: DriverActiveRideWidget.routePath,
          requireAuth: true,
          builder: (context, params) => DriverActiveRideWidget(),
        ),
        FFRoute(
          name: QuotesWidget.routeName,
          path: QuotesWidget.routePath,
          builder: (context, params) => QuotesWidget(),
        ),
        FFRoute(
          name: DriverErrorPageWidget.routeName,
          path: DriverErrorPageWidget.routePath,
          builder: (context, params) => DriverErrorPageWidget(),
        ),
        FFRoute(
          name: ErrorPageWidget.routeName,
          path: ErrorPageWidget.routePath,
          builder: (context, params) => ErrorPageWidget(),
        ),
        FFRoute(
          name: CourierBookingWidget.routeName,
          path: CourierBookingWidget.routePath,
          builder: (context, params) => CourierBookingWidget(),
        ),
        FFRoute(
          name: SchoolTripBookingWidget.routeName,
          path: SchoolTripBookingWidget.routePath,
          builder: (context, params) => SchoolTripBookingWidget(),
        ),
        FFRoute(
          name: IndividualToursWidget.routeName,
          path: IndividualToursWidget.routePath,
          builder: (context, params) => IndividualToursWidget(),
        ),
        FFRoute(
          name: CarHireWidget.routeName,
          path: CarHireWidget.routePath,
          builder: (context, params) => CarHireWidget(),
        ),
        FFRoute(
          name: LiveridetrackerWidget.routeName,
          path: LiveridetrackerWidget.routePath,
          builder: (context, params) => LiveridetrackerWidget(),
        ),
        FFRoute(
          name: AdminSettingWidget.routeName,
          path: AdminSettingWidget.routePath,
          builder: (context, params) => AdminSettingWidget(),
        ),
        FFRoute(
          name: AdminProfileWidget.routeName,
          path: AdminProfileWidget.routePath,
          builder: (context, params) => AdminProfileWidget(),
        ),
        FFRoute(
          name: AdminNotificationsWidget.routeName,
          path: AdminNotificationsWidget.routePath,
          builder: (context, params) => AdminNotificationsWidget(),
        ),
        FFRoute(
          name: AdminLoginWidget.routeName,
          path: AdminLoginWidget.routePath,
          builder: (context, params) => AdminLoginWidget(),
        ),
        FFRoute(
          name: AdminReportsWidget.routeName,
          path: AdminReportsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminReportsWidget(),
        ),
        FFRoute(
          name: ReportDetailsWidget.routeName,
          path: ReportDetailsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ReportDetailsWidget(),
        ),
        FFRoute(
            name: MyProfileWidget.routeName,
            path: MyProfileWidget.routePath,
            requireAuth: true,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'MyProfile')
                : NavBarPage(
                    initialPage: 'MyProfile',
                    page: MyProfileWidget(),
                  )),
        FFRoute(
          name: AdminDriversWidget.routeName,
          path: AdminDriversWidget.routePath,
          builder: (context, params) => AdminDriversWidget(),
        ),
        FFRoute(
          name: UpdateDriverProfileWidget.routeName,
          path: UpdateDriverProfileWidget.routePath,
          requireAuth: true,
          builder: (context, params) => UpdateDriverProfileWidget(),
        ),
        FFRoute(
          name: AcceptedRideWidget.routeName,
          path: AcceptedRideWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AcceptedRideWidget(),
        ),
        FFRoute(
          name: BookingWidget.routeName,
          path: BookingWidget.routePath,
          builder: (context, params) => BookingWidget(),
        ),
        FFRoute(
          name: FlightBookingWidget.routeName,
          path: FlightBookingWidget.routePath,
          builder: (context, params) => FlightBookingWidget(),
        ),
        FFRoute(
          name: AdminFlightsWidget.routeName,
          path: AdminFlightsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminFlightsWidget(
            airline: params.getParam(
              'airline',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SettingsWidget.routeName,
          path: SettingsWidget.routePath,
          builder: (context, params) => SettingsWidget(),
        ),
        FFRoute(
          name: PrivacySecurityWidget.routeName,
          path: PrivacySecurityWidget.routePath,
          builder: (context, params) => PrivacySecurityWidget(),
        ),
        FFRoute(
          name: LanguagePreferencesWidget.routeName,
          path: LanguagePreferencesWidget.routePath,
          builder: (context, params) => LanguagePreferencesWidget(),
        ),
        FFRoute(
          name: StorageAndDataWidget.routeName,
          path: StorageAndDataWidget.routePath,
          builder: (context, params) => StorageAndDataWidget(),
        ),
        FFRoute(
          name: HelpCenterWidget.routeName,
          path: HelpCenterWidget.routePath,
          builder: (context, params) => HelpCenterWidget(),
        ),
        FFRoute(
          name: ContactSupportWidget.routeName,
          path: ContactSupportWidget.routePath,
          builder: (context, params) => ContactSupportWidget(),
        ),
        FFRoute(
          name: FAQsWidget.routeName,
          path: FAQsWidget.routePath,
          builder: (context, params) => FAQsWidget(),
        ),
        FFRoute(
          name: RateDriverWidget.routeName,
          path: RateDriverWidget.routePath,
          requireAuth: true,
          builder: (context, params) => RateDriverWidget(),
        ),
        FFRoute(
          name: TermsOfServiceWidget.routeName,
          path: TermsOfServiceWidget.routePath,
          builder: (context, params) => TermsOfServiceWidget(),
        ),
        FFRoute(
          name: PoliciesWidget.routeName,
          path: PoliciesWidget.routePath,
          builder: (context, params) => PoliciesWidget(),
        ),
        FFRoute(
          name: ChangePasswordWidget.routeName,
          path: ChangePasswordWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ChangePasswordWidget(),
        ),
        FFRoute(
          name: DriverLoginWidget.routeName,
          path: DriverLoginWidget.routePath,
          builder: (context, params) => DriverLoginWidget(),
        ),
        FFRoute(
          name: UpdateDriverWidget.routeName,
          path: UpdateDriverWidget.routePath,
          builder: (context, params) => UpdateDriverWidget(),
        ),
        FFRoute(
          name: AddDriverWidget.routeName,
          path: AddDriverWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AddDriverWidget(),
        ),
        FFRoute(
          name: DriverNotificationsWidget.routeName,
          path: DriverNotificationsWidget.routePath,
          asyncParams: {
            'comfirm': getDoc(['rides'], RidesRecord.fromSnapshot),
          },
          builder: (context, params) => DriverNotificationsWidget(
            comfirm: params.getParam(
              'comfirm',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: DriverSettingsWidget.routeName,
          path: DriverSettingsWidget.routePath,
          builder: (context, params) => DriverSettingsWidget(),
        ),
        FFRoute(
          name: FlightBookingsAdminWidget.routeName,
          path: FlightBookingsAdminWidget.routePath,
          requireAuth: true,
          builder: (context, params) => FlightBookingsAdminWidget(),
        ),
        FFRoute(
          name: AddFlightAdminWidget.routeName,
          path: AddFlightAdminWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AddFlightAdminWidget(),
        ),
        FFRoute(
          name: AdminCouriersWidget.routeName,
          path: AdminCouriersWidget.routePath,
          builder: (context, params) => AdminCouriersWidget(),
        ),
        FFRoute(
          name: HotelBookingsAdminWidget.routeName,
          path: HotelBookingsAdminWidget.routePath,
          builder: (context, params) => HotelBookingsAdminWidget(),
        ),
        FFRoute(
          name: TourBookingAdminWidget.routeName,
          path: TourBookingAdminWidget.routePath,
          requireAuth: true,
          builder: (context, params) => TourBookingAdminWidget(),
        ),
        FFRoute(
          name: AddHotelWidget.routeName,
          path: AddHotelWidget.routePath,
          builder: (context, params) => AddHotelWidget(),
        ),
        FFRoute(
          name: AddTourWidget.routeName,
          path: AddTourWidget.routePath,
          builder: (context, params) => AddTourWidget(),
        ),
        FFRoute(
          name: AddVehicleWidget.routeName,
          path: AddVehicleWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AddVehicleWidget(),
        ),
        FFRoute(
          name: FindYourCarWidget.routeName,
          path: FindYourCarWidget.routePath,
          builder: (context, params) => FindYourCarWidget(),
        ),
        FFRoute(
          name: AvailableFlightsWidget.routeName,
          path: AvailableFlightsWidget.routePath,
          builder: (context, params) => AvailableFlightsWidget(),
        ),
        FFRoute(
          name: AvailablehotelpageWidget.routeName,
          path: AvailablehotelpageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AvailablehotelpageWidget(),
        ),
        FFRoute(
          name: AvailableTourPlacesWidget.routeName,
          path: AvailableTourPlacesWidget.routePath,
          builder: (context, params) => AvailableTourPlacesWidget(),
        ),
        FFRoute(
          name: AdminRequestsWidget.routeName,
          path: AdminRequestsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminRequestsWidget(),
        ),
        FFRoute(
          name: UpdateFlightWidget.routeName,
          path: UpdateFlightWidget.routePath,
          builder: (context, params) => UpdateFlightWidget(),
        ),
        FFRoute(
          name: AdminToursWidget.routeName,
          path: AdminToursWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminToursWidget(),
        ),
        FFRoute(
          name: AdminVehiclesWidget.routeName,
          path: AdminVehiclesWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminVehiclesWidget(),
        ),
        FFRoute(
          name: UpdateVehicleWidget.routeName,
          path: UpdateVehicleWidget.routePath,
          builder: (context, params) => UpdateVehicleWidget(),
        ),
        FFRoute(
          name: UpdateHotelWidget.routeName,
          path: UpdateHotelWidget.routePath,
          builder: (context, params) => UpdateHotelWidget(),
        ),
        FFRoute(
          name: AdminHotelsWidget.routeName,
          path: AdminHotelsWidget.routePath,
          builder: (context, params) => AdminHotelsWidget(),
        ),
        FFRoute(
          name: UpdateTourAdminWidget.routeName,
          path: UpdateTourAdminWidget.routePath,
          builder: (context, params) => UpdateTourAdminWidget(),
        ),
        FFRoute(
          name: AdminRidesWidget.routeName,
          path: AdminRidesWidget.routePath,
          builder: (context, params) => AdminRidesWidget(),
        ),
        FFRoute(
          name: BookHotelPageWidget.routeName,
          path: BookHotelPageWidget.routePath,
          builder: (context, params) => BookHotelPageWidget(),
        ),
        FFRoute(
          name: AdminDashboardWidget.routeName,
          path: AdminDashboardWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminDashboardWidget(),
        ),
        FFRoute(
          name: DriverRideHistoryWidget.routeName,
          path: DriverRideHistoryWidget.routePath,
          requireAuth: true,
          builder: (context, params) => DriverRideHistoryWidget(),
        ),
        FFRoute(
          name: CourierPricingWidget.routeName,
          path: CourierPricingWidget.routePath,
          builder: (context, params) => CourierPricingWidget(),
        ),
        FFRoute(
          name: AdminEditDriverWidget.routeName,
          path: AdminEditDriverWidget.routePath,
          builder: (context, params) => AdminEditDriverWidget(),
        ),
        FFRoute(
          name: CourierTrackingWidget.routeName,
          path: CourierTrackingWidget.routePath,
          builder: (context, params) => CourierTrackingWidget(),
        ),
        FFRoute(
          name: AboutUsWidget.routeName,
          path: AboutUsWidget.routePath,
          builder: (context, params) => AboutUsWidget(),
        ),
        FFRoute(
          name: DriverDashboardWidget.routeName,
          path: DriverDashboardWidget.routePath,
          builder: (context, params) => DriverDashboardWidget(),
        ),
        FFRoute(
          name: UsersWidget.routeName,
          path: UsersWidget.routePath,
          builder: (context, params) => UsersWidget(),
        ),
        FFRoute(
          name: DriverReportsWidget.routeName,
          path: DriverReportsWidget.routePath,
          builder: (context, params) => DriverReportsWidget(),
        ),
        FFRoute(
          name: RideHostoryWidget.routeName,
          path: RideHostoryWidget.routePath,
          builder: (context, params) => RideHostoryWidget(),
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
                  color: Colors.white,
                  child: Image.asset(
                    'assets/images/Fauget.png',
                    fit: BoxFit.fitWidth,
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
