import '/components/admin_drawer/admin_drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'admin_flights_widget.dart' show AdminFlightsWidget;
import 'package:flutter/material.dart';

class AdminFlightsModel extends FlutterFlowModel<AdminFlightsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchFlight widget.
  FocusNode? searchFlightFocusNode;
  TextEditingController? searchFlightTextController;
  String? Function(BuildContext, String?)? searchFlightTextControllerValidator;
  // Model for AdminDrawer component.
  late AdminDrawerModel adminDrawerModel;

  @override
  void initState(BuildContext context) {
    adminDrawerModel = createModel(context, () => AdminDrawerModel());
  }

  @override
  void dispose() {
    searchFlightFocusNode?.dispose();
    searchFlightTextController?.dispose();

    adminDrawerModel.dispose();
  }
}
