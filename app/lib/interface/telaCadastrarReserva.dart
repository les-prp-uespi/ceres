import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uespi_reserva/modelos/recurso.dart';

class TelaCadastraReserva extends StatefulWidget{
  Recurso recurso;
  TelaCadastraReserva({this.recurso});
  @override
  State<StatefulWidget> createState() => _TelaCadastraReservaState();



}

class _TelaCadastraReservaState extends State<TelaCadastraReserva>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Reservar"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Recurso"
                ),
                enabled: false,
                initialValue: widget.recurso.nome,
              
              ),
               TextFormField(
                decoration: InputDecoration(
                  labelText: "tipo"
                ),
                enabled: false,
                initialValue: widget.recurso.tipo,
              
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Data"
                ),
                initialValue: widget.recurso.tipo,
              
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Horário de início"
                ),
                initialValue: widget.recurso.tipo,
              
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Horário de final"
                ),
                initialValue: widget.recurso.tipo,
              
              )
              
            ], 
          ),
        ),
    );
  }

} 