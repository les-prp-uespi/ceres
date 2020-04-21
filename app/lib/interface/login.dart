import 'package:flutter/material.dart';
import 'package:uespi_reserva/interface/telaMateriais.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:uespi_reserva/controllers.dart';
import 'package:uespi_reserva/servico.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Api _api = Api();

  void _mostraDialog(_titulo, _corpo){
    showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title: Text(_titulo,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),
            content: Text(_corpo,
              style: TextStyle(fontSize: 18),),
            actions: <Widget>[
              FlatButton(onPressed:(){
                Navigator.pop(context);
                buttonController.reset();
              },
                  child: Text("OK"))
            ],
          );
        });
  }


  void vaiCadastro(){
    Navigator.pushNamed(context, "/cadastroUsuario");
  }

  void _login() async {

    if(userlogin.text.isEmpty || senhalogin.text.isEmpty) {
      buttonController.error();
      _mostraDialog("Campo Vazio!", "Todos os Campos devem ser preenchidos");
    }else{
      int _statusCode = await _api.login();
      switch (_statusCode){
        case 200:
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TelaMateriais()));
          userlogin.clear();
          senhalogin.clear();
          break;
        case 500:
          _mostraDialog("Erro", "Tente Novamente mais tarde");
          break;
        case 401:
          _mostraDialog("Login não autorizado", "Senha incorreta!");
          break;
        case 404:
          _mostraDialog("Usuário invaálido", "Este Usuário não existe");

      }
    }
  }


  @override
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
                      controller: userlogin,
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
                      controller: senhalogin,
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
                      controller: buttonController,
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

