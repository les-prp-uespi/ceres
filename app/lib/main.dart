import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
//import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:uespi_reserva/app_modular.dart';


void main() {
  initializeDateFormatting().then(
    (_) => runApp(
      ModularApp(
        module: AppModule(),
      ),
    ),
  );
}
/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, ControllerProvider>(
          create: (context) => ControllerProvider(),
          update: (context, auth, prod) {
            return ControllerProvider(token: auth.token);
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthHomeView(),
        routes: {
          Routes.LOGIN_VIEW: (ctx) => AuthView(),
          Routes.HOME_VIEW: (ctx) => HomeView(),
          Routes.RESOURCES_VIEW: (ctx) => ResourceView(),
          Routes.CREATE_RESERVATION_VIEW: (ctx) => CreateReservationView(),
          Routes.RESERVATION_VIEW: (ctx) => ReservationView(),
          Routes.UPDATE_RESERVATION_VIEW: (ctx) => UpdateReservationView()
        },
      ),
    );
  }
}
*/
