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
  void _deixaBranco(){
    for(int _i = 0; _i <= 16; _i++) {
      setState(() {
        coresI[_i] = Colors.white;
      });
      setState(() {
        coresF[_i] = Colors.white;
      });
    }

  }
  Api _api = Api();
  _listMateriais (){
    return _api.getMateriais();
  }
  _getUser (){
    return _api.getUser();
  }

  @override
  Widget build(BuildContext context) {
    _deixaBranco();
    _getUser();
    return Scaffold(
      backgroundColor: Colors.blue,
      drawer: Menu(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                    List<Recurso> recusos = snapshot.data;
                    return GridView.builder(
                      itemCount: snapshot.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index){
                        return viewMAteriais(recusos[index]);
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
      )
    );
  }

  Widget viewMAteriais(Recurso recurso){
    String imagem = recurso.tipo == "movel"? 'assets/DataShowNv.png':
    'assets/Audi.png';
    var icone = recurso.tipo == "movel"? Icons.personal_video: Icons.room;
    return Container(
      child: GestureDetector(
        child: Container(
          child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(imagem,
                      height: 85,
                      width: 85,),
                      Text(recurso.nome,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(icone,
                              size: 15),
                              Text(recurso.tipo,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15
                              ),),
                            ],
                          ),
                        )),
                    ],
                  ),
                ),
              )),
        ),
        onTap: (){
          Navigator.push(context,  MaterialPageRoute(builder: (context)=>TelaCadastraReserva(recurso: recurso, rOUe: true,)));
        },
      ),

    );

  }
}
