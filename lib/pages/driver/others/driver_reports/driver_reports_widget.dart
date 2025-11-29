import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'driver_reports_model.dart';
export 'driver_reports_model.dart';

/// All Driver Reports
class DriverReportsWidget extends StatefulWidget {
  const DriverReportsWidget({super.key});

  static String routeName = 'DriverReports';
  static String routePath = '/driverReports';

  @override
  State<DriverReportsWidget> createState() => _DriverReportsWidgetState();
}

class _DriverReportsWidgetState extends State<DriverReportsWidget> {
  late DriverReportsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DriverReportsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'DriverReports'});
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
        title: 'DriverReports',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              iconTheme:
                  IconThemeData(color: FlutterFlowTheme.of(context).alternate),
              automaticallyImplyLeading: true,
              title: Text(
                FFLocalizations.of(context).getText(
                  'ttdsq6xh' /* My reports */,
                ),
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      font: GoogleFonts.interTight(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).alternate,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleLarge.fontWeight,
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
              child: FlutterFlowSwipeableStack(
                onSwipeFn: (index) {},
                onLeftSwipe: (index) {},
                onRightSwipe: (index) {},
                onUpSwipe: (index) {},
                onDownSwipe: (index) {},
                itemBuilder: (context, index) {
                  return [
                    () => ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            getCORSProxyUrl(
                              'https://picsum.photos/seed/632/600',
                            ),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                    () => ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            getCORSProxyUrl(
                              'https://picsum.photos/seed/197/600',
                            ),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                    () => ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            getCORSProxyUrl(
                              'https://picsum.photos/seed/232/600',
                            ),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                    () => ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            getCORSProxyUrl(
                              'https://picsum.photos/seed/286/600',
                            ),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                  ][index]();
                },
                itemCount: 4,
                controller: _model.swipeableStackController,
                loop: false,
                cardDisplayCount: 3,
                scale: 0.9,
              ),
            ),
          ),
        ));
  }
}
