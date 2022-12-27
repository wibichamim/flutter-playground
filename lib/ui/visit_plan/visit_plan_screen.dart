import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_playground/core/widgets/app_colors.dart';
import 'package:flutter_playground/gen/assets.gen.dart';

class VisitPlanScreen extends StatefulWidget {
  const VisitPlanScreen({super.key});

  @override
  State<VisitPlanScreen> createState() => _VisitPlanScreenState();
}

Widget _fab() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Add new visit data"),
          SizedBox(
            width: 10.0,
          ),
          Icon(Icons.add_box_rounded),
        ],
      ),
    ),
  );
}

class _VisitPlanScreenState extends State<VisitPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _fab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
              image: Assets.images.bg2.image().image,
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                toolbarHeight: 80,
                pinned: true,
                iconTheme: const IconThemeData(color: Colors.white),
                title: const Text(
                  "Visit Plan",
                  style: TextStyle(color: Colors.white),
                ),
                flexibleSpace: Stack(
                  children: [
                    Positioned.fill(
                        child: Assets.images.bg2.image(
                      fit: BoxFit.fitWidth,
                      alignment: const Alignment(0, -0.48),
                    ))
                  ],
                ),
              ),
              SliverFillRemaining(
                child: Container(
                  height: 100.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
