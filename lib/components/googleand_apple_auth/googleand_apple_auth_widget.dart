import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'googleand_apple_auth_model.dart';
export 'googleand_apple_auth_model.dart';

class GoogleandAppleAuthWidget extends StatefulWidget {
  const GoogleandAppleAuthWidget({super.key});

  @override
  State<GoogleandAppleAuthWidget> createState() =>
      _GoogleandAppleAuthWidgetState();
}

class _GoogleandAppleAuthWidgetState extends State<GoogleandAppleAuthWidget> {
  late GoogleandAppleAuthModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoogleandAppleAuthModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 1.0,
                decoration: BoxDecoration(
                  color: Color(0xFF8B7355),
                ),
              ),
            ),
            Text(
              FFLocalizations.of(context).getText(
                '7er2adjb' /* or */,
              ),
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodySmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodySmall.fontStyle,
                    ),
                    color: Color(0xFF8B7355),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodySmall.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                  ),
            ),
            Expanded(
              child: Container(
                height: 1.0,
                decoration: BoxDecoration(
                  color: Color(0xFF8B7355),
                ),
              ),
            ),
          ].divide(SizedBox(width: 8.0)),
        ),
        FFButtonWidget(
          onPressed: () async {
            logFirebaseEvent('GOOGLEAND_APPLE_AUTH_CONTINUE_WITH_GOOGL');
            logFirebaseEvent('Button_auth');
            GoRouter.of(context).prepareAuthEvent();
            final user = await authManager.signInWithGoogle(context);
            if (user == null) {
              return;
            }

            context.goNamedAuth(MyProfileWidget.routeName, context.mounted);
          },
          text: FFLocalizations.of(context).getText(
            'i87tdt62' /* Continue with Google */,
          ),
          icon: FaIcon(
            FontAwesomeIcons.google,
            size: 30.0,
          ),
          options: FFButtonOptions(
            width: double.infinity,
            height: 48.0,
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            iconColor: Color(0xFF556B2F),
            color: Colors.white,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleSmall.fontStyle,
                  ),
                  color: Color(0xFF556B2F),
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                ),
            elevation: 0.0,
            borderSide: BorderSide(
              color: Color(0xFF8B7355),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
            hoverColor: FlutterFlowTheme.of(context).secondary,
            hoverBorderSide: BorderSide(
              color: FlutterFlowTheme.of(context).accent1,
              width: 1.0,
            ),
            hoverTextColor: Color(0xFFE0DBDB),
          ),
        ),
        isAndroid
            ? Container()
            : FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('GOOGLEAND_APPLE_AUTH_CONTINUE_WITH_APPLE');
                  logFirebaseEvent('Button_auth');
                  GoRouter.of(context).prepareAuthEvent();
                  final user = await authManager.signInWithApple(context);
                  if (user == null) {
                    return;
                  }

                  context.goNamedAuth(
                      MyProfileWidget.routeName, context.mounted);
                },
                text: FFLocalizations.of(context).getText(
                  'jhnol5jr' /* Continue with Apple */,
                ),
                icon: Icon(
                  Icons.apple_rounded,
                  size: 30.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 48.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconColor: Color(0xFF556B2F),
                  color: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: Color(0xFF556B2F),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Color(0xFF8B7355),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                  hoverColor: FlutterFlowTheme.of(context).secondary,
                  hoverBorderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).accent1,
                    width: 1.0,
                  ),
                  hoverTextColor: Color(0xFFDACFCF),
                ),
              ),
      ].divide(SizedBox(height: 12.0)),
    );
  }
}
