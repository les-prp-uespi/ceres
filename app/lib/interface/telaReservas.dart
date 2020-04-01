import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uespi_reserva/interface/menu.dart';

class TelaReservas extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TelaReservasState();

}
class _TelaReservasState extends State<TelaReservas>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text("Reservas"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("minhas reservas"),
      ),
    );
  }


}