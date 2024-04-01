/// message : "Buku found successfully"
/// total : 1
/// data : [{"id_buku":2,"judul":"dilan 1991","deskripsi":"dilan adalah sama","penulis":"pidi baiq","penerbit":"erlangga","tahunterbit":"2019","jumlahhalaman":202,"gambar":null}]

class ResponseBuku {
  ResponseBuku({
      this.message, 
      this.total, 
      this.data,});

  ResponseBuku.fromJson(dynamic json) {
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataBuku.fromJson(v));
      });
    }
  }
  String? message;
  int? total;
  List<DataBuku>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['total'] = total;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id_buku : 2
/// judul : "dilan 1991"
/// deskripsi : "dilan adalah sama"
/// penulis : "pidi baiq"
/// penerbit : "erlangga"
/// tahunterbit : "2019"
/// jumlahhalaman : 202
/// gambar : null

class DataBuku {
  DataBuku({
      this.idBuku, 
      this.judul, 
      this.deskripsi, 
      this.penulis, 
      this.penerbit, 
      this.tahunterbit, 
      this.jumlahhalaman, 
      this.gambar,});

  DataBuku.fromJson(dynamic json) {
    idBuku = json['id_buku'];
    judul = json['judul'];
    deskripsi = json['deskripsi'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    tahunterbit = json['tahunterbit'];
    jumlahhalaman = json['jumlahhalaman'];
    gambar = json['gambar'];
  }
  int? idBuku;
  String? judul;
  String? deskripsi;
  String? penulis;
  String? penerbit;
  String? tahunterbit;
  int? jumlahhalaman;
  dynamic gambar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_buku'] = idBuku;
    map['judul'] = judul;
    map['deskripsi'] = deskripsi;
    map['penulis'] = penulis;
    map['penerbit'] = penerbit;
    map['tahunterbit'] = tahunterbit;
    map['jumlahhalaman'] = jumlahhalaman;
    map['gambar'] = gambar;
    return map;
  }

}