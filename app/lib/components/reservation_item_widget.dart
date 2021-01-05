import 'package:flutter/material.dart';
import 'package:uespi_reserva/models/resource_model.dart';

class ReservationItemWidget extends StatelessWidget {
  final ResourceModel resourceModel;
  ReservationItemWidget({this.resourceModel});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: GridTile(
          child: Image.asset(
            "assets/DataShowNv.png",
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(resourceModel.name),
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, "/reservation_create",
            arguments: resourceModel);
      },
    );
  }
}
