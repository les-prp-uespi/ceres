import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uespi_reserva/controller/app_controller.dart';
import 'package:uespi_reserva/util/name_routes.dart';
import 'package:uespi_reserva/views/reservations_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff001F74),
        title: Text("CeRes"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Modular.get<AppController>().logout();
              })
        ],
      ),
      body: PageView(
        controller: pageController,
        children: [home(), ReservationView()],
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: pageController,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              unselectedItemColor: Colors.white,
              currentIndex: pageController?.page?.round() ?? 0,
              onTap: (index) {
                pageController.jumpToPage(index);
              },
              backgroundColor: Color(0xff001F74),
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.library_books), label: "Minhas Reservas"),
              ],
            );
          }),
    );
  }

  Widget home() => Container(
        color: Color(0xff2E75BC),
        height: double.infinity,
        padding: EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              width: 140,
              height: 140,
            ),
            SizedBox(
              height: 80,
              child: Text(
                "Bem-vindos à Central de Reservas",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(7)),
                child: Text("Nova Reserva", style: TextStyle(fontSize: 16),),
                onPressed: () {
                  Modular.to.pushNamed(Routes.RESOURCES_VIEW);
                })
          ],
        ),
      );
}
