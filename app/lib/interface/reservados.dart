import 'package:flutter/material.dart';
import 'package:uespi_reserva/interface/home.dart';
import 'package:uespi_reserva/materiais/auditorio.dart';
import 'package:uespi_reserva/interface/escolha.dart';
import 'DrawerWidget.dart';
import 'package:uespi_reserva/materiais/datashow.dart';


class MateriasReservados extends StatefulWidget {
  @override
  _MateriasReservadosState createState() => _MateriasReservadosState();
}

class _MateriasReservadosState extends State<MateriasReservados> {
  @override
  void vaiHome() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(
      ),
      appBar: AppBar(
        title: Text('Minhas Reservas'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Escolha(),
                Escolha1(),
                Escolha2(),
                Escolha3(),
                Escolha4()
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: vaiHome,
        child: Icon(Icons.add),

      ),

    );
  }
}
