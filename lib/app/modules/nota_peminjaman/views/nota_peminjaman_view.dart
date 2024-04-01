import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../routes/app_pages.dart';
import '../controllers/nota_peminjaman_controller.dart';

class NotaView extends GetView<NotaController> {
  const NotaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Nota Peminjaman'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 35),
              SizedBox(height: 20),
              Container(
                width: 340,
                height: 360,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 50, left: 20, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Judul : '),
                          SizedBox(width: 105),
                          // Flexible(
                          //   child: Text(
                          //     'ini judul buku yang panjang',
                          //   ),
                          // ),
                          Flexible(
                            child: Text(
                              Get.parameters['Judul'] ?? '',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Text('Nama Peminjam : '),
                          SizedBox(width: 35),
                          // Flexible(
                          //   child: Text(
                          //     'ini nama yang panjang',
                          //     style: regularFont2,
                          //   ),
                          // ),
                          Flexible(
                            child: Text(
                              Get.parameters['Namalengkap'] ?? ''
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Text('Tanggal Pinjam : '),
                          SizedBox(width: 42),
                          // Text('2024-03-02', style: regularFont2,),
                          Flexible(
                            child: Text(
                              Get.parameters['TglPeminjaman'] ?? '',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Text('Tanggal Kembali : '),
                          SizedBox(width: 32),
                          // Text('2024-03-20', style: regularFont2,),
                          Flexible(
                            child: Text(
                              Get.parameters['TglPengembalian'] ?? '',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Flexible(
                        child: Text(
                          '*tunjukkan nota pada petugas perpustakaan saat pengambilan buku'
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    title: 'Keluar?',
                    titleColor: Colors.blue,
                    text: 'jangan lupa screenshoot jika belum mengambil buku!',
                    textAlignment: TextAlign.center,
                    confirmBtnText: 'Sudah',
                    cancelBtnText: 'Cancel',
                    onConfirmBtnTap: () {
                      Get.back();
                      Get.toNamed(Routes.HOME);
                    }
                );
              },
                child: Text(
                  'Kembali'
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Ubah warna latar belakang
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Ubah warna teks
                  minimumSize: MaterialStateProperty.all<Size>(Size(80.0, 50.0)), // Mengatur tinggi minimum
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}