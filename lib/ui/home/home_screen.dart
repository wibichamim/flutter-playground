import 'package:flutter/material.dart';
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
        height: 150,
        child: Stack(
          children: [
            PageView(
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
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(12),
        child: GridView.count(
          crossAxisCount: 4,
          children: List.generate(14, (index) {
            return const Card(
              color: Colors.deepPurpleAccent,
            );
          }),
        ),
      ),
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
                  padding: EdgeInsets.all(24),
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
