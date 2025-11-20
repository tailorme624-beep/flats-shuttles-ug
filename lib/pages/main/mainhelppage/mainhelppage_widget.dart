import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mainhelppage_model.dart';
export 'mainhelppage_model.dart';

/// design a main app settings page for all users in the app therefore it
/// shouldn't contain any user's information ahvving only application
/// settings.
///
/// with theme colors army green and Light beige
class MainhelppageWidget extends StatefulWidget {
  const MainhelppageWidget({super.key});

  static String routeName = 'mainhelppage';
  static String routePath = '/mainhelppage';

  @override
  State<MainhelppageWidget> createState() => _MainhelppageWidgetState();
}

class _MainhelppageWidgetState extends State<MainhelppageWidget> {
  late MainhelppageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainhelppageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'mainhelppage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'mainhelppage',
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
              backgroundColor: Color(0xFF556B2F),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.arrow_back_outlined,
                  color: Color(0xFFF5F5DC),
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('MAINHELParrow_back_outlined_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.safePop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'pbb8qnya' /* Help & Support */,
                ),
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      font: GoogleFonts.interTight(
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      ),
                      color: Color(0xFFF5F5DC),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5DC),
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Color(0xFF556B2F),
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.help_center_outlined,
                                    color: Color(0xFF556B2F),
                                    size: 32.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'ni95rrc0' /* Frequently Asked Questions */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF556B2F),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '4sem8q5y' /* Find quick answers to common q... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF556B2F),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5DC),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Color(0xFF556B2F),
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'MAINHELPContainer_3bo217pf_ON_TAP');
                                logFirebaseEvent('Container_navigate_to');

                                context.pushNamed(MainpageWidget.routeName);
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'MAINHELPPAGE_PAGE_Row_z3hqb2mz_ON_TAP');
                                      logFirebaseEvent('Row_navigate_to');

                                      context
                                          .pushNamed(MainpageWidget.routeName);
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.account_circle_outlined,
                                              color: Color(0xFF556B2F),
                                              size: 24.0,
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ayds7cw1' /* Account Settings */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF556B2F),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Color(0xFF556B2F),
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 0.5,
                              color: Color(0xFF556B2F),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MAINHELPPAGE_PAGE_Row_fn3t7p5d_ON_TAP');
                                    logFirebaseEvent('Row_navigate_to');

                                    context.pushNamed(MainpageWidget.routeName);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.notifications_outlined,
                                            color: Color(0xFF556B2F),
                                            size: 24.0,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '9qr1j9ml' /* Notification Settings */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF556B2F),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 12.0)),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Color(0xFF556B2F),
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 0.5,
                              color: Color(0xFF556B2F),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MAINHELPPAGE_PAGE_Row_kj6pig5g_ON_TAP');
                                    logFirebaseEvent('Row_navigate_to');

                                    context.pushNamed(MainpageWidget.routeName);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.security_outlined,
                                            color: Color(0xFF556B2F),
                                            size: 24.0,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'w3vaq7nw' /* Privacy & Security */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF556B2F),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 12.0)),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Color(0xFF556B2F),
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 0.5,
                              color: Color(0xFF556B2F),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'MAINHELPContainer_pk21xw3e_ON_TAP');
                                logFirebaseEvent('Container_navigate_to');

                                context.pushNamed(
                                    UserlanguagepreferencepageWidget.routeName);
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'MAINHELPPAGE_PAGE_Row_pchst4mu_ON_TAP');
                                      logFirebaseEvent('Row_navigate_to');

                                      context
                                          .pushNamed(MainpageWidget.routeName);
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.language_outlined,
                                              color: Color(0xFF556B2F),
                                              size: 24.0,
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'z4yk3abm' /* Language & Region */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF556B2F),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Color(0xFF556B2F),
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5DC),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Color(0xFF556B2F),
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MAINHELPPAGE_PAGE_Row_tvg2838k_ON_TAP');
                                    logFirebaseEvent('Row_navigate_to');

                                    context.pushNamed(MainpageWidget.routeName);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.bug_report_outlined,
                                            color: Color(0xFF556B2F),
                                            size: 24.0,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              't4fplu22' /* Report a Problem */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF556B2F),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 12.0)),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Color(0xFF556B2F),
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 0.5,
                              color: Color(0xFF556B2F),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MAINHELPPAGE_PAGE_Row_hox6k4z8_ON_TAP');
                                    logFirebaseEvent('Row_navigate_to');

                                    context.pushNamed(MainpageWidget.routeName);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.feedback_outlined,
                                            color: Color(0xFF556B2F),
                                            size: 24.0,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'hc5xshoi' /* Send Feedback */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF556B2F),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 12.0)),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Color(0xFF556B2F),
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 0.5,
                              color: Color(0xFF556B2F),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MAINHELPPAGE_PAGE_Row_ss8pn66u_ON_TAP');
                                    logFirebaseEvent('Row_navigate_to');

                                    context.pushNamed(MainpageWidget.routeName);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.contact_support_outlined,
                                            color: Color(0xFF556B2F),
                                            size: 24.0,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '4mtnrkd6' /* Contact Support */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF556B2F),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 12.0)),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Color(0xFF556B2F),
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5DC),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Color(0xFF556B2F),
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MAINHELPPAGE_PAGE_Row_r1qmvs5c_ON_TAP');
                                    logFirebaseEvent('Row_navigate_to');

                                    context.pushNamed(MainpageWidget.routeName);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.info_outlined,
                                            color: Color(0xFF556B2F),
                                            size: 24.0,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              't2dxxny0' /* About This App */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF556B2F),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 12.0)),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Color(0xFF556B2F),
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 0.5,
                              color: Color(0xFF556B2F),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MAINHELPPAGE_PAGE_Row_1589q8j6_ON_TAP');
                                    logFirebaseEvent('Row_navigate_to');

                                    context.pushNamed(MainpageWidget.routeName);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.gavel_outlined,
                                            color: Color(0xFF556B2F),
                                            size: 24.0,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              's8q3fcve' /* Terms of Service */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF556B2F),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 12.0)),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Color(0xFF556B2F),
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 0.5,
                              color: Color(0xFF556B2F),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MAINHELPPAGE_PAGE_Row_cbn4cfx9_ON_TAP');
                                    logFirebaseEvent('Row_navigate_to');

                                    context.pushNamed(
                                        MainprivacypolicypageWidget.routeName);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.policy_outlined,
                                            color: Color(0xFF556B2F),
                                            size: 24.0,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '5kj9l4zu' /* Privacy Policy */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF556B2F),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 12.0)),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Color(0xFF556B2F),
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('MAINHELPContainer_nmlelb5d_ON_TAP');
                          logFirebaseEvent('Container_navigate_to');

                          context.pushNamed(MainpageWidget.routeName);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFF556B2F),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.chat_bubble_outline,
                                  color: Color(0xFFF5F5DC),
                                  size: 20.0,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'yl2k7u1y' /* Live Chat Support */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFF5F5DC),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'oum48i2h' /* App Version 2.1.4 */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                            color: Color(0xFF556B2F),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                          ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'kkkxbdzh' /* © 2025 FLATS UG. All rights re... */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 16.0))
                      .addToStart(SizedBox(height: 24.0))
                      .addToEnd(SizedBox(height: 24.0)),
                ),
              ),
            ),
          ),
        ));
  }
}
