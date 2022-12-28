import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../core/widgets/app_theme.dart';

class TargetCardWidget extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  const TargetCardWidget({super.key, required this.items});

  Widget _statTarget(int count, String title) {
    return Builder(builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularPercentIndicator(
            radius: 20,
            percent: count / 100,
            center: Text(
              '$count%',
              style: AppTheme().textTheme.bodyText2?.copyWith(fontSize: 10),
            ),
            lineWidth: 3.0,
            progressColor: Colors.amber,
            backgroundColor: Colors.white,
          ),
          Text(
            title,
            style:
                Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 11),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green.shade800,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Target',
              style: AppTheme().textTheme.bodyText2?.copyWith(fontSize: 12),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  items.length,
                  (index) => _statTarget(
                    items[index]['count'],
                    items[index]['label'],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
