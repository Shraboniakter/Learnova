import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled3/core/binding/binding.dart';
import 'package:untitled3/core/route/route.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(378,812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (__,child){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,

            initialRoute: AppRoutes.login,
           // initialBinding: AppBinding(),
            getPages: AppRoutes().pages
        );
      },

    );
  }
}
