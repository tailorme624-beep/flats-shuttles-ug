import '/components/admin_drawer/admin_drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'admin_couriers_widget.dart' show AdminCouriersWidget;
import 'package:flutter/material.dart';

class AdminCouriersModel extends FlutterFlowModel<AdminCouriersWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
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
