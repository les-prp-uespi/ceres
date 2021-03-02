import 'package:flutter/material.dart';
import 'package:uespi_reserva/components/auth_form.dart';

class AuthView extends StatefulWidget {
  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2E75BC),
        elevation: 0,
      ),
      body: Container(
        color: Color(0xff2E75BC),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "CeRes",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/logo.png",
                width: 130,
                height: 130,
              ),
              AuthForm(),
            ],
          ),
        ),
      ),
    );
  }
}
