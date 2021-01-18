import 'package:flutter/material.dart';
import 'package:uespi_reserva/models/reservation_model.dart';

class ReservationTileWidget extends StatefulWidget {
  ReservationModel reservationModel;
  ReservationTileWidget({this.reservationModel});
  @override
  _ReservationTileWidgetState createState() => _ReservationTileWidgetState();
}

class _ReservationTileWidgetState extends State<ReservationTileWidget> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          color: Color(0xff2E75BC), borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.reservationModel.resourceModel.name,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
            ),
            subtitle: Text(
              "${widget.reservationModel.data.substring(8, 10)}/${widget.reservationModel.data.substring(5, 7)}/${widget.reservationModel.data.substring(0, 4)}",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                icon: Icon(
                  visible ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  size: 33,
                )),
          ),
          if (visible)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.reservationModel.tStart.substring(0, 5),
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                Text(widget.reservationModel.tFinal.substring(0, 5),
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ],
            ),
          SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
