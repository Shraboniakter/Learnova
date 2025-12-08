import 'package:get/get.dart';

class BottomNavController extends GetxController {
  RxInt selectedIndexs = 2.obs;

  void changePage(int index) {
    selectedIndexs.value = index;
  }
}