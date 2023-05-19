import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app/export.dart';
import '../../domain/users/export.dart';

class UserDetailScreen extends StatelessWidget {
  static const path = 'detail';
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailBloc, UserDetailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('User Detail')),
          body: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 150,
                    child: Container(
                      color: AppColor.primary,
                      child: Center(
                        child: Text(
                          state.map(
                            initial: (value) => 'LOADING',
                            error: (value) => 'ERROR',
                            ready: (value) => value.user.name,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Center(
                    child: Text('User Content'),
                  ),
                ],
              ),
              Positioned(
                top: 100,
                child: Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(8),
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: state.map(
                    initial: (value) => const Placeholder(),
                    error: (value) => const Placeholder(),
                    ready: (value) => CircleAvatar(
                      backgroundImage: NetworkImage(
                        value.user.avatar,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
