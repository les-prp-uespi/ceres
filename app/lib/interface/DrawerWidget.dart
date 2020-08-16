import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uespi_reserva/interface/home.dart';
import 'package:uespi_reserva/interface/login.dart';
import 'package:uespi_reserva/interface/reservados.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  void LogOut(){
    Navigator.pop(context);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login()));
  }
  void vaiHome(){
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
  }
  void vaiReservas(){
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context)=> MateriasReservados()));
  }
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: <Widget>[
        UserAccountsDrawerHeader(
            accountName: Text("Example",
              style: TextStyle(fontSize: 20.0),),
            accountEmail: Text("example@example.com",
              style: TextStyle(fontSize: 15.0)),
          currentAccountPicture: CircleAvatar(
            radius: 30.0,
          ),
        ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home",
              style: TextStyle(fontSize: 20.0),),
              onTap: vaiHome,

            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text("Minhas reservas",
              style: TextStyle(fontSize: 20.0),),
              onTap: vaiReservas,
            ),
            SizedBox(
              height: 320.0,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                leading: Icon(Icons.power_settings_new),
                title: Text("Sair",
                  style: TextStyle(fontSize: 20.0) ,),
                onTap: LogOut,
              ),
            )
          ],
      ),
    );
  }
}