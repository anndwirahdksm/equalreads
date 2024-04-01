import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_detail.dart';
import '../../../data/provider/api_provider.dart';

class NotaController extends GetxController with StateMixin<DataDetail>{
  final loading = false.obs;

  final count = 0.obs;
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

  void increment() => count.value++;
}