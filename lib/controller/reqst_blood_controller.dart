import 'package:get/get.dart';

class RequestBlood_Controller extends GetxController {
  var selectedIndex = 0.obs;

  selectBlood(int index, List bd) {
    selectedIndex.value = index;
    print("you selected :${bd[index]}");
  }
}
