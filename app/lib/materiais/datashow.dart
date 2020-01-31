import 'package:flutter/material.dart';
import 'package:uespi_reserva/interface/reservados.dart';
import 'package:intl/intl.dart';
import 'package:uespi_reserva/interface/escolha.dart';

//Variaveis para capturar Data e Hora

DateTime _data = DateTime.now();
TimeOfDay _horai = TimeOfDay.now(), _horaf = TimeOfDay.now();
final DateFormat dataFormatada = DateFormat(' dd-MM-yyyy');
String mData = "", mHorai = '',mHoraf = '';


//Widget principal
class DataShow extends StatefulWidget {
  @override
  _DataShowState createState() => _DataShowState();
}

class _DataShowState extends State<DataShow> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black)
      ),
      height: 350.0,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            child: Image.asset('assets/datashow1.png',
              height: 250.0,
              width: 250.0,
            ),
          ),
          Text("Data Show",
            style: TextStyle(fontSize: 30.0,
                fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.blue,
            height: 40.0,
            width: 150.0,
            child: FlatButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>TelaReserva()));
            },
              child: Text("Reservar",
                style: TextStyle(fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 17.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}


//Tela de Reserva
class TelaReserva extends StatefulWidget {
  @override
  _TelaReservaState createState() => _TelaReservaState();
}

class _TelaReservaState extends State<TelaReserva> {

  //Função data
  Future<Null> selecioneData(BuildContext context) async {
    final DateTime selecionado = await showDatePicker(
        context: context,
        initialDate: _data,
        firstDate: DateTime(2018),
        lastDate: DateTime(2050)
    );

    if (selecionado != null && selecionado != _data) {
      setState(() {
          if(_data == null) {
            _data = selecionado;
          }
      });
    }
    setState(() {
      mData = dataFormatada.format(_data);
    });
  }

  //Função Hora inicial
  Future<Null> selecioneHorai(BuildContext context) async{
     _horai = await showTimePicker(
        context: context,
        initialTime: _horai);

     setState(() {
       mHorai = _horai.toString();
     });
  }

  //Função Hora Final
  Future<Null> selecioneHoraf(BuildContext context) async{
    _horaf = await showTimePicker(
        context: context,
        initialTime: _horaf);

    setState(() {
      mHoraf = _horaf.toString();
    });
  }

  //Função para botao concluído

  void concluidobot(){
    //Função do alert Dialog

    Future<void> falta() async {
      return showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext) {
            return AlertDialog(
              title: Text("Todos os campos devem ser Preenchidos!"),
              actions: <Widget>[
                FlatButton(onPressed: (){Navigator.pop(context);},
                    child: Text("OK!")),
              ],
            );
          }
      );
    }

    setState(() {
      if(mData.isNotEmpty && mHorai.isNotEmpty && mHoraf.isNotEmpty) {
        if (index == 0) {
          index = 1;
        } else if (index1 == 0) {
          index1 = 1;
        } else if (index2 == 0) {
          index2 = 1;
        } else if (index3 == 0) {
          index3 = 1;
        } else if (index4 == 0) {
          index4 = 1;
        }
        mData = '';
        mHorai = '';
        mHoraf = '';

        Navigator.pop(context);
      }else{
        falta();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/DatashowFundo.png'),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.center,
            child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(onPressed: (){
                      selecioneData(context);
                    },
                      color: Colors.blue,
                      child: Text('Data',
                        style: TextStyle(fontSize: 30) ,),),
                  ),
                  Container(
                    color: Colors.white,
                    child: Text(mData,
                      style: TextStyle(fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.w700),),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(onPressed: (){
                      selecioneHorai(context);
                    },
                      color: Colors.blue,
                      child: Text("Horário Inicial",
                        style: TextStyle(fontSize: 30),),),
                  ),
                  Container(
                    color: Colors.white,
                    child: Text(mHorai,
                      style: TextStyle(fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.w700),),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(onPressed: (){
                      selecioneHoraf(context);
                    },
                      color: Colors.blue,
                      child: Text("Horário Final",
                        style: TextStyle(fontSize: 30),),),
                  ),
                  Container(
                    color: Colors.white,
                    child: Text(mHoraf,
                      style: TextStyle(fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.w700),),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Container(
                    color: Colors.blue,
                    child: FlatButton(onPressed: concluidobot,
                        child: Text("Concluido",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400,color: Colors.black),)),
                  )
                ]
            ),
          ),
        ],
      ),
    );
  }
}


//Widget para Minhas Reservas

class DataShowReserv extends StatefulWidget {
  @override
  _DataShowReservState createState() => _DataShowReservState();
}

class _DataShowReservState extends State<DataShowReserv> {


  void escolher(int escolhendo){
  }
  //Função para botap de informação

  Future<void> _maisInfo() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext) {
          return AlertDialog(
            title: Text("Mais Informações"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Reservado para o dia ()\n"
                      "Hora inicial ()\n"
                      "Hora final ()")
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(onPressed: (){
                Navigator.pop(context);
              },
                  child: Text("OK"))

            ],
          );
        }
    );
  }
  //Função Dialog Alert para botão Cancelar Reserva

  Future<void> _cancelarmesmo() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext) {
          return AlertDialog(
            title: Text("Deseja Realmente Cancelar sua Reserva?"),
            actions: <Widget>[
              FlatButton(onPressed: cancelarReserv,
                  child: Text("Sim!")),
              FlatButton(onPressed: (){
                Navigator.pop(context);
              },
                  child: Text("Não!"))

            ],
          );
        }
    );
  }
  //Função cancelar reserva

  void cancelarReserv() {
    if (index == 1) {
      index = 0;
    } else if (index1 == 1) {
      index1 = 0;
    } else if (index2 == 1) {
      index2 = 0;
    } else if (index3 == 1) {
      index3 = 0;
    } else if (index4 == 1) {
      index4 = 0;
    }
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MateriasReservados()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black)
      ),
      height: 380.0,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            child: Image.asset('assets/datashow1.png',
              height: 250.0,
              width: 250.0,
            ),
          ),
          Text("Data Show",
            style: TextStyle(fontSize: 30.0,
                fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                color: Colors.red,
                height: 60.0,
                width: 160.0,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.cancel),
                    ),
                    FlatButton(onPressed: (){
                      _cancelarmesmo();
                    },
                      child: Text(" Cancelar\n  Reserva",
                        style: TextStyle(fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 17.0),
                      ),
                    ),
                  ],
                ),

              ),
              Container(
                alignment: Alignment.center,
                color: Colors.blue,
                height: 60.0,
                width: 160.0,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.add),
                    ),
                    FlatButton(onPressed: (){

                      _maisInfo();
                    },
                      child: Text("     Mais\nInformações",
                        style: TextStyle(fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 17.0),
                      ),
                    ),
                  ],
                ),

              ),
            ],
          )
        ],
      ),
    );
  }
}
