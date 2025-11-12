import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'navdrawer_model.dart';
export 'navdrawer_model.dart';

class NavdrawerWidget extends StatefulWidget {
  const NavdrawerWidget({super.key});

  @override
  State<NavdrawerWidget> createState() => _NavdrawerWidgetState();
}

class _NavdrawerWidgetState extends State<NavdrawerWidget> {
  late NavdrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavdrawerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowIconButton(
      borderColor: FlutterFlowTheme.of(context).secondary,
      borderRadius: 20.0,
      borderWidth: 1.0,
      buttonSize: 40.0,
      fillColor: FlutterFlowTheme.of(context).secondary,
      icon: Icon(
        Icons.menu_rounded,
        color: FlutterFlowTheme.of(context).primary,
        size: 24.0,
      ),
      onPressed: () async {
        logFirebaseEvent('NAVDRAWER_COMP_menu_rounded_ICN_ON_TAP');
        // Open Drawer
        logFirebaseEvent('IconButton_OpenDrawer');
        Scaffold.of(context).openDrawer();
      },
    );
  }
}
