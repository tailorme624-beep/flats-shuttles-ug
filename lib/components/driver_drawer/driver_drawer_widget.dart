import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'driver_drawer_model.dart';
export 'driver_drawer_model.dart';

/// All Drawer navigation items for the admin
class DriverDrawerWidget extends StatefulWidget {
  const DriverDrawerWidget({super.key});

  @override
  State<DriverDrawerWidget> createState() => _DriverDrawerWidgetState();
}

class _DriverDrawerWidgetState extends State<DriverDrawerWidget> {
  late DriverDrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DriverDrawerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: AuthUserStreamWidget(
                  builder: (context) => ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.network(
                      getCORSProxyUrl(
                        valueOrDefault<String>(
                          currentUserPhoto,
                          'https://firebasestorage.googleapis.com/v0/b/flatsshuttles-gr3bc7.firebasestorage.app/o/images%2Fuser.png?alt=media&token=3b3b09e4-84ef-47a5-a432-cc82acca275c',
                        ),
                      ),
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('DRIVER_DRAWER_ListTile_lasp3vdt_ON_TAP');
                  logFirebaseEvent('ListTile_navigate_to');

                  context.goNamed(DriverDashboardWidget.routeName);
                },
                child: Material(
                  color: Colors.transparent,
                  child: ListTile(
                    leading: Icon(
                      Icons.dashboard_outlined,
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'u7wlnk0x' /* Dashboard */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    dense: false,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('DRIVER_DRAWER_ListTile_gh4hctrg_ON_TAP');
                  logFirebaseEvent('ListTile_navigate_to');

                  context.pushNamed(DriverRideHistoryWidget.routeName);
                },
                child: Material(
                  color: Colors.transparent,
                  child: ListTile(
                    leading: Icon(
                      Icons.emoji_transportation,
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'hg8yboem' /* Rides */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    dense: false,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('DRIVER_DRAWER_ListTile_o4ebvota_ON_TAP');
                  logFirebaseEvent('ListTile_navigate_to');

                  context.pushNamed(DriverProfileWidget.routeName);
                },
                child: Material(
                  color: Colors.transparent,
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.userCircle,
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        '4afueyak' /* Profile */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    dense: false,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('DRIVER_DRAWER_ListTile_5c7msvhe_ON_TAP');
                  logFirebaseEvent('ListTile_navigate_to');

                  context.pushNamed(AdminReportsWidget.routeName);
                },
                child: Material(
                  color: Colors.transparent,
                  child: ListTile(
                    leading: Icon(
                      Icons.query_stats_sharp,
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        '41pfrria' /* Reports */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    dense: false,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('DRIVER_DRAWER_ListTile_sqncex9s_ON_TAP');
                  logFirebaseEvent('ListTile_navigate_to');

                  context.pushNamed(DriverPrivacyPolicyWidget.routeName);
                },
                child: Material(
                  color: Colors.transparent,
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.shieldAlt,
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'vhfp2qt1' /* Privacy Policy */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    dense: false,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('DRIVER_DRAWER_ListTile_cowvdq3x_ON_TAP');
                  logFirebaseEvent('ListTile_navigate_to');

                  context.pushNamed(DriverSettingsWidget.routeName);
                },
                child: Material(
                  color: Colors.transparent,
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.cogs,
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        '8eanqfzs' /* Settings */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    dense: false,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('DRIVER_DRAWER_ListTile_hxzb5i5j_ON_TAP');
                  logFirebaseEvent('ListTile_auth');
                  GoRouter.of(context).prepareAuthEvent();
                  await authManager.signOut();
                  GoRouter.of(context).clearRedirectLocation();

                  logFirebaseEvent('ListTile_navigate_to');

                  context.pushNamedAuth(
                    HomeWidget.routeName,
                    context.mounted,
                    queryParameters: {
                      'isFirstTine': serializeParam(
                        false,
                        ParamType.bool,
                      ),
                    }.withoutNulls,
                  );
                },
                child: Material(
                  color: Colors.transparent,
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        '56rsjkkw' /* Logout */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    dense: false,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
