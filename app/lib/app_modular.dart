import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uespi_reserva/api/api_repository.dart';
import 'package:uespi_reserva/app_widget.dart';
import 'package:uespi_reserva/controller/app_controller.dart';
import 'package:uespi_reserva/util/name_routes.dart';
import 'package:uespi_reserva/views/auth_home_view.dart';
import 'package:uespi_reserva/views/create_reservation_view.dart';
import 'package:uespi_reserva/views/home_view.dart';
import 'package:uespi_reserva/views/resource_view.dart';
import 'package:uespi_reserva/views/update_reservation_view.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ApiRepository.instance),
        Bind((i) => AppController(i()))
        //Bind((i) => AuxController(i()))
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Routes.LOGIN_VIEW, child: (_, __) => AuthHomeView()),
        ModularRouter(Routes.HOME_VIEW, child: (_, __) => HomeView()),
        ModularRouter(Routes.CREATE_RESERVATION_VIEW,
            child: (_, __) => CreateReservationView()),
        ModularRouter(Routes.RESOURCES_VIEW, child: (_, __)=> ResourceView()),
        ModularRouter(Routes.UPDATE_RESERVATION_VIEW, child:(_, __)=> UpdateReservationView()),
        //ModularRouter(RoutesName.PURCHASING, child: (_, __) => PurchasingView())
      ];
}
