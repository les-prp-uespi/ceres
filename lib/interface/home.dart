import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uespi_reserva/interface/DrawerWidget.dart';
import 'package:uespi_reserva/materiais/auditorio.dart';
import 'package:uespi_reserva/materiais/datashow.dart';
import 'package:uespi_reserva/materiais/labinfo.dart';
import 'package:uespi_reserva/materiais/salareuniao.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(
      ),
      appBar: AppBar(
        title: Text('Materiais Disponíveis'),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
             new DataShow(),
             new Auditorio(),
             new LabInfo(),
             new SalaReuniao(),

            ],
          ),
       Text("Made by: XM STÚDIO!",
       style: TextStyle(fontSize: 10.0),)
        ],
      ),
    );
  }
}
