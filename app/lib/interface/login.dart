import 'package:flutter/material.dart';
import 'package:uespi_reserva/interface/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void _entrar(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));

  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset('assets/logo.png',
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
            SizedBox(
              height: 50.0,
            ),
            Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
            Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'Email',
                        labelStyle: TextStyle(fontWeight: FontWeight.w400),
                        hintText: 'example@example.com',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock_outline),
                        labelText: 'Senha',
                        labelStyle: TextStyle(fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.centerRight,
                  child: FlatButton(onPressed: () =>{},
                      child: Text("Esqueci minha Senha")),
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Container(
                    alignment: Alignment.center,
                   color: Colors.blue,
                    child: FlatButton(onPressed: _entrar,
                        child: Text("Entrar",
                        style: TextStyle(fontSize: 15.0))),
                  ),
                )
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}

