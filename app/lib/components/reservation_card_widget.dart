import 'package:flutter/material.dart';
import 'package:uespi_reserva/models/reservation_model.dart';

// ignore: must_be_immutable
class ReservationCardWidget extends StatelessWidget {
  double size;
  ReservationModel reservationModel;
  ReservationCardWidget(this.size, {this.reservationModel});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        width: size,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(reservationModel.resourceModel.name),
            reservationModel.resourceModel.type == "I"
                ? Icon(
                    Icons.sensor_door_outlined,
                    size: 90,
                  )
                : Icon(
                    Icons.settings_input_hdmi_outlined,
                    size: 90,
                  ),
            Text(
                "${reservationModel.data.substring(8, 10)}/${reservationModel.data.substring(5, 7)}/${reservationModel.data.substring(0, 4)}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(reservationModel.tStart.substring(0, 5)),
                Text(reservationModel.tFinal.substring(0, 5))
              ],
            )
          ],
        ),
        //alignment: Alignment.center,
      ),
    );
  }
}
