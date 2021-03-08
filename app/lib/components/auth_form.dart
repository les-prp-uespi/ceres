import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:uespi_reserva/controller/app_controller.dart';
import 'package:uespi_reserva/provider/auth_provider.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool _visibilityPass = true;
  bool _isLoading = false;
  bool _createAccount = false;
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> data = {"email": "", "password": "", "name": ""};

  _login(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    setState(() {
      _isLoading = true;
    });

    await Modular.get<AppController>().login(data['email'], data['password']);
    setState(() {
      _isLoading = false;
    });
  }

  _create(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    if (!_formKey.currentState.validate()) {
      setState(() {
        _isLoading = false;
      });
      return;
    }
    int resp = await Modular.get<AppController>().createAccount(
      data['name'],
      data['email'],
      data['password'],
    );

    if (resp == 401) {
      setState(
        () {
          _isLoading = false;
        },
      );
      return "Verifique seus dados!";
    } else if (resp == 400) {
      setState(
        () {
          _isLoading = false;
        },
      );
      return "Senha muito comum!";
    }

    setState(
      () {
        _isLoading = false;
      },
    );

    return null;
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
              if (_createAccount)
                TextField(
                  decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                  ),
                  keyboardType: TextInputType.text,
                  onSubmitted: (name) {
                    data["name"] = name;
                  },
                ),
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
              TextFormField(
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
                validator: (str) {
                  if (str.length < 8) {
                    return "Senha tem que possuir 8 caracteres!";
                  }
                  return null;
                },
                obscureText: _visibilityPass,
                onChanged: (value) {
                  data["password"] = value;
                },
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    _createAccount = !_createAccount;
                  });
                },
                child: _createAccount
                    ? Text("Possui conta ?")
                    : Text("Não possui conta ?"),
              ),
              _isLoading
                  ? CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    )
                  : RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.blue)),
                      onPressed: _createAccount
                          ? () async {
                              String msg = await _create(context);
                              if (msg != null) {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(content: Text(msg)));
                              }
                            }
                          : () async {
                              String msg = await _login(context);
                              if (msg != null) {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(content: Text(msg)));
                              }
                            },
                      child: Text(
                        _createAccount ? "CRIAR CONTA" : "ENTRAR",
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
