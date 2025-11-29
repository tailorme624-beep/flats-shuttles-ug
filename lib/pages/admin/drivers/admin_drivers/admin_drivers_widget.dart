import '/backend/backend.dart';
import '/components/admin_drawer/admin_drawer_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/admin/components/admin_driver_card/admin_driver_card_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'admin_drivers_model.dart';
export 'admin_drivers_model.dart';

/// Design the Admin Driver Management page for comprehensive driver oversight
/// and control.
///
/// This page will manage all users but focus on driver actions.
/// Layout: Single-column page, with a search bar at the top.
/// Header: Title: "Manage Users & Drivers." Include a Dropdown Filter to
/// select role ('driver', 'client').
/// Content: A main ListView querying the entire users collection, filtered by
/// the role selected in the dropdown.
/// List Item Details: Each tile shows the user's Name, Role, and Status
/// (is_verified, is_active).
/// Action Row (Driver-Specific): For users where role == 'driver', display
/// three critical buttons (via Conditional Visibility):
/// "Verify". Action: Update Document to set is_verified to true.
/// "Edit" (Navigates to a detailed edit form).
/// "Suspend/Terminate" (Toggles the user's is_active boolean field and/or
/// updates the role to 'suspended'). with theme colors, army green and light
/// beige
class AdminDriversWidget extends StatefulWidget {
  const AdminDriversWidget({super.key});

  static String routeName = 'AdminDrivers';
  static String routePath = '/adminDrivers';

  @override
  State<AdminDriversWidget> createState() => _AdminDriversWidgetState();
}

class _AdminDriversWidgetState extends State<AdminDriversWidget> {
  late AdminDriversModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminDriversModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AdminDrivers'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord
            .where(
              'role',
              isEqualTo: 'driver',
            )
            .orderBy('created_time', descending: true),
        limit: 20,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFF5F5DC),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsersRecord> adminDriversUsersRecordList = snapshot.data!;

        return Title(
            title: 'AdminDrivers',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: Color(0xFFF5F5DC),
                drawer: Drawer(
                  elevation: 16.0,
                  child: wrapWithModel(
                    model: _model.adminDrawerModel,
                    updateCallback: () => safeSetState(() {}),
                    child: AdminDrawerWidget(),
                  ),
                ),
                body: NestedScrollView(
                  floatHeaderSlivers: false,
                  headerSliverBuilder: (context, _) => [
                    SliverAppBar(
                      pinned: false,
                      floating: false,
                      backgroundColor: Color(0xFF556B2F),
                      iconTheme: IconThemeData(
                          color: FlutterFlowTheme.of(context).alternate),
                      automaticallyImplyLeading: true,
                      title: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'mvl77l2z' /* Drivers */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  color: Color(0xFFF5F5DC),
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                          ),
                          StreamBuilder<List<UsersRecord>>(
                            stream: queryUsersRecord(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                'role',
                                isEqualTo: 'driver',
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<UsersRecord> textUsersRecordList =
                                  snapshot.data!;

                              return Text(
                                formatNumber(
                                  textUsersRecordList.length,
                                  formatType: FormatType.compact,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                              );
                            },
                          ),
                        ],
                      ),
                      actions: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderRadius: 40.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.person_add_alt,
                                color: Color(0xFFF5F5DC),
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'ADMIN_DRIVERS_person_add_alt_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_navigate_to');

                                context.pushNamed(AddDriverWidget.routeName);
                              },
                            ),
                          ),
                        ),
                      ],
                      centerTitle: true,
                      elevation: 0.0,
                    )
                  ],
                  body: Builder(
                    builder: (context) {
                      return SafeArea(
                        top: false,
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    onFieldSubmitted: (_) async {
                                      logFirebaseEvent(
                                          'ADMIN_DRIVERS_TextField_v20vqpk1_ON_TEXT');
                                      logFirebaseEvent(
                                          'TextField_simple_search');
                                      await queryDriversRecordOnce()
                                          .then(
                                            (records) =>
                                                _model.simpleSearchResults =
                                                    TextSearch(
                                              records
                                                  .map(
                                                    (record) => TextSearchItem
                                                        .fromTerms(record, [
                                                      record.vehicleModel,
                                                      record.vehicleType
                                                    ]),
                                                  )
                                                  .toList(),
                                            )
                                                        .search('search')
                                                        .map((r) => r.object)
                                                        .toList(),
                                          )
                                          .onError((_, __) =>
                                              _model.simpleSearchResults = [])
                                          .whenComplete(
                                              () => safeSetState(() {}));
                                    },
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        '0zu9eljv' /* Search users by name or email */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF556B2F),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF556B2F),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16.0, 0.0, 16.0, 0.0),
                                      prefixIcon: Icon(
                                        Icons.search_rounded,
                                        color: Color(0xFF556B2F),
                                        size: 20.0,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    cursorColor: Color(0xFF556B2F),
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: Color(0xFF556B2F),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'mfgvipw6' /* Filter by Status: */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.interTight(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF556B2F),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController ??=
                                                FormFieldController<String>(
                                              _model.dropDownValue ??= 'all',
                                            ),
                                            options: List<String>.from(
                                                ['all', 'active', 'inactive']),
                                            optionLabels: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'n9wce7bz' /* All Drivers */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'd3i2oo73' /* Active */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'c6yy7t77' /* Inactive */,
                                              )
                                            ],
                                            onChanged: (val) => safeSetState(
                                                () =>
                                                    _model.dropDownValue = val),
                                            width: 150.0,
                                            height: 40.0,
                                            searchHintTextStyle: TextStyle(),
                                            searchTextStyle: TextStyle(),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF556B2F),
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'bapcgp5l' /* Driver Status */,
                                            ),
                                            searchHintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'pd1e4c55' /* Driver Status */,
                                            ),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: Color(0xFF556B2F),
                                              size: 20.0,
                                            ),
                                            fillColor: Color(0xFFF5F5DC),
                                            elevation: 2.0,
                                            borderColor: Color(0xFF556B2F),
                                            borderWidth: 1.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            hidesUnderline: true,
                                            isSearchable: true,
                                            isMultiSelect: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  final drivers =
                                      adminDriversUsersRecordList.toList();
                                  if (drivers.isEmpty) {
                                    return Image.asset(
                                      'assets/images/empty-list-main.png',
                                    );
                                  }

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: drivers.length,
                                    itemBuilder: (context, driversIndex) {
                                      final driversItem = drivers[driversIndex];
                                      return wrapWithModel(
                                        model: _model.adminDriverCardModels
                                            .getModel(
                                          driversItem.uid,
                                          driversIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: AdminDriverCardWidget(
                                          key: Key(
                                            'Key6zk_${driversItem.uid}',
                                          ),
                                          user: driversItem,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ]
                                .divide(SizedBox(height: 16.0))
                                .addToStart(SizedBox(height: 16.0)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ));
      },
    );
  }
}
