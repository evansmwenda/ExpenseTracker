import 'package:expense_tracker/common/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

import 'daily_controller.dart';

class DailyView extends GetView<DailyController> {
  const DailyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      color: const Color(0xfff5f5f5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Daily transaction",
            style: TextStyle(
              fontSize: 20.sp,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Obx(() =>WeeklyDatePicker(
              selectedDay: controller.selectedDay,
              changeDay: (value) {
                controller.changeSelectedDay(value);
              },
              enableWeeknumberText: false,
              backgroundColor: Colors.white,
              weekdayTextColor: const Color(0xFF8A8A8A),
              selectedBackgroundColor: primaryColor,
              weekdays: const ["Mo", "Tu", "We", "Th", "Fr","Sa","Su"],
              daysInWeek: 7,
            )),
          ),
          SizedBox(
            height: 30.h,
          ),
          Expanded(
            child: ListView.separated(
                itemCount: 15,
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey.withOpacity(0.5),
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    leading: Container(
                      height: 40.w,
                      width: 40.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        color: primaryColor,
                      ),
                      child: const Center(
                        child: Icon(
                          CupertinoIcons.arrow_3_trianglepath,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    trailing: const Text(
                      "\$ 340.40",
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    title: Text("Lia Castro $index"),
                    subtitle: Text("Fri 10AM"),
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Total",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
              Text(
                "KES 3400",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              )
            ],
          ),
        ],
      ),
    );
  }
}
