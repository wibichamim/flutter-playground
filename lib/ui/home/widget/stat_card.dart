import 'package:flutter/material.dart';
import 'package:flutter_playground/core/data/model/home_card_item.dart';
import 'package:flutter_playground/gen/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/app_theme.dart';

class StatCardWidget extends StatelessWidget {
  final String cardTitle;
  final List<HomeCardItem> listItem;
  const StatCardWidget(
      {super.key, required this.cardTitle, required this.listItem});

  Widget _statContent(int position, Image icon, String title, String count) {
    return Builder(builder: (context) {
      return Row(
        children: [
          if (position != 0)
            const VerticalDivider(
              color: Colors.green,
              thickness: 2,
              width: 30,
              endIndent: 15,
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(image: icon.image),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontSize: 11,
                    ),
              ),
              Text(
                count,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                    ),
              ),
            ],
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
              cardTitle,
              style: AppTheme().textTheme.bodyText2?.copyWith(fontSize: 12),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(listItem.length, (index) {
                  HomeCardItem item = listItem[index];
                  return _statContent(index, item.icon, item.label, item.count);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
