import 'package:get/get.dart';

import '../controllers/meminjam_controller.dart';

class MeminjamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MeminjamController>(
      () => MeminjamController(),
    );
  }
}
