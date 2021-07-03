import 'dart:convert';

// Recibe json en forma de string y regresa nueva instancia del modelo
UserModel userModelModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

// toma el modelo y lo modela como json
String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.email = '',
    this.password = '',
    this.username = '',
  });

  int id;
  String email;
  String password;
  String username;

  // Recibe mapa y regresa nueva intancia por eso factory
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id_user"],
        email: json["email"],
        password: json["password"],
        username: json["username"],
      );

  // toma el modelo y lo transforma a json
  Map<String, dynamic> toJson() => {
        "id_user": id,
        "email": email,
        "password": password,
        "username": username,
      };
}
