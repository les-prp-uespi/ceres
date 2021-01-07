import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uespi_reserva/components/app_drawer.dart';
import 'package:uespi_reserva/components/resource_item_widget.dart';
import 'package:uespi_reserva/models/resource_model.dart';
import 'package:uespi_reserva/provider/controller_provider.dart';

class ResourceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String url = ModalRoute.of(context).settings.arguments;
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
          future: controllerProvider.getResources(url),
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
              List<ResourceModel> data = snapshot.data;
              if (data.isEmpty) {
                return Center(
                  child: Text("Não há recursos"),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 15.0),
                  child: GridView.builder(
                    itemCount: data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                    ),
                    itemBuilder: (context, index) {
                      return ResourceItemWidget(
                        resourceModel: data[index],
                      );
                    },
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
