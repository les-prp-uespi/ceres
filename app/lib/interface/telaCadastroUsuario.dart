import 'package:flutter/material.dart';
import '../servico.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:uespi_reserva/controllers.dart';

class CadastroUsuario extends StatefulWidget {

  @override
  _CadastroUsuarioState createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  Api _api = Api();
  String _nome, _email, _senha, _curso;

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
                buttonCadastro.reset();
              },
                  child: Text("OK"))
            ],
          );
        });
  }

  void _cancelar(){
    nomeController.clear();
    emailController.clear();
    senhaController.clear();
    confirmaController.clear();
    cursoController.clear();
    Navigator.pop(context);
  }

  void _verifica() async{
    if(nomeController.text.isEmpty ||
        emailController.text.isEmpty||
        senhaController.text.isEmpty||
        confirmaController.text.isEmpty||
        cursoController.text.isEmpty
      ){
      buttonCadastro.error();
      _mostraDialog("Campo vazio!", "Todos os campos devem ser prenchidos!");

    }else{
      _nome = nomeController.text;
      _email = emailController.text;
      _curso = cursoController.text;
      if(senhaController.text != confirmaController.text){
        buttonCadastro.error();
        _mostraDialog("As senhas não correspondem",
            "Verifique a senha e tente novamente");

      }else{
        _senha = senhaController.text;
        int _statusCode = await _api.cadastrarUsuario(_nome, _email, _senha, _curso);
        switch (_statusCode){
          case 500:
            _mostraDialog("Erro", "Este Usuário já existe!");
            break;
          case 201:
            Navigator.pop(context);
            nomeController.clear();
            emailController.clear();
            cursoController.clear();
            senhaController.clear();
            confirmaController.clear();
        }

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastre-se"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nomeController,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Nome',
                  labelStyle: TextStyle(fontWeight: FontWeight.w400),
                  hintText: 'Ex:Joao',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  labelText: 'Email',
                  labelStyle: TextStyle(fontWeight: FontWeight.w400),
                  hintText: 'example@example.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: senhaController,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: confirmaController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock_outline),
                  labelText: 'Confirmar Senha',
                  labelStyle: TextStyle(fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: cursoController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  icon: Icon(Icons.school),
                  labelText: 'Curso',
                  labelStyle: TextStyle(fontWeight: FontWeight.w400),
                  hintText: 'Ex:Computação',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RoundedLoadingButton(
                onPressed: _verifica,
                controller: buttonCadastro,
                child: Text("Cadastrar"),
              )
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: FlatButton(onPressed: _cancelar,
                  child: Text("Cancelar")),
            ),
          ],
        ),
      ),
    );
  }
}
