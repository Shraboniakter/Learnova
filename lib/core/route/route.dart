import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untitled3/feature/auth/CreateAccountScreen.dart';
import 'package:untitled3/feature/auth/LoginScreen.dart';
import 'package:untitled3/feature/home/HomeScreen.dart';
import 'package:untitled3/feature/home/ProfileCourseScreen.dart';
import 'package:untitled3/feature/home/SearchScreen.dart';
import 'package:untitled3/feature/home/bottom_nav_screen/BhomeScreen.dart';
import 'package:untitled3/feature/home/bottom_nav_screen/BookScreen.dart';
import 'package:untitled3/feature/home/bottom_nav_screen/LightScreen.dart';
import 'package:untitled3/feature/home/bottom_nav_screen/ProfileScreen.dart';
import 'package:untitled3/feature/home/bottom_nav_screen/ReelScreen.dart';

class AppRoutes{

static const String login = "/login";
static const String createScreen = "/createScreen";
static const String profileCourseScreen ="/profileCourseScreen";
static const String searchScreen ="/searchScreen";
static const String homeScreen ="/homeScreen";
static const String bhomeScreen ="/bhomeScreen";
static const String bookScreen ="/bookScreen";
static const String lightScreen ="/lightScreen";
static const String profileScreen ="/profileScreen";
static const String reelScreen ="/reelScreen";


final List<GetPage> pages=[
  GetPage(name: login, page: ()=> Loginscreen()),
  GetPage(name: createScreen, page: ()=> CreateAccountScreen()),
  GetPage(name: profileCourseScreen, page: ()=> ProfileCourseScreen()),
  GetPage(name:searchScreen, page: ()=> SearchScreen()),
  GetPage(name:homeScreen, page: ()=> HomeScreen()),
  GetPage(name: bhomeScreen, page: ()=> BhomeScreen()),
  GetPage(name: bookScreen, page: ()=> BookScreen()),
  GetPage(name: lightScreen, page: ()=> LightScreen()),
  GetPage(name: profileScreen, page: ()=> ProfileScreen()),
  GetPage(name:reelScreen, page: ()=> ReelScreen()),
];




}