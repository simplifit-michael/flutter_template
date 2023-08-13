import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/shared/service/app_state/cubit/app_state_cubit.dart';

import '../../app/assets/app_image.dart';
import '../../app/themes/app_theme.dart';
import '../../generated/app_margin.dart';
import '../service/app_state/model/error/no_internet_error.dart';
import 'error_screen.dart';

class ConnectionMonitor extends StatelessWidget {
  const ConnectionMonitor({
    required Connectivity connectivity,
    required this.child,
    super.key,
  }) : _connectivity = connectivity;
  final Connectivity _connectivity;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _connectivity
          .checkConnectivity()
          .then((value) => value != ConnectivityResult.none),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return verticalMargin0;
        }
        return StreamBuilder<bool>(
          initialData: snapshot.data,
          stream: _connectivity.onConnectivityChanged
              .map((event) => event != ConnectivityResult.none),
          builder: (context, snapshot) {
            final hasConnection = snapshot.data ?? false;
            if (!hasConnection) {
              final error = NoInternetError();
              return MaterialApp(
                theme: AppTheme.getDefaultTheme(),
                home: ErrorScreen(
                  data: ErrorScreenData(
                    appIcon: AppImage.appLogo,
                    description: error.getDescription(context),
                    positiveButtonLabel: error.getButtonLabel(context),
                    onPositiveTap: () async {
                      final app = context.read<AppStateCubit>();
                      app.setLoading();
                      await _connectivity.checkConnectivity();
                      app.reset();
                    },
                    negativeButtonLabel: null,
                    onNegativeTap: null,
                  ),
                ),
                //FIXME: initialize applocalization based on your localization strategy
                // localizationsDelegates: context.localizationDelegates,
                // supportedLocales: context.supportedLocales,
                // locale: context.locale,
                onGenerateTitle: (context) => 'Flutter AppTitle',
              );
            }
            return child;
          },
        );
      },
    );
  }
}
