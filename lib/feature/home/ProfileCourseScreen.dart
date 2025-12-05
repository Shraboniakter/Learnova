import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCourseScreen extends StatefulWidget {
  @override
  State<ProfileCourseScreen> createState() => _ProfileCourseScreenState();
}

class _ProfileCourseScreenState extends State<ProfileCourseScreen> {
  String currentSchool = "Diocesan Boys' School";
  String electiveSubject = "Diocesan Boys' School";
  String currentGrade = "Primary 5";
  String hearAboutUs = "Friends";

  final List<String> grades = ["Primary 5", "Primary 6", "Form 1", "Form 2"];
  final List<String> hearList = ["Friends", "Facebook", "YouTube", "School"];

  void openPicker(List<String> items, String currentValue, Function(String) onSelect) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Container(
          height: 250,
          child: CupertinoPicker(
            backgroundColor: Colors.white,
            itemExtent: 40,
            scrollController: FixedExtentScrollController(
              initialItem: items.indexOf(currentValue),
            ),
            onSelectedItemChanged: (index) {
              onSelect(items[index]);
            },
            children: items.map((e) => Center(child: Text(e))).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
              TextFormField(
                decoration: InputDecoration(
                  //labelText: "Email",
                  hintText: 'Diocesan Boys School',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: Color(0xffFFFFFF) ,// Border color
                      width: 1.5.h,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: Color(0xffF1F4F8),
                      width: 1.5.w,
                    ),
                  ),
                ),

              ),


              SizedBox(height: 20),

              // Elective
              buildLabel("Elective Subject"),
              TextFormField(
                decoration: InputDecoration(
                  //labelText: "Email",
                  hintText: 'Diocesan Boys School',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: Color(0xffFFFFFF) ,// Border color
                      width: 1.5.h,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: Color(0xffF1F4F8),
                      width: 1.5.w,
                    ),
                  ),
                ),

              ),


              SizedBox(height: 20),

              // Grade
              buildLabel("Current Grade"),
              buildDropdownBox(currentGrade, () {
                openPicker(grades, currentGrade, (value) {
                  setState(() => currentGrade = value);
                });
              }),

              SizedBox(height: 20),

              // Hear about us
              buildLabel("How Did You Hear About Us ?",),
              buildDropdownBox(hearAboutUs, () {
                openPicker(hearList, hearAboutUs, (value) {
                  setState(() => hearAboutUs = value);
                });
              }),

              Spacer(),
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
                  onPressed: () {},
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
    );
  }

  Widget buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.grey[700], fontSize: 14),
    );
  }

  Widget buildTextBox(String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(value, style: TextStyle(fontSize: 15)),
    );
  }

  Widget buildDropdownBox(String value, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(value, style: TextStyle(fontSize: 15)),
            Icon(Icons.keyboard_arrow_down)
          ],
        ),
      ),
    );
  }
}
