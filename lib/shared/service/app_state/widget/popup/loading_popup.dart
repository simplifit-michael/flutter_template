import 'package:flutter/material.dart';

import '../../../../../app/export.dart';
import '../../../../../generated/export.dart';

class LoadingPopup extends StatelessWidget {
  const LoadingPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: allPadding24,
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: const BoxDecoration(
              color: AppColor.cardBackground,
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s16)),
            ),
            padding: allPadding16,
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
