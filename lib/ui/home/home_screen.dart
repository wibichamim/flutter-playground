import 'package:flutter/material.dart';
import 'package:flutter_playground/core/data/model/menu.dart';
import 'package:flutter_playground/ui/home/widget/menu_item.dart';
import 'package:flutter_playground/ui/home/widget/stat_card.dart';
import 'package:flutter_playground/ui/home/widget/target_card.dart';
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

  final List<HomePageMenu> menuList = [
    HomePageMenu(
      icon: Icons.calendar_today_rounded,
      label: 'Visit Plan',
      page: 'VisitPlan',
    ),
    HomePageMenu(
      icon: Icons.abc,
      label: 'Visit Data',
      page: 'VisitPlan',
    ),
    HomePageMenu(
      icon: Icons.dangerous_rounded,
      label: 'Action Plan',
      page: 'VisitPlan',
    ),
  ];

  Widget _headerTablet() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: Row(
              children: const [
                Expanded(child: StatCardWidget()),
                Expanded(child: StatCardWidget()),
              ],
            ),
          ),
          const SizedBox(
            height: 150,
            child: TargetCardWidget(),
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
              children: const [
                StatCardWidget(),
                StatCardWidget(),
                TargetCardWidget(),
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
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: menuList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            itemBuilder: (context, index) =>
                MenuWidget(menuItem: menuList[index]),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.greenAccent,
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(24),
                  sliver:
                      context.isTablet() ? _headerTablet() : _headerMobile(),
                ),
                _body()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
