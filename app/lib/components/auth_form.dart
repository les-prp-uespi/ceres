import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uespi_reserva/provider/auth_provider.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool _visibilityPass = true;
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> data = {"email": "", "password": ""};

  _login(BuildContext context) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    Provider.of<Auth>(context, listen: false).login(data['email'], data['password']);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(left: 20, right: 20, top: 30),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(color: Colors.blueAccent),
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  data["email"] = value;
                },
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
                onChanged: (value) {
                  data["password"] = value;
                },
              ),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.blue)),
                onPressed: () {
                  _login(context);
                },
                child: Text(
                  "ENTRAR",
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
