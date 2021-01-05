import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uespi_reserva/provider/auth_provider.dart';
import 'package:uespi_reserva/util/name_routes.dart';

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
                width: 120,
                height: 120,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text("Minhas reservas"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text("Recursos"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                    Routes.RESOURCES_VIEW,
                    arguments: RoutesHttp.resources);
              },
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
