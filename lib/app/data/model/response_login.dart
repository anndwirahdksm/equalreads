/// message : "Login berhasil"
/// userData : {"id_user":12,"username":"Ananda","email":"ananda@gmail.com","role":"pengguna"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEyLCJpYXQiOjE3MTAzMTI2NDgsImV4cCI6MTcxMDMxNjI0OH0.3J4fJEYI35TspIYovTTwwV0J8tka9g8dkIe-0MzFv2c"

class ResponseLogin {
  ResponseLogin({
      this.message, 
      this.userData, 
      this.token,});

  ResponseLogin.fromJson(dynamic json) {
    message = json['message'];
    userData = json['userData'] != null ? DataLogin.fromJson(json['userData']) : null;
    token = json['token'];
  }
  String? message;
  DataLogin? userData;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (userData != null) {
      map['userData'] = userData?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

/// id_user : 12
/// username : "Ananda"
/// email : "ananda@gmail.com"
/// role : "pengguna"

class DataLogin {
  DataLogin({
      this.idUser, 
      this.username, 
      this.email, 
      this.role,});

  DataLogin.fromJson(dynamic json) {
    idUser = json['id_user'];
    username = json['username'];
    email = json['email'];
    role = json['role'];
  }
  int? idUser;
  String? username;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_user'] = idUser;
    map['username'] = username;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

}