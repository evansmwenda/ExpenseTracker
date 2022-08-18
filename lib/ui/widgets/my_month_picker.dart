import 'package:expense_tracker/core/models/month.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'month_button.dart';

class MyMonthPicker extends StatelessWidget {
  MyMonthPicker({Key? key}) : super(key: key);

  final List<Month> myMonths = [
    Month(
      title: "Jan",
      index: 0,
    ),
    Month(
      title: "Feb",
      index: 1,
    ),
    Month(
      title: "Mar",
      index: 2,
    ),
    Month(
      title: "Apr",
      index: 3,
    ),
    Month(
      title: "May",
      index: 4,
    ),
    Month(
      title: "Jun",
      index: 5,
    ),
    Month(
      title: "Jul",
      index: 6,
    ),
    Month(
      title: "Aug",
      index: 7,
    ),
    Month(
      title: "Sep",
      index: 8,
    ),
    Month(
      title: "Oct",
      index: 9,
    ),
    Month(
      title: "Nov",
      index: 10,
    ),
    Month(
      title: "Dec",
      index: 11,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: myMonths.length,
          itemBuilder: (BuildContext context, int index) {
            return MonthButton(
                title: myMonths.elementAt(index).title,
                index: myMonths.elementAt(index).index);
          }),
    );
  }
}
