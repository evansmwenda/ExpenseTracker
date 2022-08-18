import 'package:expense_tracker/common/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'budget_controller.dart';

class BudgetView extends GetView<BudgetController> {
  const BudgetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      color: Colors.grey.withOpacity(0.6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Budget",
            style: TextStyle(
              fontSize: 20.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 40.h,
            width: double.infinity,
            color: Colors.green,
            child: const Text("Month picker here"),
          ),
          SizedBox(
            height: 10.h,
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
                  return const BudgetContainer(
                    title: "Food",
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class BudgetContainer extends StatelessWidget {
  final String title;
  final Color bgColor;
  const BudgetContainer({
    Key? key,
    required this.title,
    this.bgColor = secondaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        color: Colors.white,
      ),
      // height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15.h,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(
                  children: [
                     TextSpan(
                        text: 'KES 2,492',
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                    WidgetSpan(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                    ),
                    TextSpan(text: ' 70%',style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              Text(
                "KES 50,000",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
              alignment: Alignment.topCenter,
              child: LinearProgressIndicator(
                value: 0.7,
                //todo calculate color based on the percent value
                valueColor: AlwaysStoppedAnimation<Color>(bgColor),
              )
          ),
          SizedBox(
            height: 25.h,
          ),
          // LinearPercentIndicator(
          //   width: 140.0,
          //   lineHeight: 14.0,
          //   percent: 0.5,
          //   backgroundColor: Colors.grey,
          //   progressColor: Colors.blue,
          // ),
        ],
      ),
    );
  }
}
