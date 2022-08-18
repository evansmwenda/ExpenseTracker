import 'package:expense_tracker/common/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widgets/month_button.dart';
import '../../../widgets/my_month_picker.dart';
import 'stats_controller.dart';

class StatsView extends GetView<StatsController> {
  const StatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      color: Colors.grey.withOpacity(0.6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Stat",
            style: TextStyle(
              fontSize: 20.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 40.h,
            child: MyMonthPicker(),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 240.h,
            width: double.infinity,
            color: Colors.lightBlueAccent,
            child: const Text("Bar Chart Here"),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Expanded(
              child: StatsTypeContainer(
              title: "Income",
            subtitle: "KES 24503.20",
            icon: CupertinoIcons.arrow_left_to_line,
            bgColor: secondaryColor,
          ),
            ),
            SizedBox(
              width: 10.h,
            ),
            const Expanded(
              child: StatsTypeContainer(
                title: "Expense",
                subtitle: "KES 3503.20",
                icon: CupertinoIcons.arrow_right_to_line,
                bgColor: primaryColor,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

class StatsTypeContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color bgColor;
  const StatsTypeContainer({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.bgColor=secondaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        color: Colors.white,
      ),
      height: 160.h,
      padding: EdgeInsets.only(left: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 40.w,
            width: 40.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: bgColor,
            ),
            child: Center(
              child: Icon(
               icon,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
