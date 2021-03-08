import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uespi_reserva/components/reservation_tile_widget.dart';
import 'package:uespi_reserva/controller/app_controller.dart';

class ReservationView extends StatefulWidget {
  @override
  _ReservationViewState createState() => _ReservationViewState();
}

class _ReservationViewState extends State<ReservationView> {
  @override
  void initState() {
    Modular.get<AppController>().getReservations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff2E75BC),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Observer(
        builder: (ctx) {
          if (Modular.get<AppController>().reservations.length == 0 &&
              !Modular.get<AppController>().completed) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white70,
              ),
            );
          } else if (Modular.get<AppController>().reservations.length == 0 &&
              Modular.get<AppController>().completed) {
            return Center(
              child: Text(
                "Você não possui reservas !",
                style: TextStyle(fontSize: 16),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: Modular.get<AppController>().reservations.length,
              itemBuilder: (context, index) => ReservationTileWidget(
                reservationModel:
                    Modular.get<AppController>().reservations[index],
              ),
            );
          }
        },
      ),
    );
  }
}
