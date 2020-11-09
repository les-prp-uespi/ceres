import 'package:flutter/material.dart';

class ReservationItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        child: Image.asset(
          "assets/DataShowNv.png",
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text("DataShow"),
          trailing: IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
