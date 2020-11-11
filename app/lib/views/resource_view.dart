
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uespi_reserva/components/app_drawer.dart';
import 'package:uespi_reserva/models/resource_model.dart';
import 'package:uespi_reserva/provider/controller_provider.dart';

class ResourceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ControllerProvider controllerProvider =
        Provider.of<ControllerProvider>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xff001F74),
        title: Text("Recursos"),
      ),
      body: Container(
        color: Color(0xff2E75BC),
        width: double.infinity,
        height: double.infinity,
        child: FutureBuilder(
          future: controllerProvider.getResources(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.error != null) {
              return Center(
                child: Text("Ocorreu um erro !"),
              );
            } else {
              List<ResourceModel> data = snapshot.data;
              return Center(
                child: Text(data.length.toString()),
              );
            }
          },
        ),
      ),
    );
  }
}
