import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';

import '../model/feature_flag.dart';
import 'local_feature_flag_data_source.dart';

class HiveFeatureFlagDataSource extends LocalFeatureFlagDataSource {
  HiveFeatureFlagDataSource(this._hive);

  final _logger = Logger('$HiveFeatureFlagDataSource');
  final HiveInterface _hive;

  Box get _box => _hive.box('$LocalFeatureFlagDataSource');

  Future<void> init() async {
    await _hive.openBox('$LocalFeatureFlagDataSource');
  }

  @override
  bool isFeatureEnabled(FeatureFlag feature) {
    _logger.fine('Loading ${feature.name}');
    return _box.get('$feature') ?? false;
  }

  @override
  Future<void> setFeatureFlag(FeatureFlag feature, bool value) async {
    _logger.fine('Setting ${feature.name} to $value');
    await _box.put('$feature', value);
  }
}
