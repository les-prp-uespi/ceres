import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uespi_reserva/models/reservation_model.dart';
import 'package:uespi_reserva/models/resource_model.dart';
import 'package:uespi_reserva/provider/controller_provider.dart';

class CreateReservationView extends StatefulWidget {
  @override
  _CreateReservationViewState createState() => _CreateReservationViewState();
}

class _CreateReservationViewState extends State<CreateReservationView> {
  List<String> _horarios = [
    "8:00",
    "8:50",
    "9:40",
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

  String _valueInicioHorario = "8:00";
  String _valueFinalHorario = "8:50";
  DateTime dateTime = DateTime.now();
  bool _isloading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ControllerProvider>(context);

    final ResourceModel args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xff2E75BC),
      appBar: AppBar(
        backgroundColor: Color(0xff001F74),
        title: Text("Reservar"),
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
                  args.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () async {
                        final data = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2018),
                          lastDate: DateTime(2028),
                          locale: Localizations.localeOf(context),
                        );
                        setState(() {
                          dateTime = data;
                        });
                      },
                      child: Text("Selecionar Data"),
                    ),
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
                          setState(() {
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
                          setState(() {
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
                      final reservation = ReservationModel(
                        data:
                            "${dateTime.year}-${dateTime.month}-${dateTime.day}"
                                .toString(),
                        resource: args.id,
                        status: false,
                        tFinal: _valueFinalHorario.toString(),
                        tStart: _valueInicioHorario.toString(),
                      );
                      int result =
                          await controller.createReservation(reservation);
                      print(result);
                      if (result == 200) {
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Reserva feita !!'),
                        ));
                        Navigator.pop(context);
                      } else {
                        _scaffoldKey.currentState.showSnackBar(new SnackBar(
                          content: Text('Não foi possivel fazer a reserva !!'),
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
                      child: Text("RESERVAR")),
                ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
