#!/bin/zsh
lokalise2 file download --config ./lokalise-config.yaml --format json --all-platforms --unzip-to ./lib/l10n/ --original-filenames=false --include-tags Mobileapp 
mv ./lib/l10n/locale/* ./lib/l10n/
rmdir ./lib/l10n/locale/
mv ./lib/l10n/de.json ./lib/l10n/intl_de.arb
mv ./lib/l10n/en.json ./lib/l10n/intl_en.arb
mv ./lib/l10n/bg.json ./lib/l10n/intl_bg.arb
dart run lokalise_flutter_sdk:gen-lok-l10n