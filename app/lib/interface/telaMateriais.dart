import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uespi_reserva/interface/menu.dart';
import 'package:uespi_reserva/interface/telaCadastrarReserva.dart';
import 'package:uespi_reserva/modelos/recurso.dart';
import 'package:uespi_reserva/servico.dart';

class TelaMateriais extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TelaMateriaisState();

}
class _TelaMateriaisState extends State<TelaMateriais> {
  Api _api = Api();
  _listMateriais (){
    return _api.getMateriais();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text('Materiais Disponíveis'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: FutureBuilder<List<Recurso>>(
              future: _listMateriais() ,
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
                    List<Recurso> recusos = snapshot.data;
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder:(context, index){
                        return viewMateriais(recusos[index]);
                      }

                      );
                  }else{
                    return Text("vazio");
                  }
                  break;
                }
              },
            )
        ),
      )
    );
  }

  Widget viewMateriais(Recurso recurso){
    var icone = recurso.tipo == "movel"? Icons.personal_video: Icons.room;
    return GestureDetector(
       child: ListTile(
        leading: Icon(icone),
        title: Text(recurso.nome),
        subtitle: Text(recurso.tipo),
      ),
      onTap: (){
          Navigator.push(context,  MaterialPageRoute(builder: (context)=>TelaCadastraReserva(recurso: recurso)));
        }
      );

  }
}
