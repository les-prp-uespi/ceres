import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uespi_reserva/servico.dart';

class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MenuState();
  
}

class _MenuState extends State<Menu> {
  Api _api = Api();

  void logOut(){
    _api.logOut();
    Navigator.pop(context);
    Navigator.popAndPushNamed(context, "/login");


  }
  void vaiHome(){
   Navigator.pop(context);
   Navigator.popAndPushNamed(context, "/materiais");
  
  }
  void vaiReservas(){
   Navigator.pop(context);
   Navigator.popAndPushNamed(context, "/reservas");
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
            children:[
              UserAccountsDrawerHeader(
                accountName: Text("${user.nome}",
              style: TextStyle(fontSize: 20.0),),
                accountEmail: Text("${user.login}",
              style: TextStyle(fontSize: 15.0)),
                currentAccountPicture: GestureDetector(
            child: CircleAvatar(
              child: Text(user.nome.substring(0,2),
              style: TextStyle(
                fontSize: 60
              ),)
            ),
            onTap: (){
              Navigator.pushNamed(context, "/editUsuario");
            },
          ),
        ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text("Recursos",
              style: TextStyle(fontSize: 15.0),),
              onTap: vaiHome,

            ),
            ListTile(
              leading: Icon(Icons.timelapse),
              title: Text("Minhas reservas",
              style: TextStyle(fontSize: 15.0),),
              onTap: vaiReservas,
            ),

            ]),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("sair",
              style: TextStyle(fontSize: 15.0),),
              onTap: logOut,
            ),
          ],
      ),
    );
  }
}