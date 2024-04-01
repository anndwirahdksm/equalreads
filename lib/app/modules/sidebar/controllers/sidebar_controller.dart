import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SidebarController extends GetxController {
  //TODO: Implement SidebarController
  var tabIndex = 0;

  final count = 0.obs;

  void changeTabIndex(int index){
    tabIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  navigateToPage(int index) {
    if (index == 0) {
      Get.toNamed(Routes.HOME);
    } else if (index == 1) {
      Get.toNamed(Routes.PROFILE);
    } else if (index == 2) {
      Get.toNamed(Routes.RIWAYAT);
    }
  }

  void increment() => count.value++;
}
