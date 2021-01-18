import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uespi_reserva/components/app_drawer.dart';
import 'package:uespi_reserva/components/reservation_tile_widget.dart';
import 'package:uespi_reserva/models/reservation_model.dart';
import 'package:uespi_reserva/provider/controller_provider.dart';

class ReservationView extends StatefulWidget {
  @override
  _ReservationViewState createState() => _ReservationViewState();
}

class _ReservationViewState extends State<ReservationView> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ControllerProvider>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xff001F74),
        title: Text("Minhas Reservas"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: FutureBuilder(
            future: controller.getReservations(),
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
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) => ReservationTileWidget(
                            reservationModel: data[index],
                          ));
                }
              }
            }),
      ),
    );
  }
}
