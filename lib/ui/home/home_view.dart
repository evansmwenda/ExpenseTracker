import 'package:expense_tracker/common/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import 'tabs/daily/daily_view.dart';
import 'tabs/stats/stats_view.dart';
import 'tabs/budget/budget_view.dart';
import 'tabs/profile/profile_view.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final pages = [
    DailyView(),
    StatsView(),
    BudgetView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => pages[controller.tabIndex],
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Expanded(
              child: BottomNavItem(
                title: "Daily",
                activeIcon: CupertinoIcons.calendar,
                index: 0,
              ),
            ),
            Expanded(
              child: BottomNavItem(
                title: "Stats",
                activeIcon: CupertinoIcons.chart_bar_alt_fill,
                index: 1,
              ),
            ),
            Expanded(
              child: BottomNavItem(
                title: "Budget",
                activeIcon: Icons.account_balance_wallet,
                index: 2,
              ),
            ),
            Expanded(
              child: BottomNavItem(
                title: "Profile",
                activeIcon: CupertinoIcons.profile_circled,
                index: 3,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {},
        child: const Center(
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    required this.index,
    required this.title,
    required this.activeIcon,
  }) : super(key: key);

  final int index;
  final String title;
  final IconData activeIcon;

  @override
  Widget build(BuildContext context) {
    final HomeController c = Get.find();
    return InkWell(
        onTap: () => c.changeIndex(index: index),
        child: Obx(
          () => Container(
              margin: const EdgeInsets.only(
                left: 10,
                right: 10,
              ).r,
              padding: EdgeInsets.only(top: 6.h),
              height: 60.h,
              child: Column(
                children: [
                  Icon(
                    activeIcon,
                    color: c.tabIndex == index
                        ? primaryColor
                        : const Color(0xFFB0A9A9),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: c.tabIndex == index
                            ? primaryColor
                            : const Color(0xFFB0A9A9),
                        fontWeight: FontWeight.w700,
                        fontSize: 11.sp),
                  ),
                ],
              )),
        ));
  }
}
