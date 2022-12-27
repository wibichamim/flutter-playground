import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_playground/core/data/model/home_card_item.dart';
import 'package:flutter_playground/core/data/model/menu.dart';
import 'package:flutter_playground/core/widgets/app_colors.dart';
import 'package:flutter_playground/gen/assets.gen.dart';
import 'package:flutter_playground/ui/home/widget/list_menu.dart';
import 'package:flutter_playground/ui/home/widget/menu_item.dart';
import 'package:flutter_playground/ui/home/widget/stat_card.dart';
import 'package:flutter_playground/ui/home/widget/target_card.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_playground/utils.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pageController = PageController(
    initialPage: 1,
  );

  final List<HomePageMenu> menuList = listMenu;
  final List<HomeCardItem> itemPage1 = [
    HomeCardItem(
      icon: Assets.images.illVisitPlanHome.image(),
      label: 'Visit Plan',
      count: '29',
    ),
    HomeCardItem(
      icon: Assets.images.illVisitedHome.image(),
      label: 'Visited',
      count: '10',
    ),
    HomeCardItem(
      icon: Assets.images.illProfileBp.image(),
      label: 'Bussiness Partner',
      count: '20',
    ),
  ];

  final List<HomeCardItem> itemPage2 = [
    HomeCardItem(
      icon: Assets.images.illVisitedHome.image(),
      label: 'Visited',
      count: '10',
    ),
    HomeCardItem(
      icon: Assets.images.illVisitCloseHome.image(),
      label: 'Visit Close',
      count: '5',
    ),
    HomeCardItem(
      icon: Assets.images.illProfileBp.image(),
      label: 'Bussiness Partner',
      count: '20',
    ),
  ];

  String get formattedCurentDate {
    return DateFormat('d MMM y').format(DateTime.now());
  }

  Widget _headerTablet() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: Row(
              children: [
                Expanded(
                    child: StatCardWidget(
                        cardTitle: 'Visit Plan', listItem: itemPage1)),
                Expanded(
                    child: StatCardWidget(
                        cardTitle: 'Visit Data', listItem: itemPage2)),
              ],
            ),
          ),
          const SizedBox(
            height: 150,
            child: TargetCardWidget(items: {
              60: 'Customer',
              40: 'Grup',
              90: 'Brand',
              50: 'Visit',
            }),
          )
        ],
      ),
    );
  }

  Widget _headerMobile() {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: double.infinity,
        height: 130,
        child: Stack(
          children: [
            PageView(
              physics: const BouncingScrollPhysics(),
              controller: pageController,
              children: [
                StatCardWidget(cardTitle: 'Visit Plan', listItem: itemPage1),
                StatCardWidget(cardTitle: 'Visit Data', listItem: itemPage2),
                const TargetCardWidget(items: {
                  60: 'Customer',
                  40: 'Grup',
                  90: 'Brand',
                  50: 'Visit',
                }),
              ],
            ),
            Positioned(
              top: 20,
              right: 20,
              child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.amber,
                    dotHeight: 5,
                    dotWidth: 5,
                    spacing: 8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return SliverFillRemaining(
      fillOverscroll: false,
      child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today, $formattedCurentDate',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: menuList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) =>
                      MenuWidget(menuItem: menuList[index]),
                ),
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        image: DecorationImage(
            image: Assets.images.bg2.image().image,
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(24),
                sliver: context.isTablet() ? _headerTablet() : _headerMobile(),
              ),
              _body()
            ],
          ),
        ),
      ),
    );
  }
}
