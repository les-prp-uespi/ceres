import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uespi_reserva/interface/ediReserva.dart';
import 'package:uespi_reserva/interface/menu.dart';
import 'package:uespi_reserva/interface/telaMateriais.dart';
import 'package:uespi_reserva/modelos/reservas.dart';
import 'package:uespi_reserva/servico.dart';
import 'telaCadastrarReserva.dart';

class TelaReservas extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TelaReservasState();

}
class _TelaReservasState extends State<TelaReservas>{
  Api _api = Api();
  _listReservas (){
    return _api.getReservas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text("Reservas"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: FutureBuilder<List<Reserva>>(
              future: _listReservas() ,
              builder: (context, snapshot){
                switch(snapshot.connectionState){
                  case ConnectionState.none:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                    break;
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                    break;
                  case ConnectionState.active:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                    break;
                  case ConnectionState.done:
                    if(snapshot.data.isNotEmpty){
                      List<Reserva> reservas = snapshot.data;
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder:(context, index){
                            return viewReservas(reservas[index]);
                          }

                      );
                    }else{
                      return Text("vazio");
                    }
                    break;
                }
                return null;
              },
            )
        ),
      )
    );
  }

  Widget viewReservas(Reserva reserva){
    var icone = reserva.tipoMAterial == "movel"? Icons.personal_video: Icons.room;
    return GestureDetector(
        child: ListTile(
          leading: Icon(icone),
          title: Text(reserva.nomeMaterial),
          subtitle: Text(reserva.tipoMAterial),
        ),
        onTap: (){
        }
    );

  }

}