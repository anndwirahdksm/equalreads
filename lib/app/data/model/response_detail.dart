/// message : "Book found successfully"
/// data : {"id_buku":2,"judul":"dilan 1990","deskripsi":"dilan yang sama","penulis":"pidi baiq","penerbit":"erlangga","tahunterbit":"2019","gambar":"https://ebooks.gramedia.com/ebook-covers/31754/big_covers/ID_MIZ2016MTH03DDADT_B.jpg","jumlahhalaman":202}

class ResponseDetail {
  ResponseDetail({
      this.message, 
      this.data,});

  ResponseDetail.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? DataDetail.fromJson(json['data']) : null;
  }
  String? message;
  DataDetail? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// id_buku : 2
/// judul : "dilan 1990"
/// deskripsi : "dilan yang sama"
/// penulis : "pidi baiq"
/// penerbit : "erlangga"
/// tahunterbit : "2019"
/// gambar : "https://ebooks.gramedia.com/ebook-covers/31754/big_covers/ID_MIZ2016MTH03DDADT_B.jpg"
/// jumlahhalaman : 202

class DataDetail {
  DataDetail({
      this.idBuku, 
      this.judul, 
      this.deskripsi, 
      this.penulis, 
      this.penerbit, 
      this.tahunterbit, 
      this.gambar, 
      this.jumlahhalaman,});

  DataDetail.fromJson(dynamic json) {
    idBuku = json['id_buku'];
    judul = json['judul'];
    deskripsi = json['deskripsi'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    tahunterbit = json['tahunterbit'];
    gambar = json['gambar'];
    jumlahhalaman = json['jumlahhalaman'];
  }
  int? idBuku;
  String? judul;
  String? deskripsi;
  String? penulis;
  String? penerbit;
  String? tahunterbit;
  String? gambar;
  int? jumlahhalaman;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_buku'] = idBuku;
    map['judul'] = judul;
    map['deskripsi'] = deskripsi;
    map['penulis'] = penulis;
    map['penerbit'] = penerbit;
    map['tahunterbit'] = tahunterbit;
    map['gambar'] = gambar;
    map['jumlahhalaman'] = jumlahhalaman;
    return map;
  }

}