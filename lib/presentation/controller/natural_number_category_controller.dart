import 'package:get/get.dart';

class NaturalNumberController extends GetxController {
  NaturalNumberController();

  final selectedIndex = 0.obs;
  

  void updateSelected(int selected) {
    selectedIndex.value = selected;
  }
}
