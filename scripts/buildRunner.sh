#!/bin/bash
flutter pub get
#FIXME: Use Localization strategy
# flutter gen-l10n 
flutter pub run build_runner build --delete-conflicting-outputs