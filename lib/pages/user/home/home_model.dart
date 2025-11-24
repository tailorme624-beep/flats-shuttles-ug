import '/flutter_flow/flutter_flow_util.dart';
import '/pages/drawers/user_drawer/user_drawer_widget.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for UserDrawer component.
  late UserDrawerModel userDrawerModel;

  @override
  void initState(BuildContext context) {
    userDrawerModel = createModel(context, () => UserDrawerModel());
  }

  @override
  void dispose() {
    userDrawerModel.dispose();
  }
}
