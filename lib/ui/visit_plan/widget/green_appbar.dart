import 'package:flutter/material.dart';
import 'package:flutter_playground/core/widgets/app_colors.dart';
import 'package:flutter_playground/gen/assets.gen.dart';

class GreenAppBarWidget extends StatelessWidget {
  const GreenAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 80,
      pinned: true,
      iconTheme: const IconThemeData(color: Colors.white),
      title: const Text(
        "Visit Plan",
        style: TextStyle(color: Colors.white),
      ),
      // flexibleSpace: Assets.images.bg2.image(
      //   fit: BoxFit.fitWidth,
      //   alignment: const Alignment(0, -0.7),
      // ),
    );
  }
}
