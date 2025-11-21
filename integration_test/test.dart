import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flats_shuttles_ug/flutter_flow/flutter_flow_drop_down.dart';
import 'package:flats_shuttles_ug/flutter_flow/flutter_flow_icon_button.dart';
import 'package:flats_shuttles_ug/flutter_flow/flutter_flow_widgets.dart';
import 'package:flats_shuttles_ug/flutter_flow/flutter_flow_theme.dart';
import 'package:flats_shuttles_ug/index.dart';
import 'package:flats_shuttles_ug/main.dart';
import 'package:flats_shuttles_ug/flutter_flow/flutter_flow_util.dart';

import 'package:flats_shuttles_ug/backend/firebase/firebase_config.dart';
import 'package:flats_shuttles_ug/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();

    await FlutterFlowTheme.initialize();

    await FFLocalizations.initialize();
  });

  setUp(() async {
    await authManager.signOut();
  });

  testWidgets('userSignup and LogIn test', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MyApp(
      entryPage: HomeWidget(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(
      const Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 3000),
    );
    await tester.scrollUntilVisible(
      find.byKey(const ValueKey('IconButton_ceim')),
      100.0,
      scrollable: find
          .descendant(
            of: find.byKey(const ValueKey('signup')),
            matching: find.byType(Scrollable),
          )
          .first,
    );
    expect(find.byKey(const ValueKey('IconButton_ceim')), findsOneWidget);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }
  // Web-specific error when interacting with TextInputType.emailAddress
  if (error.contains('setSelectionRange') &&
      error.contains('HTMLInputElement')) {
    return true;
  }

  return false;
}
