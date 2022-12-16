import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pageController = PageController(
    initialPage: 1,
  );

  Widget _statContent(int position, IconData icon, String title, String count) {
    return Row(
      children: [
        if (position != 1)
          const VerticalDivider(
            color: Colors.green,
            thickness: 2,
            width: 30,
            indent: 20,
            endIndent: 20,
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon),
            Text(title),
            Text(count),
          ],
        ),
      ],
    );
  }

  Widget _cardVisit() {
    return Card(
      color: Colors.green.shade800,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Visit Data'),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _statContent(1, Icons.ac_unit_rounded, 'Visited', '7'),
                  _statContent(
                      2, Icons.access_time_filled_rounded, 'Visit Close', '7'),
                  _statContent(3, Icons.supervised_user_circle_rounded,
                      'Bussiness Partner', '20'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statTarget(int count, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircularPercentIndicator(
          radius: 25,
          percent: count / 100,
          center: Text(
            '$count%',
            style: TextStyle(fontSize: 10),
          ),
          lineWidth: 5.0,
          progressColor: Colors.amber,
          backgroundColor: Colors.white,
        ),
        Text(title),
      ],
    );
  }

  Widget _cardTarget() {
    return Card(
      color: Colors.green.shade800,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Target'),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _statTarget(60, 'Customer'),
                  _statTarget(45, 'Grup'),
                  _statTarget(90, 'Brand'),
                  _statTarget(50, 'Visit'),
                ],
              ),
            ),
          ],
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
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    child: Stack(
                      children: [
                        PageView(
                          controller: pageController,
                          children: [
                            _cardVisit(),
                            _cardVisit(),
                            _cardTarget(),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
