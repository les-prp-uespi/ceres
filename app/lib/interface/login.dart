import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uespi_reserva/interface/telaMateriais.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:uespi_reserva/servico.dart';
import 'package:uespi_reserva/modelos/usuario.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var _userlogin = TextEditingController();
  var _senhalogin = TextEditingController();
  String url = "https://uespi-reserva.herokuapp.com/";

  var _buttonController = RoundedLoadingButtonController();

  void vaiCadastro(){
    Navigator.pushNamed(context, "/cadastroUsuario");

  }

  void _login() async {
    http.Response response = await http.post(
      url,
      body:
        {
          "login":"${_userlogin.text}",
          "senha": "${_senhalogin.text}"
        }
    );
    if(_userlogin.text.isEmpty || _senhalogin.text.isEmpty){
      _buttonController.error();
      showDialog(context: context,
          builder: (context){
            return AlertDialog(
              title: Text("Usuário ou senha inválido(a) !",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),
              content: Text("Todos os campos devem ser preenchidos",
                style: TextStyle(fontSize: 18),),
              actions: <Widget>[
                FlatButton(onPressed:(){
                  _buttonController.reset();
                  Navigator.pop(context);
                },
                    child: Text("OK"))
              ],
            );
          });
    }else
    if(response.statusCode == 200){
       Usuario.token = json.decode(response.body)["token"];
       Usuario.id = json.decode(response.body)["user_id"];
       _buttonController.success();
       Future.delayed(
        Duration(seconds: 0),
           (){return _entrar();}
       );
    }else{
      _buttonController.error();
      showDialog(context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Não é possivel fazer login !",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),
          content: Text("Verifique email e senha e tente novamente !",
          style: TextStyle(fontSize: 18),),
          actions: <Widget>[
            FlatButton(onPressed:(){
              _buttonController.reset();
              Navigator.pop(context);
            },
              child: Text("OK"))
          ],
        );
      });
    }

  }

  @override
  void _entrar(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TelaMateriais()));

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
                      controller: _userlogin,
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
                      controller: _senhalogin,
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
                  padding: const EdgeInsets.all(10.0),
                  child: RoundedLoadingButton(onPressed: _login,
                      controller: _buttonController,
                      child: Text("Entrar",
                      style: TextStyle(fontSize: 15.0))),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: FlatButton(onPressed: vaiCadastro,
                      child: Text("Cadastre-se")),
                ),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}

