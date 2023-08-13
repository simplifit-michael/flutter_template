#!/bin/bash
flutter pub get
#FIXME: Use Localization strategy
# Flutter Localization
# flutter gen-l10n 
# Translaty
# flutter pub run flutter_translaty:generate
# Lokalise
# dart run lokalise_flutter_sdk:gen-lok-l10n
flutter pub run build_runner build --delete-conflicting-outputs