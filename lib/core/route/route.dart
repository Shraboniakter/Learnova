import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untitled3/feature/auth/CreateAccountScreen.dart';
import 'package:untitled3/feature/auth/LoginScreen.dart';
import 'package:untitled3/feature/home/ProfileCourseScreen.dart';

class AppRoutes{

static const String login = "/login";
static const String createScreen = "/createScreen";
static const String profileCourseScreen ="/profileCourseScreen";



final List<GetPage> pages=[
  GetPage(name: login, page: ()=> Loginscreen()),
  GetPage(name: createScreen, page: ()=> CreateAccountScreen()),
  GetPage(name: profileCourseScreen, page: ()=> ProfileCourseScreen()),

];




}