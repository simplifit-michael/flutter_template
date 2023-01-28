flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter gen-l10n 
build_number=$(git rev-list --count HEAD)
flutter build ipa --release --build-number=$build_number --flavor=PROD --dart-define=app.flavor=prod
flutter build apk --release --build-number=$build_number --flavor=PROD --dart-define=app.flavor=prod
flutter build appbundle  --release --build-number=$build_number --flavor=PROD --dart-define=app.flavor=prod
flutter install