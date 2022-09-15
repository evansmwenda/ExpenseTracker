import 'package:expense_tracker/common/my_colors.dart';
import 'package:expense_tracker/ui/home/tabs/stats/stats_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MonthButton extends GetView<StatsController> {
  final String title;
  final int index;
  const MonthButton({Key? key,required this.title,required this.index,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.changeMonthIndex(index: index),
      child: Obx(
        () => Container(
          height: 32.h,
          width: 60.w,
          margin: EdgeInsets.only(right: 10.w),
          decoration: BoxDecoration(
            color: controller.tabIndex == index ? primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: controller.tabIndex == index
                    ? Colors.white
                    : const Color(0xff2F2E2F).withOpacity(0.6),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
