import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../index.dart';
import 'Calendar.controller.dart';

class Calendar extends StatelessWidget {
  final CalendarController controller = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Card(
      margin: AppPadding.p0,
      shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.br24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TableCalendar(
              startingDayOfWeek: StartingDayOfWeek.monday,
              focusedDay: controller.selectedDay.value,
              firstDay: DateTime(2019),
              lastDay: DateTime(2119),
              selectedDayPredicate: (day) {
                return isSameDay(controller.selectedDay.value, day);
              },
              onDaySelected: (selected, focused) {
                controller.onDaySelected(selected);
              },
              headerStyle: HeaderStyle(
                titleTextStyle: AppTypography.subtitle.copyWith(fontWeight: FontWeight.w600),
                titleCentered: true,
                formatButtonVisible: false,
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: AppTypography.footnote,
                weekendStyle: AppTypography.footnote,
              ),
              calendarStyle: CalendarStyle(
                defaultTextStyle: AppTypography.footnote,
                weekendTextStyle: AppTypography.footnote,
                isTodayHighlighted: true,
                todayTextStyle: AppTypography.footnote,
                todayDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
                  ),
                ),
                //outside
                outsideTextStyle: AppTypography.footnote.copyWith(color: Theme.of(context).disabledColor),
                //selected
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary,
                ),
                selectedTextStyle: AppTypography.footnote.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
            const Divider(),
            Padding(
              padding: AppPadding.p8,
              child: FilledButton.tonal(
                onPressed: (){},
                child: Text('showHistory'.tr),
              ),
            )
          ],
        ),
      ));
  }
}
