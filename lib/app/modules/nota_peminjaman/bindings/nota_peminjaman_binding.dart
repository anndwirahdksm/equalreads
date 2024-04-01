import 'package:get/get.dart';

import '../controllers/nota_peminjaman_controller.dart';

class NotaPeminjamanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotaController>(
      () => NotaController(),
    );
  }
}
