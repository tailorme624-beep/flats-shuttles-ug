import '/flutter_flow/flutter_flow_util.dart';
import '/pages/drawers/user_drawer/user_drawer_widget.dart';
import 'a_i_assistant_widget.dart' show AIAssistantWidget;
import 'package:flutter/material.dart';

class AIAssistantModel extends FlutterFlowModel<AIAssistantWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for UserDrawer component.
  late UserDrawerModel userDrawerModel;

  @override
  void initState(BuildContext context) {
    userDrawerModel = createModel(context, () => UserDrawerModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    userDrawerModel.dispose();
  }
}
