import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:uespi_reserva/controller/app_controller.dart';
import 'package:uespi_reserva/models/reservation_model.dart';

class UpdateReservationView extends StatefulWidget {
  @override
  _UpdateReservationViewState createState() => _UpdateReservationViewState();
}

class _UpdateReservationViewState extends State<UpdateReservationView> {
  List<String> _horarios = [
    "08:00",
    "08:50",
    "09:40",
    "10:30",
    "11:20",
    "12:00",
    "14:00",
    "14:50",
    "15:40",
    "16:30",
    "17:20",
    "18:00",
    "18:50",
    "19:40",
    "20:30",
    "21:20",
    "22:00"
  ];

  String _valueInicioHorario = "08:00";
  String _valueFinalHorario = "08:50";
  DateTime dateTime = DateTime.now();
  bool _isloading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ReservationModel args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xff2E75BC),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Modular.to.pop();
            }),
        backgroundColor: Color(0xff001F74),
        title: Text("Atualizar Reserva"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, right: 15, left: 15),
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  args.resourceModel.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${dateTime.day.toString()} / ${dateTime.month} / ${dateTime.year}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Horário Inicial:",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    DropdownButton<String>(
                        value: _valueInicioHorario,
                        items: _horarios
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7, right: 7),
                              child: Text(
                                value,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          this.setState(() {
                            _valueInicioHorario = value;
                          });
                        })
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Horário Final:",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    DropdownButton<String>(
                        value: _valueFinalHorario,
                        items: _horarios
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7, right: 7),
                              child: Text(value,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600)),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          this.setState(() {
                            _valueFinalHorario = value;
                          });
                        })
                  ],
                ),
              ],
            ),
          ),
          _isloading
              ? CircularProgressIndicator()
              : RaisedButton(
                  onPressed: () async {
                    try {
                      setState(() {
                        _isloading = !_isloading;
                      });

                      setState(() {
                        args.tStart = _valueInicioHorario.toString();
                        args.tFinal = _valueFinalHorario.toString();
                      });

                      int result = await Modular.get<AppController>()
                          .updateReservation(args);
                      print(result);
                      if (result == 200) {
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Reserva Atualizada !!'),
                        ));
                        Navigator.pop(context);
                      } else {
                        _scaffoldKey.currentState.showSnackBar(new SnackBar(
                          content:
                              Text('Não foi possivel atualizar reserva !!'),
                        ));
                      }
                    } catch (err) {
                      print(err);
                    } finally {
                      setState(() {
                        _isloading = !_isloading;
                      });
                    }
                  },
                  child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text("ATUALIZAR")),
                ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
