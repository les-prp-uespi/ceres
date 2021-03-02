import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uespi_reserva/provider/auth_provider.dart';
import 'package:uespi_reserva/views/auth_view.dart';
import 'package:uespi_reserva/views/home_view.dart';

class AuthHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    return FutureBuilder<void>(
      future: auth.autoLogin(),
      builder: (context, snapshot) {
        return auth.isAuth ? HomeView() : AuthView();
      },
    );
  }
}
