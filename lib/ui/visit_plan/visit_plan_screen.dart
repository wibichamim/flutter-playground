import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_playground/core/widgets/app_colors.dart';
import 'package:flutter_playground/gen/assets.gen.dart';
import 'package:flutter_playground/ui/visit_plan/widget/green_appbar.dart';
import 'package:intl/intl.dart';

class VisitPlanScreen extends StatefulWidget {
  const VisitPlanScreen({super.key});

  @override
  State<VisitPlanScreen> createState() => _VisitPlanScreenState();
}

String get formattedCurentDate {
  return DateFormat('d MMM y').format(DateTime.now());
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

Widget _body() {
  return Builder(builder: (context) {
    return Container(
      height: 100.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Today, $formattedCurentDate',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Assets.images.icArrowFillUp.image(),
                  const Spacer(),
                  Ink(
                    padding: EdgeInsets.all(5),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      color: Colors.black,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      splashRadius: 20,
                      onPressed: () {},
                      icon: Assets.images.icSearchWhite.image(),
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Ink(
                    padding: EdgeInsets.all(5),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      color: Colors.black,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      splashRadius: 20,
                      onPressed: () {},
                      icon: Assets.images.icFilter.image(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  });
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
              const GreenAppBarWidget(),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20.0,
                ),
              ),
              SliverFillRemaining(
                child: _body(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
