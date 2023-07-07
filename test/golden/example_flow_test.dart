import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'common/run_goldens.dart';

void main() {
  HttpOverrides.global = null;
  testGoldens(
    'Startup',
    (tester) => runGoldenTest(
      tester,
      'Startup',
      'Login after startup',
      setup: () async {},
      flows: {
        "Starting app without loggedin user": (tester) => Future.value(null),
        "Login user": (tester) => tester.tap((find.byType(ElevatedButton))),
      },
    ),
  );
}
