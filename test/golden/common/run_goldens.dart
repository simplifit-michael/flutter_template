// ignore_for_file: avoid_print

import 'package:flutter_template/src/core/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'setup_test_locator.dart';

typedef TesterFlow = Future<void> Function(
  WidgetTester tester,
);

Future<void> runGoldenTest(
  WidgetTester tester,
  String groupName,
  String testName, {
  TesterFlow? flow,
  Map<String, TesterFlow>? flows,
  Future<void> Function()? setup,
}) async {
  assert((flow != null) ^ (flows != null));

  flows ??= {"": flow!};
  await loadAppFonts();

  await setupTestLocator();
  await setup?.call();

  await tester.pumpWidgetBuilder(App());
  int flowIndex = 1;
  for (var flow in flows.entries) {
    print("Starting flow $flowIndex: ${flow.key}");
    await flow.value(tester);
    await mockNetworkImagesFor(() => tester.pumpAndSettle());
    await multiScreenGolden(
      tester,
      _getTestName(
        groupName,
        testName,
        flow.key,
        flows.length > 1 ? "$flowIndex - " : "",
      ),
      devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ],
    );
    flowIndex++;
  }
}

String _getTestName(String groupName, String testName, String flowName, String flowIndex) {
  final fileName = flowName == "" ? testName : flowName;
  return "$groupName/$testName/$flowIndex$fileName";
}
