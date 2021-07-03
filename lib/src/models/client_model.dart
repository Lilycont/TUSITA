import 'dart:convert';

// Recibe json en forma de string y regresa nueva instancia del modelo
ClientModel clientModelFromJson(String str) =>
    ClientModel.fromJson(json.decode(str));

// toma el modelo y lo modela como json
String clientModelToJson(ClientModel data) => json.encode(data.toJson());

class ClientModel {
  ClientModel({
    this.id,
    this.name = '',
    this.lastName = '',
    this.age = 0,
    this.description = '',
  });

  int id;
  String name;
  String lastName;
  int age;
  String description;

  // Recibe mapa y regresa nueva intancia por eso factory
  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        id: json["id_client"],
        name: json["name"],
        lastName: json["last_name"],
        age: json["age"],
        description: json["description"],
      );

  // toma el modelo y lo transforma a json
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "last_name": lastName,
        "age": age,
        "description": description
      };
}
