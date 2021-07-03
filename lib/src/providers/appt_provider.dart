import 'dart:convert';

import 'package:hcl_zgaf_tdmi_final/src/models/appointment_model.dart';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:io';

class ApptProvider {
  final String _url = 'pv0o5o5psl.execute-api.us-east-2.amazonaws.com';

  Future<bool> crearCita(ApptModel user) async {
    final url = Uri.https(_url, '/prod/api/nueva-cita');

    final resp = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: apptModelToJson(user));

    final decodeData = json.decode(resp.body);
    return true;
  }

  Future<List<ApptModel>> cargarCitas() async {
    final url = Uri.https(_url, '/prod/api/citas');
    final resp = await http.get(url);

    // final decodeData = json.decode(resp.body);

    final List<dynamic> decodeData = json.decode(resp.body);

    final List<Map<String, dynamic>> aux = new List();
    final List<ApptModel> clientes = new List();

    // // if (decodeData == null) return [];

    decodeData.forEach((cliente) {
      Map<String, dynamic> auxCliente = cliente;
      aux.add(auxCliente);
    });

    aux.forEach((client) {
      final prodTemp = ApptModel.fromJson(client);
      clientes.add(prodTemp);
    });

    return clientes;
  }

  Future<ApptModel> cargarIngresos() async {
    final url = Uri.https(_url, '/prod/api/ingresos');
    final resp = await http.get(url);

    // final decodeData = json.decode(resp.body);

    final List<dynamic> decodeData = json.decode(resp.body);

    final List<Map<String, dynamic>> aux = new List();
    ApptModel clientes = new ApptModel();

    // // if (decodeData == null) return [];

    decodeData.forEach((cliente) {
      Map<String, dynamic> auxCliente = cliente;
      aux.add(auxCliente);
      print(aux);
    });

    aux.forEach((client) {
      final prodTemp = ApptModel.fromJson(client);
      clientes = prodTemp;
    });

    print(clientes);
    return clientes;
  }
}
