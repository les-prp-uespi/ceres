import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uespi_reserva/interface/menu.dart';
import 'package:uespi_reserva/interface/telaCadastrarReserva.dart';
import 'package:uespi_reserva/modelos/reservas.dart';
import 'package:uespi_reserva/servico.dart';


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
      backgroundColor: Colors.blue,
      drawer: Menu(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    );
                    break;
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    );
                    break;
                  case ConnectionState.active:
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    );
                    break;
                  case ConnectionState.done:
                    if(snapshot.data.isNotEmpty){
                      List<Reserva> reservas = snapshot.data;
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index){
                          return viewReservas(reservas[index]);
                        },

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
      ),
    );
  }


  Widget viewReservas(Reserva reserva){
    String imagem = reserva.tipoMAterial == "movel"? 'assets/DataShowNv.png':
    'assets/Audi.png';
    var icone = reserva.tipoMAterial == "movel"? Icons.personal_video: Icons.room;
    return Card(
      elevation: 10,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Image.asset(imagem),
        ),
        title: Text(reserva.nomeMaterial,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),),
        subtitle: Row(
          children: <Widget>[
            Icon(icone,
            size: 12,),
            Text(" ${reserva.tipoMAterial}")
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.info_outline),
                color: Colors.black,
                onPressed: (){
                  showDialog(context: context,
                      builder: (context)
                      {
                        return AlertDialog(
                          title: Text("Reserva"),
                          content: Container(
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Material: ${reserva.nomeMaterial}",
                                  style: TextStyle(fontSize: 18),),
                                Text("Data: ${reserva.data}",
                                  style: TextStyle(fontSize: 18),),
                                Text("Horário Inicial: ${reserva.horarioInicio}",
                                  style: TextStyle(fontSize: 18),),
                                Text("Horário Final: ${reserva.horarioFinal}",
                                  style: TextStyle(fontSize: 18),),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Ok"))
                          ],
                        );
                      });
                }),
            IconButton(
                icon: Icon(Icons.edit),
                color: Colors.blue,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TelaCadastraReserva(reserva: reserva, rOUe: false, )));
                }),
            IconButton(
                icon: Icon(Icons.cancel),
                color: Colors.red,
                onPressed: (){
                  showDialog(context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Cancelar Reserva!",
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),
                          content: Text("Deseja Realmente Cancelar sua Reserva? ",
                            style: TextStyle(fontSize: 18),),
                          actions: <Widget>[
                            FlatButton(
                                onPressed:(){
                                  Navigator.pop(context);
                                },
                                child: Text("Não")),
                            FlatButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                  setState(() {
                                    _api.excluirReserva(reserva.idReserva);
                                  });
                                },
                                child: Text("SIM"))
                          ],
                        );
                      });
                })
          ],
        )
      ),

    );
  }
}