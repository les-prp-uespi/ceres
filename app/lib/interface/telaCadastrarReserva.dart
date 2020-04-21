import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:uespi_reserva/modelos/recurso.dart';
import 'package:uespi_reserva/modelos/usuario.dart';
import 'package:uespi_reserva/servico.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uespi_reserva/modelos/reservas.dart';
import 'package:uespi_reserva/controllers.dart';

class TelaCadastraReserva extends StatefulWidget{
  Recurso recurso;
  Reserva reserva;
  bool rOUe;
  TelaCadastraReserva({this.recurso, this.reserva, this.rOUe});
  @override
  State<StatefulWidget> createState() => _TelaCadastraReservaState();

}

class _TelaCadastraReservaState extends State<TelaCadastraReserva>{


  Api _api = Api();
  DateTime _data;
  String _hi, _hf;

  void _mostraDialog(_titulo, _corpo){
    showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title: Text(_titulo,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),
            content: Text(_corpo,
              style: TextStyle(fontSize: 18),),
            actions: <Widget>[
              FlatButton(onPressed:(){
                Navigator.pop(context);
                buttonCadastro.reset();
              },
                  child: Text("OK"))
            ],
          );
        });
  }



  void _salvar() async{
    _data = controllerCalendar.selectedDay;
    if (_data == null || _hi == null || _hf == null){
      buttonReservar.error();
      print(_data.toString());
      print(_hi.toString());
      print(_hf.toString());

      _mostraDialog("Campo Vazio!", "Todos os campos devem ser Preenchidos");
    }else{
      int _statusCode = await _api.editarReserva(
          _data, _hi, _hf, widget.reserva.idMaterial,
          Usuario.id, widget.reserva.idReserva);
      switch (_statusCode){
        case 500:
          _mostraDialog("Erro", "Não foi possível efetuar a reserva");
          break;
        case 200:
          Navigator.pushReplacementNamed(context, '/reservas');
      }

      print("idmaterial ${widget.reserva.idReserva}");
      print("idmaterial ${widget.reserva.idMaterial}");
      print("user ${Usuario.id}");
      Navigator.pop(context);
    }
  }


  void _reservar() async{
    if (_data == null || _hi == null || _hf == null){
      print(_data.toString());
      print(_hi.toString());
      print(_hf.toString());
      buttonReservar.error();

      _mostraDialog("Campo Vazio!", "Todos os campos devem ser Preenchidos");
    }else{
      showDialog(context: context,
          builder: (context){
            return AlertDialog(
              title: Text("Reservar ?",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),
              content: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Material: ${widget.recurso.nome}",
                      style: TextStyle(fontSize: 18),),
                    Text("Data: ${formatDate(_data, [dd,':',mm,':',yyyy])}",
                      style: TextStyle(fontSize: 18),),
                    Text("Horário Inicial: $_hi",
                      style: TextStyle(fontSize: 18),),
                    Text("Horário Final: $_hf",
                      style: TextStyle(fontSize: 18),),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(onPressed:() async{
                  int _statusCode = await _api.reservar(
                      _data, _hi, _hf, widget.recurso.id, Usuario.id);
                  Navigator.pop(context);
                  switch (_statusCode){
                    case 500:
                      _mostraDialog("Erro", "Não foi possível concluir a reserva");
                      break;
                    case 201:
                      Navigator.pop(context);
                  }
            },
                    child: Text("Sim")),
                FlatButton(onPressed:(){
                  Navigator.pop(context);
                },
                    child: Text("Não")),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text(widget.rOUe == true?"Reservar":"Editar Reserva"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.blue
                      ),
                      borderRadius: BorderRadius.circular(15),
                    color: Colors.white
                  ),
                  child: TableCalendar(
                      calendarStyle: CalendarStyle(
                        todayColor: Colors.blue,
                      ),
                      onDaySelected: (date, events){
                        print(date.toIso8601String());
                        _data = date;
                      },
                      builders: CalendarBuilders(
                          selectedDayBuilder: (context, date, events)=>
                              Container(
                                  alignment: Alignment.center,
                                  color: Colors.yellow,
                                  child: Text(date.day.toString()))
                      ),
                      calendarController: controllerCalendar),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hora de início:",
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                  ),
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: horarios.length,
                    itemBuilder: (BuildContext context, int index){
                      return viewHorarios(horarios[index], "I", index);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hora de encerramento:",
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.blue
                      ),
                      borderRadius: BorderRadius.circular(15),
                  ),
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: horarios.length,
                    itemBuilder: (BuildContext context, int index){
                      return viewHorarios(horarios[index], "F", index);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Recurso:",
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),),
                ),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.blue
                      ),
                      borderRadius: BorderRadius.circular(15),
                    color: Colors.white
                  ),
                  child: Center(
                    child: Text(widget.rOUe == true? widget.recurso.nome: widget.reserva.nomeMaterial,
                      style: TextStyle(fontSize: 25,
                          fontWeight: FontWeight.w400,
                      color: Colors.blue),

                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RoundedLoadingButton(onPressed: widget.rOUe ==true?  _reservar:_salvar,
                      color: Colors.yellow,
                      controller: buttonReservar,
                      child: Text(widget.rOUe == true? "Reservar":"Salvar",
                          style: TextStyle(fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))),
                ),
              ],
            ),
          ),
        ),
    );
  }

  Widget viewHorarios(_mHora, _iOUf, _indice){
      return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            height: 50,
            width: 75,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(15),
                 color: _iOUf == "I"? coresI[_indice]: coresF[_indice],
            ),
            child: Center(
              child: Text("$_mHora", style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),
          ),
        ),
        onTap:(){
        switch(_iOUf ) {
          case "I":
            _hi = _mHora;

            for(int _i = 0; _i <= 16; _i++){
              setState(() {
                coresI[_i] = Colors.white;
              });
              setState(() {
                coresI[_indice] = Colors.yellow;
              });

            }
            break;
          case "F":
            _hf = _mHora;

            for(int _i = 0; _i <= 16; _i++){
              setState(() {
                coresF[_i] = Colors.white;
              });
              setState(() {
                coresF[_indice] = Colors.yellow;
              });

            }
        }
      },
      );

  }


}
