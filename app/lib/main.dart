import 'package:flutter/material.dart';
import 'package:uespi_reserva/interface/editUser.dart';
import 'package:uespi_reserva/interface/login.dart';
import 'package:uespi_reserva/interface/telaCadastroUsuario.dart';
import 'package:uespi_reserva/interface/telaMateriais.dart';
import 'package:uespi_reserva/interface/telaReservas.dart';
import 'package:intl/date_symbol_data_local.dart';

void main(){
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new Login(),
        '/materiais': (BuildContext context) => new TelaMateriais(),
        '/reservas': (BuildContext context) => new TelaReservas(),
        '/cadastroUsuario': (BuildContext context) => new CadastroUsuario(),
        '/editUsuario': (BuildContext context) => new EditUser(),
      },

    );
  }
}

