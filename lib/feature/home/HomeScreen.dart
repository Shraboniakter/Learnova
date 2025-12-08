import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled3/core/route/route.dart';
import 'package:untitled3/feature/home/bottom_nav_screen/BhomeScreen.dart';
import 'package:untitled3/feature/home/bottom_nav_screen/BookScreen.dart';
import 'package:untitled3/feature/home/bottom_nav_screen/LightScreen.dart';
import 'package:untitled3/feature/home/bottom_nav_screen/ProfileScreen.dart';
import 'package:untitled3/feature/home/bottom_nav_screen/ReelScreen.dart';
import 'bottom_nav_screen/controller/bottom_nav_controller.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> pages = [
    BhomeScreen(),
    ReelScreen(),
    LightScreen(),
    BookScreen(),
    ProfileScreen(),
  ];

  final List<IconData> icons = [
    Icons.home_filled,
    Icons.video_collection,
    Icons.lightbulb,
    Icons.menu_book,
    Icons.person_outline,
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Learn Through Watching Reels",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: InkWell(
              onTap: () {
                Get.offAllNamed(AppRoutes.searchScreen);
              },
              child: const Icon(CupertinoIcons.search, size: 30),
            ),
          )
        ],
      ),

      // ---------------- BODY FIXED (No ScrollView) ----------------
      body: Column(
        children: [
          SizedBox(height: 10),

          // TAB MENU
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              tabItem("Trending", 0),
              SizedBox(width: 40.w),
              tabItem("New", 1),
              SizedBox(width: 40.w),
              tabItem("Following", 2),
            ],
          ),

          SizedBox(height: 10),

          // EXPANDED PAGE VIEW
          Expanded(
            child: Obx(() =>
            widget.pages[widget.controller.selectedIndexs.value]),
          ),
        ],
      ),

      // ---------------- BOTTOM NAV ----------------
      bottomNavigationBar: Container(
        width: 430,
        height: 74,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(5, (index) {
              final isSelected =
                  widget.controller.selectedIndexs.value == index;

              return GestureDetector(
                onTap: () => widget.controller.changePage(index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.icons[index],
                      color: isSelected ? Colors.blue : Colors.grey,
                      size: 26,
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              );
            }),
          );
        }),
      ),
    );
  }

  // ---------------- TAB ITEM WIDGET ----------------
  Widget tabItem(String title, int index) {
    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color:
              selectedIndex == index ? Color(0xff023F86) : Color(0xff727477),
              fontWeight:
              selectedIndex == index ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            width: 70.w,
            height: 2.h,
            color:
            selectedIndex == index ? Color(0xff023F86) : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
