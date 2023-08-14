import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/export.dart';
import '../../export.dart';
import '../cubit/connection_monitor_cubit.dart';

@immutable
class ConnectionMonitor extends StatefulWidget {
  const ConnectionMonitor({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<ConnectionMonitor> createState() => _ConnectionMonitorState();
}

class _ConnectionMonitorState extends State<ConnectionMonitor> {
  final connectivity = Connectivity();
  late final checkConnectivity = connectivity.checkConnectivity();
  late final onConnectivityChanged = connectivity.onConnectivityChanged;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ConnectionMonitorCubit(NetworkService(Connectivity())),
      child: Builder(
        builder: (context) {
          return BlocBuilder<ConnectionMonitorCubit, ConnectionMonitorState>(
            builder: (context, state) {
              return Stack(
                children: [
                  widget.child,
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastOutSlowIn,
                      alignment: Alignment.topCenter,
                      child: Align(
                        alignment: Alignment.topCenter,
                        heightFactor:
                            state.map(noInternet: (_) => 1, ready: (_) => 0),
                        child: Material(
                          color: Colors.red,
                          child: Padding(
                            padding: verticalPadding8 + horizontalPadding8,
                            child: const Text(
                              'Please check your internet connection',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
