import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled3/core/route/route.dart';

class ProfileCourseScreen extends StatefulWidget {
  @override
  State<ProfileCourseScreen> createState() => _ProfileCourseScreenState();
}

class _ProfileCourseScreenState extends State<ProfileCourseScreen> {
  String currentSchool = "Diocesan Boys' School";
  String electiveSubject = "Diocesan Boys' School";

  String currentGrade = "Primary 5";
  String hearAboutUs = "Friends";

  bool gradeExpanded = false;
  bool hearExpanded = false;

  final List<String> grades = ["Primary 5", "Primary 6", "Form 1", "Form 2"];
  final List<String> hearList = ["Friends", "Facebook", "YouTube", "School"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Personalizing course\naccording to your profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),

                SizedBox(height: 20),

                // Current School
                buildLabel("Current School"),
                buildTextField(currentSchool),

                SizedBox(height: 20),

                // Elective
                buildLabel("Elective Subject"),
                buildTextField(electiveSubject),

                SizedBox(height: 20),

                // CURRENT GRADE
                buildLabel("Current Grade"),
                buildExpandableDropdown(
                  selected: currentGrade,
                  expanded: gradeExpanded,
                  list: grades,
                  onTap: () {
                    setState(() {
                      gradeExpanded = !gradeExpanded;
                      hearExpanded = false; // close other dropdown
                    });
                  },
                  onSelect: (value) {
                    setState(() {
                      currentGrade = value;
                      gradeExpanded = false;
                    });
                  },
                ),

                SizedBox(height: 20),

                // HEAR ABOUT US
                buildLabel("How Did You Hear About Us ?"),
                buildExpandableDropdown(
                  selected: hearAboutUs,
                  expanded: hearExpanded,
                  list: hearList,
                  onTap: () {
                    setState(() {
                      hearExpanded = !hearExpanded;
                      gradeExpanded = false; // close other dropdown
                    });
                  },
                  onSelect: (value) {
                    setState(() {
                      hearAboutUs = value;
                      hearExpanded = false;
                    });
                  },
                ),

                SizedBox(height: 40),

                SizedBox(
                  width: 400,
                  height: 56.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff1153A0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.homeScreen);
                    },
                    child: Text(
                      "Get Started",
                      style: TextStyle(fontSize: 16.spMin, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // LABEL
  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: TextStyle(color: Colors.grey[700], fontSize: 14),
      ),
    );
  }

  // NORMAL TEXT FIELD
  Widget buildTextField(String value) {
    return TextFormField(
      initialValue: value,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: value,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Color(0xffFFFFFF), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Color(0xffF1F4F8), width: 1.5),
        ),
      ),
    );
  }

  // EXPANDABLE DROPDOWN
  Widget buildExpandableDropdown({
    required String selected,
    required bool expanded,
    required List<String> list,
    required Function() onTap,
    required Function(String) onSelect,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selected),
                Icon(
                  expanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
              ],
            ),
          ),
        ),

        // EXPANDED LIST WITH DIVIDERS
        if (expanded)
          Container(
            margin: EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              children: [
                for (int i = 0; i < list.length; i++) ...[
                  InkWell(
                    onTap: () => onSelect(list[i]),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      alignment: Alignment.center,
                      child: Text(list[i]),
                    ),
                  ),

                  if (i != list.length - 1)
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey.shade200,
                      indent: 0,
                      endIndent: 0,
                    ),
                ]
              ],
            ),
          ),
      ],
    );
  }
}
