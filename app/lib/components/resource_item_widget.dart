import 'package:flutter/material.dart';
import 'package:uespi_reserva/models/resource_model.dart';

class ResourceItemWidget extends StatelessWidget {
  final ResourceModel resourceModel;
  ResourceItemWidget({this.resourceModel});
  @override
  Widget build(BuildContext context) {
    print(resourceModel.type);
    return GestureDetector(
      child: ClipRRect(
        
        borderRadius: BorderRadius.circular(10.0),
        child: GridTile(
          child: Container(
            color: Colors.white70,
            child: resourceModel.type == "I"
                ? Icon(Icons.sensor_door_outlined, size: 100,)
                : Icon(Icons.settings_input_hdmi_outlined, size: 100,),
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
