enum AppEnvironment { dev, prod }

AppEnvironment get appEnvironment {
  const appEnvironment = String.fromEnvironment('app.env');
  switch (appEnvironment) {
    case 'dev':
      return AppEnvironment.dev;
    case 'prod':
      return AppEnvironment.prod;
    default:
      return AppEnvironment.dev;
  }
}

extension AppEnvironmentExtension on AppEnvironment {
  bool get isProduction => this == AppEnvironment.prod;
}
