import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

// ignore: unused_import
import '../service/l18n.dart';

class VersionLabel extends StatelessWidget {
  const VersionLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, future) {
        //FIXME: Localize Fallback with your choosen l10n Strategy
        final versionString = future.connectionState == ConnectionState.done
            ? '${future.data!.version} (${future.data!.buildNumber})'
            : 'Unknown Version';
        //FIXME: Localize Fallback with your choosen l10n Strategy
        return Text(
          '${'.simplif{it} solutions'} ${'Flutter AppTemplate'}\nv$versionString',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        );
      },
    );
  }
}
