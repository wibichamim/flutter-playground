import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../core/widgets/app_theme.dart';

class TargetCardWidget extends StatelessWidget {
  const TargetCardWidget({super.key});

  Widget _statTarget(int count, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircularPercentIndicator(
          radius: 25,
          percent: count / 100,
          center: Text(
            '$count%',
            style: AppTheme().textTheme.bodyText2?.copyWith(fontSize: 10),
          ),
          lineWidth: 5.0,
          progressColor: Colors.amber,
          backgroundColor: Colors.white,
        ),
        Text(
          title,
          style: AppTheme().textTheme.bodyText2?.copyWith(fontSize: 12),
        ),
      ],
    );
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
}
