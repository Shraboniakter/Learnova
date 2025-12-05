import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/route/route.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool isStudent = true;

  bool obscurePass = true;
  bool obscureConfirmPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F4F8),
      body: Column(
        children: [
          // ================= TOP IMAGE AREA =================
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                ClipRRect(
                  child: Image.asset(
                    "assets/images/Rectangle 3619.png",
                    width: double.infinity.w,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 83,
                  left: 88,
                  child: Image.asset(
                    "assets/images/Group 48914.png",
                    height: 70.15.h,
                    width: 253.w,
                  ),
                ),
              ],
            ),
          ),

          // ================= LOGIN UI START =================
          Expanded(
            flex: 16,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.h),

                  // Log In Title
                  const Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // ---------- STUDENT / TEACHER TOGGLE ----------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => isStudent = true),
                        child: Column(
                          children: [
                            Text(
                              "Student",
                              style: TextStyle(
                                fontSize: 16,
                                color:
                                isStudent ? Color(0xff023F86) :Color(0xff727477),
                                fontWeight: isStudent
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Container(
                              width: 70.w,
                              height: 2.h,
                              color: isStudent
                                  ? Color(0xff023F86)
                                  : Colors.transparent,
                            )
                          ],
                        ),
                      ),

                      SizedBox(width: 40.w),

                      GestureDetector(
                        onTap: () => setState(() => isStudent = false),
                        child: Column(
                          children: [
                            Text(
                              "Teacher",
                              style: TextStyle(
                                fontSize: 16,
                                color: !isStudent
                                    ? Color(0xff023F86)
                                    : Color(0xff727477),
                                fontWeight: !isStudent
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Container(
                              width: 70.w,
                              height: 2.h,
                              color: !isStudent
                                  ? Color(0xff023F86)
                                  : Colors.transparent,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 25.h),

                  // ---------- EMAIL FIELD ----------
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.r),
                    child: TextFormField(
                      decoration: InputDecoration(
                        //labelText: "Email",
                        hintText: 'John Doe',
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
                  ),


                  SizedBox(height: 15.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.r),
                    child: TextFormField(
                      decoration: InputDecoration(
                        //labelText: "Email",
                        hintText: 'JohnDoe@gmail.com',
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
                  ),



                  SizedBox(height: 15.h),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 25.r),
                    child: TextFormField(
                      obscureText: obscurePass,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(obscurePass
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () =>
                              setState(() => obscurePass = !obscurePass),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xffFFFFFF) ,// Border color
                            width: 1.5.w,
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
                  ),



                  SizedBox(height: 15.h),


                  // ---------- PASSWORD FIELD ----------
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 25.r),
                    child: TextFormField(
                      obscureText:  obscureConfirmPass,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(obscureConfirmPass
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () =>
                              setState(() =>  obscureConfirmPass= ! obscureConfirmPass,),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xffFFFFFF) ,// Border color
                            width: 1.5.w,
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
                  ),



                  SizedBox(height: 15.h),

                  // ---------- LOGIN BUTTON ----------
                  SizedBox(
                    width: 390,
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
                        "Log In",
                        style: TextStyle(fontSize: 18.spMin, color: Colors.white),
                      ),
                    ),
                  ),

                  SizedBox(height: 15.h),

                  // ---------- GOOGLE LOGIN ----------
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 25.r),
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Color(0xffF1F4F8)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/Google.png", height: 22),
                          SizedBox(width: 10.w),
                          const Text("Login with Google"),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // ---------- CREATE ACCOUNT ----------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      InkWell(
                        onTap: (){
                          Get.offAllNamed(AppRoutes.login);
                        },
                        child: Text(
                          " Log In",
                          style: TextStyle(
                            color:Color(0xff008DE7),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
