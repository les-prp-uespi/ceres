import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uespi_reserva/components/reservation_card_widget.dart';
import 'package:uespi_reserva/components/resource_item_widget.dart';
import 'package:uespi_reserva/controller/app_controller.dart';
import 'package:uespi_reserva/views/create_reservation_view.dart';

class ResourceView extends StatefulWidget {
  @override
  _ResourceViewState createState() => _ResourceViewState();
}

class _ResourceViewState extends State<ResourceView> {
  @override
  void initState() {
    Modular.get<AppController>().getResources();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Modular.to.pop();
          },
        ),
        backgroundColor: Color(0xff001F74),
        title: Text("Recursos"),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xff2E75BC),
        width: double.infinity,
        height: double.infinity,
        child: Observer(
          builder: (context) {
            if (Modular.get<AppController>().resourcesLength == 0) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white70,
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 15.0),
                child: GridView.builder(
                  itemCount: Modular.get<AppController>().resourcesLength,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                  itemBuilder: (context, index) {
                    return ResourceItemWidget(
                        resourceModel:
                            Modular.get<AppController>().resources[index]);
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
