import '/backend/backend.dart';
import '/components/admin_drawer/admin_drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/admin/components/admin_driver_card/admin_driver_card_widget.dart';
import '/index.dart';
import 'admin_drivers_widget.dart' show AdminDriversWidget;
import 'package:flutter/material.dart';

class AdminDriversModel extends FlutterFlowModel<AdminDriversWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in AdminDrivers widget.
  int? count;
  // Stores action output result for [Firestore Query - Query a collection] action in AdminDrivers widget.
  List<UsersRecord>? allDrivers;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<DriversRecord> simpleSearchResults = [];
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Models for AdminDriverCard dynamic component.
  late FlutterFlowDynamicModels<AdminDriverCardModel> adminDriverCardModels;
  // Model for AdminDrawer component.
  late AdminDrawerModel adminDrawerModel;

  @override
  void initState(BuildContext context) {
    adminDriverCardModels =
        FlutterFlowDynamicModels(() => AdminDriverCardModel());
    adminDrawerModel = createModel(context, () => AdminDrawerModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    adminDriverCardModels.dispose();
    adminDrawerModel.dispose();
  }
}
