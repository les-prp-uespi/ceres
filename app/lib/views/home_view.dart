import 'package:flutter/material.dart';
import 'package:uespi_reserva/components/app_drawer.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xff001F74),
        title: Text("CeRes"),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Color(0xff2E75BC),
        height: double.infinity,
        padding: EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
              child: Text(
                "Bem-vindos à Central de Reservas",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Text(
              "Recursos",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: RaisedButton(
                        child: Text("Salas"),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: RaisedButton(
                        child: Text("Materiais"),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text("Reservas",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700)),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    
                  ],
                ),
              ),
            ),
            //Text("Reservas"),
          ],
        ),
      ),
    );
  }
}
