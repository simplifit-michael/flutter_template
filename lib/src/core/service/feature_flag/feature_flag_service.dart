import 'package:logging/logging.dart';

import 'data_source/local_feature_flag_data_source.dart';
import 'model/feature_flag.dart';

abstract class FeatureFlagService {
  bool isFeatureEnabled(FeatureFlag feature);
  Future<void> setFeature(FeatureFlag feature, bool value);
}

class FeatureFlagServiceImpl extends FeatureFlagService {
  final _logger = Logger('$FeatureFlagServiceImpl');
  final LocalFeatureFlagDataSource _local;

  FeatureFlagServiceImpl(this._local);

  @override
  bool isFeatureEnabled(FeatureFlag feature) {
    _logger.fine('Requesting ${feature.name}');
    return _local.isFeatureEnabled(feature);
  }

  @override
  Future<void> setFeature(FeatureFlag feature, bool value) async {
    _logger.fine('Setting ${feature.name} to $value');
    await _local.setFeatureFlag(feature, value);
  }
}
