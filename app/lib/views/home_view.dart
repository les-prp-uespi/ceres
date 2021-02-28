import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uespi_reserva/components/app_drawer.dart';
import 'package:uespi_reserva/components/reservation_card_widget.dart';
import 'package:uespi_reserva/models/reservation_model.dart';
import 'package:uespi_reserva/provider/controller_provider.dart';
import 'package:uespi_reserva/util/name_routes.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 2.5;
    ControllerProvider controllerProvider =
        Provider.of<ControllerProvider>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xff001F74),
        title: Text("CeRes"),
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
                        color: Colors.white70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.sensor_door_outlined, size: 100),
                            Text("Salas")
                          ],
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(Routes.RESOURCES_VIEW,
                              arguments: RoutesHttp.filterResourcesImmobile);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: RaisedButton(
                        color: Colors.white70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.settings_input_hdmi_outlined, size: 100,),
                            Text("Materiais")
                          ],
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(Routes.RESOURCES_VIEW,
                              arguments: RoutesHttp.filterResourcesMobile);
                        },
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
              child: FutureBuilder(
                future: controllerProvider.getReservations(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white70,
                      ),
                    );
                  } else if (snapshot.error != null) {
                    return Center(
                      child: Text("Ocorreu um erro !"),
                    );
                  } else {
                    List<ReservationModel> data = snapshot.data;
                    if (data.isEmpty) {
                      return Center(
                        child: Text("Não há reservas"),
                      );
                    } else {
                      return Padding(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, top: 15.0),
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return ReservationCardWidget(
                              size,
                              reservationModel: data[index],
                            );
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                      );
                    }
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

/*
ListView.builder(
                itemBuilder: (context, index) {
                  return ReservationCardWidget(size);
                },
                scrollDirection: Axis.horizontal,
              ),
*/
