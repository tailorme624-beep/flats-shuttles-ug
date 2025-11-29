import '/components/driver_drawer/driver_drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'driver_ride_history_widget.dart' show DriverRideHistoryWidget;
import 'package:flutter/material.dart';

class DriverRideHistoryModel extends FlutterFlowModel<DriverRideHistoryWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
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
