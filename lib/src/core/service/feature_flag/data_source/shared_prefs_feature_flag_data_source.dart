import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/feature_flag.dart';
import 'local_feature_flag_data_source.dart';

class SharedPrefsFeatureFlagDataSource extends LocalFeatureFlagDataSource {
  SharedPrefsFeatureFlagDataSource(this._prefs);

  final _logger = Logger('$SharedPrefsFeatureFlagDataSource');
  final SharedPreferences _prefs;

  @override
  bool isFeatureEnabled(FeatureFlag feature) {
    _logger.fine('Loading ${feature.name}');
    return _prefs.getBool('$feature') ?? false;
  }

  @override
  Future<void> setFeatureFlag(FeatureFlag feature, bool value) async {
    _logger.fine('Setting ${feature.name} to $value');
    await _prefs.setBool('$feature', value);
  }
}
