import '../model/feature_flag.dart';

abstract class LocalFeatureFlagDataSource {
  bool isFeatureEnabled(FeatureFlag feature);
  Future<void> setFeatureFlag(FeatureFlag feature, bool value);
}
