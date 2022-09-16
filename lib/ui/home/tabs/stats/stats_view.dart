import 'package:expense_tracker/common/my_colors.dart';
import 'package:fl_chart/fl_chart.dart';
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
    var size = MediaQuery.of(context).size;

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
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.01),
                    spreadRadius: 10,
                    blurRadius: 3,
                    // changes position of shadow
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Net balance",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xff67727d)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "\$2446.90",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      width: (size.width - 20),
                      height: 150,
                      child: LineChart(
                        mainData(),
                      ),
                    ),
                  )
                ],
              ),),
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
  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 0.1,
            );
          }),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            // getTextStyles: (value,meta) =>
            // const TextStyle(color: Color(0xff68737d), fontSize: 12),
            getTitlesWidget: (value,meta) {
              switch (value.toInt()) {
                case 2:
                  return Text('1');
                case 5:
                  return Text('11');
                case 8:
                  return Text('21');
              }
              return Text('');
            },
           // margin: 8,
          ),
        ),


          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              // reservedSize: 22,
              // getTextStyles: (value) => const TextStyle(
              //   color: Color(0xff67727d),
              //   fontSize: 12,
              // ),
              getTitlesWidget: (value,meta) {
                switch (value.toInt()) {
                  case 1:
                    return Text('10k');
                  case 3:
                    return Text('50k');
                  case 5:
                    return Text('100k');
                }
                return Text('');
              },
              // margin: 8,
            ),
          ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          color: Colors.black,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
        ),
      ],
    );}
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
