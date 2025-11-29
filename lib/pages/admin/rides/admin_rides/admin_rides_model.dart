import '/components/admin_drawer/admin_drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_rides_widget.dart' show AdminRidesWidget;
import 'package:flutter/material.dart';

class AdminRidesModel extends FlutterFlowModel<AdminRidesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AdminDrawer component.
  late AdminDrawerModel adminDrawerModel;

  @override
  void initState(BuildContext context) {
    adminDrawerModel = createModel(context, () => AdminDrawerModel());
  }

  @override
  void dispose() {
    adminDrawerModel.dispose();
  }
}
