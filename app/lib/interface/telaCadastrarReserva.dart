import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uespi_reserva/modelos/recurso.dart';
import 'package:uespi_reserva/modelos/usuario.dart';
import 'package:uespi_reserva/servico.dart';

class TelaCadastraReserva extends StatefulWidget{
  Recurso recurso;
  TelaCadastraReserva({this.recurso});
  @override
  State<StatefulWidget> createState() => _TelaCadastraReservaState();

}

class _TelaCadastraReservaState extends State<TelaCadastraReserva>{
  Api _api = Api();
  DateTime _data;
  TimeOfDay _hi, _hf;

  void _reservar() {
    if (_data == null || _hi == null || _hf == null){
      print(_data.toString());
      print(_hi.toString());
      print(_hf.toString());

      showDialog(context: context,
          builder: (context){
            return AlertDialog(
              title: Text("Campo Vazio !",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),
              content: Text("Todos os campos devem ser preenchidos",
                style: TextStyle(fontSize: 18),),
              actions: <Widget>[
                FlatButton(onPressed:(){
                  Navigator.pop(context);
                },
                    child: Text("OK"))
              ],
            );
          });
    }else{
      _api.reservar(_data, _hi, _hf, widget.recurso.id, Usuario.id);
      Navigator.pop(context);
    }
  }

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
                            fontSize: 15,
                            fontWeight: FontWeight.w400
                          )
                      ),
                      enabled: false,
                      initialValue: widget.recurso.nome,
                      style: TextStyle(fontSize: 15,
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
                              fontSize: 15,
                              fontWeight: FontWeight.w400
                          )
                      ),
                      enabled: false,
                      initialValue: widget.recurso.tipo,
                      style: TextStyle(fontSize: 15,
                          fontWeight: FontWeight.w400),

                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.yellow,
                      onPressed: () async {
                        final dtPick = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2100)
                        );
                        if (dtPick != null && dtPick != _data){
                          _data = dtPick;
                        }
                      },
                      child: Text("Selecionar Data") ,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.yellow,
                      onPressed: () async {
                        final hipicker = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now()
                        );

                        if(hipicker != null ){
                          _hi = hipicker;
                        }
                      },
                      child: Text("Selecionar Hora inicial") ,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.yellow,
                      onPressed: () async {
                        final hfpicker = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now()
                        );

                        if(hfpicker != null ){
                          _hf = hfpicker;
                        }
                      },
                      child: Text("Selecionar Hora Final") ,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 300.0,
                    alignment: Alignment.center,
                    color: Colors.blue,
                    child: FlatButton(onPressed: _reservar,
                        child: Text("Reservar",
                            style: TextStyle(fontSize: 15.0))),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

}