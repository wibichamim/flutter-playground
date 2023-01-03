import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_playground/core/widgets/app_colors.dart';
import 'package:flutter_playground/gen/assets.gen.dart';

class VisitCard extends StatelessWidget {
  const VisitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  Text(
                    'Sat, 19 Dec 2022, 08:00',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontSize: 10),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Assets.images.icCalendarSmall.image(),
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Assets.images.illLocation.image(),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Crocodic Tower',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          'Jl.AH Nasution No.31',
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    color: AppColors.textBlack,
                                  ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Assets.images.icCallGrey.image(),
                                  const SizedBox(
                                    width: 4.0,
                                  ),
                                  Text(
                                    '0858031328266',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        ?.copyWith(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Assets.images.icCalendarGrey.image(),
                                  const SizedBox(
                                    width: 4.0,
                                  ),
                                  Text(
                                    'Meeting',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        ?.copyWith(fontSize: 10),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
