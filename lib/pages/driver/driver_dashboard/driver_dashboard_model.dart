import '/components/driver_drawer/driver_drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'driver_dashboard_widget.dart' show DriverDashboardWidget;
import 'package:flutter/material.dart';

class DriverDashboardModel extends FlutterFlowModel<DriverDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for DriverDrawer component.
  late DriverDrawerModel driverDrawerModel;

  @override
  void initState(BuildContext context) {
    driverDrawerModel = createModel(context, () => DriverDrawerModel());
  }

  @override
  void dispose() {
    driverDrawerModel.dispose();
  }
}
