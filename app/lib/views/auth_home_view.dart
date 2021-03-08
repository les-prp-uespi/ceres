import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uespi_reserva/controller/app_controller.dart';
import 'package:uespi_reserva/views/auth_view.dart';
import 'package:uespi_reserva/views/home_view.dart';

class AuthHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Auth auth = Provider.of<Auth>(context);
    return Observer(
      builder: (context){
        return Modular.get<AppController>().token != null ? HomeView() : AuthView();
      },
    );
    //Modular.get<AppController>().token != null ? HomeView() : AuthView();
  }
}
