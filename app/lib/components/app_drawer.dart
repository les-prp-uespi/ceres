import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uespi_reserva/provider/auth_provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(children: [
            CircleAvatar(
              maxRadius: 90,
              child: Image.asset(
                "assets/logo.png",
                width: 150,
                height: 150,
              ),
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.book),
              title: Text("Minhas reservas"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text("Recursos"),
              onTap: () {},
            ),
          ]),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Sair"),
            onTap: () {
              Provider.of<Auth>(context, listen: false).logout();
            },
          )
        ],
      ),
    );
  }
}
