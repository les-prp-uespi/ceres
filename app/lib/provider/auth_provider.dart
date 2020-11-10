import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:uespi_reserva/util/local_store.dart';

class Auth with ChangeNotifier {
  String _token;

  get token => _token;

  bool get isAuth {
    return _token != null;
  }

  Future<void> login(String email, String password) async {
    http.Response response = await http.post(
      "https://ceres-uespi.herokuapp.com/auth/",
      body: {
        "username": email,
        "password": password,
      },
    );
    if (response.statusCode == 200) {
      _token = json.decode(response.body)["token"];
      print(_token);
      await LocalStore.saveString("token", _token);
      notifyListeners();
      return Future.value();
    }
  }

  Future<void> logout() async {
    await LocalStore.remove("token");
    _token = null;
    notifyListeners();
  }

  Future<void> autoLogin() async {
    _token = await LocalStore.getString("token");
    print("token $_token");
    if (_token == null) {
      return Future.value();
    }
    _token = _token;
    notifyListeners();
    return Future.value();
  }
}
