import 'package:flutter/material.dart';
import 'package:uespi_reserva/interface/login.dart';
import 'package:uespi_reserva/interface/telaMateriais.dart';
import 'package:uespi_reserva/interface/telaReservas.dart';

void main() => runApp(
    new MaterialApp(
      home: Login(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new Login(), 
        '/materiais': (BuildContext context) => new TelaMateriais(),
        '/reservas': (BuildContext context) => new TelaReservas(), 
      },

)
);
