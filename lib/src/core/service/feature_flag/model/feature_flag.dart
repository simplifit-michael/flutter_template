enum FeatureFlag {
  feature,
}

extension FeatureFlagExtension on FeatureFlag {
  String toDisplayString() {
    switch (this) {
      case FeatureFlag.feature:
        return 'Feature 1';
    }
  }
}
