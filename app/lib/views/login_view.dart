import 'package:flutter/material.dart';
import 'package:uespi_reserva/components/auth_form.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
              Image.asset(
                "assets/logo.png",
                width: 150,
                height: 150,
              ),
              AuthForm(),
            ],
          ),
        ),
      ),
    );
  }
}
