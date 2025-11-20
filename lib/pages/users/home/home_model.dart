import '/flutter_flow/flutter_flow_util.dart';
import '/pages/users/navdrawer/navdrawer_widget.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navdrawer component.
  late NavdrawerModel navdrawerModel;

  @override
  void initState(BuildContext context) {
    navdrawerModel = createModel(context, () => NavdrawerModel());
  }

  @override
  void dispose() {
    navdrawerModel.dispose();
  }
}
