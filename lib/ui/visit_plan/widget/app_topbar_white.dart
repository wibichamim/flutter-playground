import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_playground/core/widgets/app_colors.dart';

class TopBarWhite extends StatelessWidget {
  final String title;
  final bool hasLoading;
  final int loadValue;
  const TopBarWhite(
      {super.key,
      required this.title,
      required this.hasLoading,
      this.loadValue = 0});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      toolbarHeight: 80,
      forceElevated: true,
      elevation: 5.0,
      title: Text(title),
      bottom: hasLoading
          ? PreferredSize(
              preferredSize: const Size(double.infinity, 1),
              child: LinearProgressIndicator(
                value: loadValue / 100,
                backgroundColor: Colors.white,
                color: AppColors.primary,
              ),
            )
          : null,
    );
  }
}
