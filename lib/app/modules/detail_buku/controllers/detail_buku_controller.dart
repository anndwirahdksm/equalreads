import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_detail.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class DetailBukuController extends GetxController with StateMixin<DataDetail>{
  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isBookmarked = false;
  final TextEditingController tglKembaliController = TextEditingController();


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // pinjam(int id) async {
  //   loading(true);
  //   try {
  //     int? userId = int.tryParse(StorageProvider.read(StorageKey.idUser) ?? "");
  //     FocusScope.of(Get.context!).unfocus(); //ngeclose keyboard
  //     formKey.currentState?.save();
  //     if(formKey.currentState!.validate()) {
  //       final tglKembali = tglKembaliController.text;
  //
  //       final response = await ApiProvider.instance().post(Endpoint.peminjaman,
  //           data:
  //           {
  //             "UserID": userId,
  //             "BookID": id,
  //             "TglPengembalian": tglKembali,
  //           });
  //       if (response.statusCode == 201) {
  //         QuickAlert.show(
  //           context: Get.context!,
  //           type: QuickAlertType.success,
  //           confirmBtnText: 'OK',
  //           title: 'Berhasil',
  //           titleColor: Colors.blue,
  //           text: 'Kamu berhasil meminjam buku',
  //         );
  //       } else {
  //         Get.snackbar("Sorry", "Gagal meminjam", backgroundColor: Colors.orange);
  //       }
  //     }
  //
  //   } on DioException catch (e){
  //     loading(false);
  //     if (e.response != null) {
  //       if (e.response?.data != null) {
  //         QuickAlert.show(
  //           context: Get.context!,
  //           type: QuickAlertType.error,
  //           title: 'Gagal',
  //           titleColor: Colors.red,
  //           text: '${e.response?.data['message']}',
  //           confirmBtnText: 'OK',
  //           confirmBtnColor: Colors.red,
  //         );
  //       }
  //     } else {
  //       Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
  //     }
  //   } catch (e) {
  //     loading(false);
  //     Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
  //   }
  // }

  // post(int id) async {
  //   loading(true);
  //   try {
  //     int? userId = int.tryParse(StorageProvider.read(StorageKey.idUser) ?? "");
  //
  //     final response = await ApiProvider.instance().post(Endpoint.addkol,
  //         data:
  //         {
  //           "UserID": userId,
  //           "BookID": id,
  //         });
  //     if (response.statusCode == 201) {
  //       Get.snackbar("Selamat", "Berhasil menambah koleksi", backgroundColor: Colors.blue);
  //       isBookmarked = true;
  //     } else {
  //       Get.snackbar("Sorry", "Gagal menambah koleksi", backgroundColor: Colors.orange);
  //     }
  //   } on DioException catch (e){
  //     loading(false);
  //     if (e.response != null) {
  //       if (e.response?.data != null) {
  //         Get.snackbar("Sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
  //       }
  //     } else {
  //       Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
  //     }
  //   } catch (e) {
  //     loading(false);
  //     Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
  //   }
  // }

  //==========================================delete koleksi=================================================

  // delete(int id) async {
  //   loading(true);
  //   try {
  //     final response = await ApiProvider.instance().delete('${Endpoint.deletekol}?id=$id');
  //     if (response.statusCode == 201) {
  //       Get.snackbar("Selamat", "Berhasil menghapus koleksi", backgroundColor: Colors.blue);
  //       // Ubah status bookmark menjadi outline
  //       isBookmarked = false;
  //     } else {
  //       Get.snackbar("Sorry", "Gagal menghapus koleksi", backgroundColor: Colors.orange);
  //     }
  //   } on DioException catch (e) {
  //     loading(false);
  //     if (e.response != null) {
  //       if (e.response?.data != null) {
  //         Get.snackbar("Sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
  //       }
  //     } else {
  //       Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
  //     }
  //   } catch (e) {
  //     loading(false);
  //     Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
  //   }
  // }

  //==========================================get data detail buku=============================================

  Future<void> getData () async {
    change(null, status: RxStatus.loading());
    var idBuku = Get.parameters['id'];
    try {
      final response = await ApiProvider.instance().get("${Endpoint.buku}?id=$idBuku");
      if (response.statusCode == 200) {
        final ResponseDetail responseDetail = ResponseDetail.fromJson(response.data);
        if(responseDetail.data == null) {
          change(null, status: RxStatus.empty());
        }else {
          change(responseDetail.data, status: RxStatus.success());
        }
      }else{
        change(null, status: RxStatus.error("gagal mengambil data"));
      }

    }on DioException catch (e){
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      }else{
        change(null, status: RxStatus.error(e.message ?? ""));

      }
    }catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void increment() => count.value++;
}
