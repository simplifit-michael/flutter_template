import 'package:flutter_template/src/core/service/l18n.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionLabel extends StatelessWidget {
  const VersionLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, future) {
        final versionString = future.connectionState == ConnectionState.done
            ? '${future.data!.version} (${future.data!.buildNumber})'
            : LocaleKeys.generalErrorUnknownVersionLabel.tr();
        return Text(
          '${LocaleKeys.company.tr()} ${LocaleKeys.appTitle.tr()}\nv$versionString',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        );
      },
    );
  }
}
