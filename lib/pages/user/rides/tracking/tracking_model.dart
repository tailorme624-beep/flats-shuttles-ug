import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/drawers/user_drawer/user_drawer_widget.dart';
import 'tracking_widget.dart' show TrackingWidget;
import 'package:flutter/material.dart';

class TrackingModel extends FlutterFlowModel<TrackingWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for UserDrawer component.
  late UserDrawerModel userDrawerModel;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {
    userDrawerModel = createModel(context, () => UserDrawerModel());
  }

  @override
  void dispose() {
    userDrawerModel.dispose();
  }
}
