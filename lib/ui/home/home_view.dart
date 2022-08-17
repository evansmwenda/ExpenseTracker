import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

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
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:  const [
            Expanded(
              child: BottomNavItem(
                title: "Dashboard",
                activeIcon: Icons.dashboard,
                index: 0,
              ),
            ),
            Expanded(
              child: BottomNavItem(
                title: "Services",
                activeIcon: CupertinoIcons.envelope_open,
                index: 1,
              ),
            ),
            Expanded(
              child: BottomNavItem(
                title: "My Documents",
                activeIcon: CupertinoIcons.doc_text,
                index: 2,
              ),
            ),
            Expanded(
              child: BottomNavItem(
                title: "My Profile",
                activeIcon: CupertinoIcons.profile_circled,
                index: 3,
              ),
            ),
          ],
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
                        ? const Color(0xff4232E3)
                        : const Color(0xFF3F3F3F),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: c.tabIndex == index
                            ? const Color(0xff4232E3)
                            : const Color(0xFF3F3F3F),
                        fontWeight: FontWeight.w700,
                        fontSize: 11.sp),
                  ),
                ],
              )),
        ));
  }
}