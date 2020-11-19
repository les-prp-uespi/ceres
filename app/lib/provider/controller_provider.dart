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

/*

  Future<List<ReservationModel>> getReservations() async {
    
    return Future.value();
  }
*/
  Future<List<ResourceModel>> getResources() async {
    final http.Response response = await http.get(RoutesHttp.resources,
        headers: {HttpHeaders.authorizationHeader: "token $token"});
    String content = response.body;
    List resourcesJson = json.decode(content);
    List<ResourceModel> resources =
        resourcesJson.map((e) => ResourceModel.fromJson(e)).toList();
    return resources;
  }

  Future createReservation(ReservationModel reservationModel) async {
    final http.Response response = await http.post(RoutesHttp.createReservation,
        headers: {HttpHeaders.authorizationHeader: "token $token"},
        body: reservationModel.toJson());
    print(response.statusCode);
  }
}
