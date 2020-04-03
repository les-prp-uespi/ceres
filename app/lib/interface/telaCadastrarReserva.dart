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
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: ListView(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                        labelText: "Recurso:",
                          labelStyle: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400
                          )
                      ),
                      enabled: false,
                      initialValue: widget.recurso.nome,
                      style: TextStyle(fontSize: 25,
                          fontWeight: FontWeight.w400),

                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          labelText: "Tipo:",
                          labelStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400
                          )
                      ),
                      enabled: false,
                      initialValue: widget.recurso.tipo,
                      style: TextStyle(fontSize: 25,
                          fontWeight: FontWeight.w400),

                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          labelText: "Data:",
                          labelStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400
                          )
                      ),
                      enabled: true,
                      style: TextStyle(fontSize: 25,
                          fontWeight: FontWeight.w400),

                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          labelText: "Horário de início:",
                          labelStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400
                          )
                      ),
                      enabled: true,
                      style: TextStyle(fontSize: 25,
                          fontWeight: FontWeight.w400),

                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          labelText: "Horário de final:",
                          labelStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400
                          )
                      ),
                      enabled: true,
                      style: TextStyle(fontSize: 25,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

} 