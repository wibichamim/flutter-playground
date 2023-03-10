import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_playground/core/data/model/menu.dart';
import 'package:flutter_playground/core/widgets/app_colors.dart';
import 'package:flutter_playground/core/widgets/app_theme.dart';
import 'package:flutter_playground/gen/assets.gen.dart';
import 'package:flutter_playground/ui/home/widget/menu_item.dart';
import 'package:flutter_playground/ui/visit_plan/widget/calendar_view.dart';
import 'package:flutter_playground/ui/visit_plan/widget/green_appbar.dart';
import 'package:flutter_playground/ui/visit_plan/widget/visit_card.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class VisitPlanScreen extends StatefulWidget {
  const VisitPlanScreen({super.key});

  @override
  State<VisitPlanScreen> createState() => _VisitPlanScreenState();
}

class _VisitPlanScreenState extends State<VisitPlanScreen>
    with SingleTickerProviderStateMixin {
  final Duration duration = const Duration(milliseconds: 500);
  DateTime _currentDate = DateTime.now();

  String get formattedCurentDate {
    return DateUtils.isSameDay(_currentDate, DateTime.now())
        ? 'Today, ${DateFormat('d MMM y').format(_currentDate)}'
        : DateFormat('E, d MMM y').format(_currentDate);
  }

  late final AnimationController _controller;
  bool _expanded = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: duration,
      upperBound: 0.5,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void setExpanded() {
    setState(() {
      if (_expanded) {
        _controller.forward(from: 0.0);
      } else {
        _controller.reverse(from: 0.5);
      }
      _expanded = !_expanded;
    });
  }

  Widget _bottomSheet() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Create Visit Data',
                style: Theme.of(context).textTheme.headline6,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Assets.images.icClose.image())
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MenuWidget(
                  menuItem: HomePageMenu(
                      icon: Assets.images.illFromVisitPlan.image(),
                      label: 'From Visit Plan',
                      page: 'VisitPlan')),
              MenuWidget(
                  menuItem: HomePageMenu(
                      icon: Assets.images.illCreateVisitData.image(),
                      label: 'Create New',
                      page: 'VisitData')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _fab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
        ),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            context: context,
            builder: (context) {
              return _bottomSheet();
            },
          );
        },
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

  Widget _headerBody() {
    return Builder(builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppTheme().topBorderRadius,
        ),
        padding: const EdgeInsets.only(
          top: 24.0,
          bottom: 8.0,
          left: 24.0,
          right: 24.0,
        ),
        child: Material(
          color: Colors.transparent,
          child: Row(
            children: [
              Text(
                formattedCurentDate,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              RotationTransition(
                turns: Tween(begin: 2.0, end: 1.0).animate(_controller),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  splashRadius: 20,
                  icon: RotatedBox(
                      quarterTurns: 2,
                      child: Assets.images.icArrowFillUp.image()),
                  onPressed: () {
                    setExpanded();
                  },
                ),
              ),
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
        ),
      );
    });
  }

  Widget _calendarContainer() {
    return AnimatedContainer(
      width: double.infinity,
      height: _expanded ? 350 : 0,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 24,
            offset: Offset(0, 20),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      duration: duration,
      child: SingleChildScrollView(
        child: CalendarWidget(
          selectedDate: (date) {
            _currentDate = date;
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget _listCard() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
            top: 12.0, left: 20.0, right: 20.0, bottom: 80),
        itemBuilder: (context, index) {
          return VisitCard();
        },
      ),
    );
  }

  Widget _body() {
    return Builder(builder: (context) {
      return Container(
        height: 100.0,
        decoration: BoxDecoration(
          color: AppColors.softGray,
          borderRadius: AppTheme().topBorderRadius,
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            children: [
              _headerBody(),
              _calendarContainer(),
              _listCard(),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        image: DecorationImage(
            image: Assets.images.bg2.image().image,
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: _fab(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: CustomScrollView(
            slivers: [
              const GreenAppBarWidget(),
              SliverToBoxAdapter(
                child: Container(
                  height: 20,
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: _body(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
