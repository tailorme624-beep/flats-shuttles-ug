import '/backend/backend.dart';
import '/components/user_drawer/user_drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_profile_widget.dart' show MyProfileWidget;
import 'package:flutter/material.dart';

class MyProfileModel extends FlutterFlowModel<MyProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in MyProfile widget.
  UsersRecord? user;
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // Model for UserDrawer component.
  late UserDrawerModel userDrawerModel;

  @override
  void initState(BuildContext context) {
    userDrawerModel = createModel(context, () => UserDrawerModel());
  }

  @override
  void dispose() {
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    userDrawerModel.dispose();
  }
}
