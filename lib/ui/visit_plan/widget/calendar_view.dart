import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_playground/gen/assets.gen.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key, this.selectedDate});

  final Function(DateTime)? selectedDate;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final TextStyle bold_14 = Theme.of(context).textTheme.headline6!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        );

    final TextStyle body_14 = Theme.of(context).textTheme.bodyText2!.copyWith(
          fontSize: 14,
        );

    return CalendarCarousel(
      leftButtonIcon: Assets.images.icArrowLeft.image(),
      rightButtonIcon:
          RotatedBox(quarterTurns: 2, child: Assets.images.icArrowLeft.image()),
      headerTextStyle: bold_14,
      weekdayTextStyle: bold_14,
      daysTextStyle: body_14.copyWith(
        color: Colors.black,
      ),
      weekendTextStyle: body_14.copyWith(
        color: Colors.red,
      ),
      todayTextStyle: body_14.copyWith(
        color: Colors.white,
      ),
      selectedDayTextStyle: body_14.copyWith(
        color: Colors.white,
      ),
      todayButtonColor: Colors.amber,
      onDayPressed: (date, list) {
        widget.selectedDate?.call(date);
        _selectedDate = date;
        setState(() {});
      },
      selectedDateTime: _selectedDate,
    );
  }
}
