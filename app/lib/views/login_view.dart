import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _visibilityPass = false;
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
            children: [
              Image.asset(
                "assets/logo.png",
                width: 200,
                height: 200,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 20),
                  child: Form(
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: "E-mail",
                            labelStyle: TextStyle(color: Colors.blueAccent),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            labelStyle: TextStyle(
                              color: Colors.blueAccent,
                            ),
                            suffixIcon: IconButton(
                              color: Colors.white,
                              icon: Icon(_visibilityPass
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _visibilityPass = !_visibilityPass;
                                });
                              },
                            ),
                            
                          ),
                          obscureText: _visibilityPass,
                        ),
                        FlatButton(onPressed: () {}, child: Text("Entrar"))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
