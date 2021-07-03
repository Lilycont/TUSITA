import 'dart:convert';

// Recibe json en forma de string y regresa nueva instancia del modelo
ApptModel apptModelFromJson(String str) => ApptModel.fromJson(json.decode(str));

// toma el modelo y lo modela como json
String apptModelToJson(ApptModel data) => json.encode(data.toJson());

class ApptModel {
  ApptModel({
    this.id,
    this.cost = 0.0,
    this.finished = '',
    this.reason = '',
  });

  int id;
  double cost;
  String finished;
  String reason;

  // Recibe mapa y regresa nueva intancia por eso factory
  factory ApptModel.fromJson(Map<String, dynamic> json) => ApptModel(
        id: json["id_appointments"],
        cost: json["cost"],
        finished: json["finished"],
        reason: json["reason"],
      );

  // toma el modelo y lo transforma a json
  Map<String, dynamic> toJson() => {
        "id_appointments": id,
        "cost": cost,
        "finished": finished,
        "reason": reason
      };
}
