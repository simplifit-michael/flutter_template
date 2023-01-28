import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/users/export.dart';

class DetailScreen extends StatelessWidget {
  static const path = 'detail';
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailBloc, UserDetailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Icon(Icons.person)),
          body: Center(
              child: Text(state.map(
            initial: (value) => 'LOADING',
            error: (value) => 'ERROR',
            ready: (value) => value.user.name,
          ))),
        );
      },
    );
  }
}
