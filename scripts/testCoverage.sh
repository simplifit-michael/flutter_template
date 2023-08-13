#!/bin/bash
flutter test --coverage
#brew install lcov (Needed)
lcov --remove coverage/lcov.info '*.g.dart' '*.freezed.dart' 'lib/src/presentation/*' 'lib/main.dart' 'lib/firebase_options.dart' -o coverage/lcov.info
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html