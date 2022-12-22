import 'package:flutter/material.dart';

import '../../../core/widgets/app_theme.dart';

class StatCardWidget extends StatelessWidget {
  const StatCardWidget({super.key});

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
            Text(
              title,
              style: AppTheme().textTheme.bodyText2?.copyWith(fontSize: 12),
            ),
            Text(
              count,
              style: AppTheme().textTheme.bodyText2?.copyWith(fontSize: 12),
            ),
          ],
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
              'Visit Data',
              style: AppTheme().textTheme.bodyText2?.copyWith(fontSize: 12),
            ),
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
}
