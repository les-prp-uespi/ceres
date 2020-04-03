import 'package:flutter/material.dart';
import '../servico.dart';

class CadastroUsuario extends StatefulWidget {
  @override
  _CadastroUsuarioState createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  Api _api = Api();

  var _nomeController = TextEditingController();
  var _emailController = TextEditingController();
  var _senhaController = TextEditingController();
  var _confirmaController = TextEditingController();
  var _cursoController = TextEditingController();
  String _nome, _email, _senha, _curso;
  void _cancelar(){
    _nomeController.clear();
    _emailController.clear();
    _senhaController.clear();
    _confirmaController.clear();
    _cursoController.clear();
    Navigator.pop(context);
  }
  void _verifica(){
    if(_nomeController.text.isEmpty ||
        _emailController.text.isEmpty||
        _senhaController.text.isEmpty||
        _confirmaController.text.isEmpty||
        _cursoController.text.isEmpty
      ){
      showDialog(context: context,
          builder: (context){
            return AlertDialog(
              title: Text("Nome Vazio !",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),
              content: Text("Todos os campos devem ser preenchidos",
                style: TextStyle(fontSize: 18),),
              actions: <Widget>[
                FlatButton(onPressed:(){
                  Navigator.pop(context);
                },
                    child: Text("OK"))
              ],
            );
          });
    }else{
      _nome = _nomeController.text;
      _email = _emailController.text;
      _curso = _cursoController.text;
      if(_senhaController.text == _confirmaController.text){
        _senha = _senhaController.text;
        _api.cadastrarUsuario(_nome, _email, _senha, _curso);
        Navigator.pop(context);
      }else{
        showDialog(context: context,
            builder: (context){
              return AlertDialog(
                title: Text("As senhas não correspondem!",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),
                content: Text("Digite novamente",
                  style: TextStyle(fontSize: 18),),
                actions: <Widget>[
                  FlatButton(onPressed:(){
                    Navigator.pop(context);
                  },
                      child: Text("OK"))
                ],
              );
            });
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
                controller: _nomeController,
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
                controller: _emailController,
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
                controller: _senhaController,
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
                controller: _confirmaController,
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
                controller: _cursoController,
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
              child: Container(
                width: 300.0,
                alignment: Alignment.center,
                color: Colors.blue,
                child: FlatButton(onPressed:_verifica,
                    child: Text("Cadastrar",
                        style: TextStyle(fontSize: 15.0))),
              ),
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
