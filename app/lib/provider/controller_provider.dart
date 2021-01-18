import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:uespi_reserva/models/reservation_model.dart';
import 'package:uespi_reserva/models/resource_model.dart';
import 'package:http/http.dart' as http;
import 'package:uespi_reserva/util/name_routes.dart';

class ControllerProvider with ChangeNotifier {
  String token;
  ControllerProvider({this.token});

  Future<List<ReservationModel>> getReservations() async {
    final http.Response response = await http.get(RoutesHttp.reservation,
        headers: {'Authorization': "Token $token"});
    String content = response.body;
    List reservationJson = json.decode(content);
    List<ReservationModel> reservation =
        reservationJson.map((e) => ReservationModel.fromJson(e)).toList();
    print(reservation);
    return reservation;
  }

  Future<List<ResourceModel>> getResources(String url) async {
    final http.Response response =
        await http.get(url, headers: {'Authorization': "Token $token"});
    String content = response.body;
    List resourcesJson = json.decode(content);
    List<ResourceModel> resources =
        resourcesJson.map((e) => ResourceModel.fromJson(e)).toList();
    print(resources);
    return Future.value(resources);
  }

  Future<int> createReservation(ReservationModel reservationModel) async {
    final http.Response response = await http.post(RoutesHttp.reservation,
        headers: {HttpHeaders.authorizationHeader: "Token $token"},
        body: reservationModel.toJson());
    return response.statusCode;
  }
}
