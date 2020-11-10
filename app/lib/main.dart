import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uespi_reserva/interface/editUser.dart';
import 'package:uespi_reserva/interface/login.dart';
import 'package:uespi_reserva/interface/telaCadastroUsuario.dart';
import 'package:uespi_reserva/interface/telaMateriais.dart';
import 'package:uespi_reserva/interface/telaReservas.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:uespi_reserva/provider/auth_provider.dart';
import 'package:uespi_reserva/util/name_routes.dart';
import 'package:uespi_reserva/views/auth_home_view.dart';
import 'package:uespi_reserva/views/home_view.dart';
import 'package:uespi_reserva/views/login_view.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthHomeView(),
        routes: {
          Routes.LOGIN_VIEW: (ctx) => LoginView(),
          Routes.HOME_VIEW: (ctx) => HomeView()
        },
      ),
    );
  }
}
