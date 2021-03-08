import 'dart:convert';

import 'package:uespi_reserva/models/reservation_model.dart';
import 'package:uespi_reserva/models/resource_model.dart';
import 'package:uespi_reserva/util/name_routes.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  static ApiRepository instance = ApiRepository();

  Future<Map<String, dynamic>> login(String email, String password) async {
    http.Response response = await http.post(
      RoutesHttp.login,
      body: {
        "email": email,
        "password": password,
      },
    );
    if (response.statusCode == 200) {
      String token = json.decode(response.body)["key"];
      return {
        "response": token,
      };
    }
    return {"response": 404};
  }

  Future<List<ReservationModel>> getReservations(String token) async {
    final http.Response response = await http.get(RoutesHttp.reservation,
        headers: {'Authorization': "Token $token"});
    String content = response.body;
    List reservationJson = json.decode(content);
    List<ReservationModel> reservation =
        reservationJson.map((e) => ReservationModel.fromJson(e)).toList();
    return reservation;
  }

  Future<List<ResourceModel>> getResources(String token) async {
    final http.Response response = await http
        .get(RoutesHttp.resources, headers: {'Authorization': "Token $token"});
    String content = response.body;
    List resourcesJson = json.decode(content);
    List<ResourceModel> resources =
        resourcesJson.map((e) => ResourceModel.fromJson(e)).toList();
    return Future.value(resources);
  }

  Future<int> createReservation(
      ReservationModel reservationModel, String token) async {
    final http.Response response = await http.post(RoutesHttp.reservation,
        headers: {"Authorization": "Token $token"},
        body: reservationModel.toJson());
    return response.statusCode;
  }

  Future<Map<String, dynamic>> createAccount(
      String nome, String email, String password) async {
    http.Response response = await http.post(RoutesHttp.createAcount, body: {
      "username": nome,
      "email": email,
      "password1": password,
      "password2": password,
    });

    if (response.statusCode == 201) {
      String token = json.decode(response.body)["key"];

      return {"token": token};
    } else if (response.statusCode == 400) {
      return {"response": "Verifique os dados fornecidos"};
    }
    return {"response": "Verifique os dados fornecidos"};
  }

  Future<int> updateReservation(
      ReservationModel reservationModel, String token) async {
    http.Response response = await http.patch(
        "${RoutesHttp.updateReservation}${reservationModel.id}/",
        headers: {'Authorization': "Token $token"},
        body: reservationModel.toUpdateJson());
    return Future.value(response.statusCode);
  }
}
