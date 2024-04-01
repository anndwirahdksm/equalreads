import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:equalreads/app/routes/app_pages.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../../routes/app_pages.dart';
import '../controllers/detail_buku_controller.dart';

class DetailBukuView extends GetView<DetailBukuController> {
  const DetailBukuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail buku ${Get.parameters['judul'].toString()}',
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: controller.obx((state) =>
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              Container(
                                width: 120,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: state!.gambar != null
                                      ? DecorationImage(
                                    image: NetworkImage(state.gambar!),
                                    fit: BoxFit.cover,
                                  ) : null,
                                ),
                                child: Center(
                                  child: state.gambar == null ? Text(
                                    "No Cover",
                                  ) : null,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text(
                              state.judul ?? '',
                            ),
                            SizedBox(height: 5),
                            Text(
                              state.penulis ?? '',
                            ),
                            SizedBox(height: 5),
                            Text(
                              state.penerbit ?? '',
                            ),
                            SizedBox(height: 52),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {

                                    QuickAlert.show(

                                      context: context,
                                      type: QuickAlertType.confirm,
                                      title: 'Konfirmasi',
                                      titleColor: Colors.blue,
                                      text: 'Mau meminjam buku?',
                                      confirmBtnText: 'Iya',
                                      cancelBtnText: 'Enggak',
                                      confirmBtnColor: Colors.blue,
                                      onConfirmBtnTap: () {
                                        // Get.back();
                                        // QuickAlert.show(
                                        //   context: context,
                                        //   type: QuickAlertType.custom,
                                        //   barrierDismissible: true,
                                        //   customAsset: 'assets/giff/bgktg.gif',
                                        //   confirmBtnText: 'Pinjam',
                                        //   confirmBtnColor: Colors.blue,
                                        //   title: 'Isi form untuk meminjam',
                                        //   widget: Form(
                                        //     key: controller.formKey,
                                        //     child: Column(
                                        //       children: [
                                        //         TextFormField(
                                        //           controller: controller.tglKembaliController,
                                        //           decoration: InputDecoration(
                                        //             labelText: 'Tanggal Pengembalian',
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ),
                                        //   onConfirmBtnTap: () {
                                        //     Get.toNamed(Routes.NOTA);
                                        //     String? id = Get.parameters['id'];
                                        //     if (id != null) {
                                        //       controller.pinjam(int.parse(id));
                                        //     }
                                        //   }
                                        // );

                                        Get.back();
                                        Get.toNamed(Routes.MEMINJAM,
                                            parameters: {
                                              'id': state.idBuku.toString(),
                                              'judul': state.judul.toString(),
                                            }
                                        );
                                      },
                                    );

                                    // Get.defaultDialog(
                                    //   title: "Konfirmasi",
                                    //   middleText: "Mau meminjam buku?",
                                    //   textConfirm: "Iya",
                                    //   textCancel: 'enggak',
                                    //   confirmTextColor: Colors.white,
                                    //   cancelTextColor: Colors.red,
                                    //   buttonColor: Colors.blue,
                                    //   // onCancel: () {
                                    //   //   Get.back();
                                    //   // },
                                    //   onConfirm: () {
                                    //     Get.back();
                                    //     Get.toNamed(Routes.MEMINJAMN,
                                    //       parameters: {
                                    //         'id': state.bookID.toString(),
                                    //         'judul': state.judul.toString(),
                                    //       },
                                    //     );
                                    //   }
                                    // );
                                  },
                                  child: Text(
                                    "Pinjam",
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent), // Ubah warna latar belakang
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Ubah warna teks
                                    minimumSize: MaterialStateProperty.all<Size>(Size(93.0, 40.0)), // Mengatur tinggi minimum
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                // IconButton(
                                //   // key: controller.formKey,
                                //   onPressed: () {
                                //     String? id = Get.parameters['id'];
                                //     if (id != null) {
                                //       controller.post(int.parse(id));
                                //     }
                                //   },
                                //   icon: Icon(
                                //     Icons.bookmark_border_outlined,
                                //     size: 35,
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: [

                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // RatingBar.builder(
                        //   initialRating: 3,
                        //   minRating: 1,
                        //   direction: Axis.horizontal,
                        //   allowHalfRating: true,
                        //   itemCount: 5,
                        //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        //   itemBuilder: (context, _) => Icon(
                        //     Icons.star,
                        //     size: 5,
                        //     color: Colors.amber,
                        //   ),
                        //   onRatingUpdate: (rating) {
                        //     print(rating);
                        //   },
                        // ),
                        SizedBox(height: 5),
                        Text(
                          'Deskripsi',
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          state.deskripsi ?? '',
                        ),
                      ],
                    ),
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}