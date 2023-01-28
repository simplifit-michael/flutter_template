import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionLabel extends StatelessWidget {
  const VersionLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, future) {
        final versionString = future.connectionState == ConnectionState.done &&
                future.data != null
            ? '${future.data!.version} (${future.data!.buildNumber})'
            : S.of(context)!.generic_error_unknown_version_label;
        return Text(
          '${S.of(context)!.company} ${S.of(context)!.app_title}\nv$versionString',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        );
      },
    );
  }
}
