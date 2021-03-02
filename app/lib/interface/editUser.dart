import 'package:flutter/material.dart';
import 'package:uespi_reserva/servico.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:uespi_reserva/controllers.dart';


class EditUser extends StatefulWidget {
  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
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
                buttonSalvaUser.reset();
              },
                  child: Text("OK"))
            ],
          );
        });
  }

  void _excluir() async{
    showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Excluir Usuário!",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),
            content: Text("Deseja Realmente Excluir seu Login? ",
              style: TextStyle(fontSize: 18),),
            actions: <Widget>[
              FlatButton(
                  onPressed:(){
                Navigator.pop(context);
                buttonExcluiUser.reset();
                },
                  child: Text("Não")),
              FlatButton(
                  onPressed: () async {
                    int _statusCode = await _api.excluirUsuario();
                    switch (_statusCode){
                      case 200:
                        Navigator.pushNamed(context, '/login');
                        break;
                      case 500:
                        Navigator.pop(context);
                        _mostraDialog("Erro", "Não foi possível excluir o usuário");
                        buttonExcluiUser.reset();
                    }
                    },
                  child: Text("SIM"))
            ],
          );
        });
  }

  void _cancelar(){
    nomeEdit.clear();
    emailEdit.clear();
    senhaEdit.clear();
    confirmaEdit.clear();
    cursoEdit.clear();
    Navigator.pop(context);
  }
  void _verifica() async{
    if(nomeEdit.text.isEmpty ||
        emailEdit.text.isEmpty||
        senhaEdit.text.isEmpty||
        confirmaEdit.text.isEmpty||
        cursoEdit.text.isEmpty
    ){
      buttonSalvaUser.error();
      _mostraDialog("Campo vazio!", "Todos os campos devem ser preenchidos!");

    }else{
      _nome = nomeEdit.text;
      _email = emailEdit.text;
      _curso = cursoEdit.text;
      if(senhaEdit.text != confirmaEdit.text){
        buttonSalvaUser.error();
        _mostraDialog("As senhas não correspondem",
            "Verifique a senha e tente novamente");

      }else{
        _senha = senhaEdit.text;
        int _statusCode = await _api.atualizarUsuario(_nome, _email, _senha, _curso);
        switch (_statusCode){
          case 500:
            _mostraDialog("Erro", "Este Usuário já existe!");
            break;
          case 200:
            Navigator.pop(context);
            nomeEdit.clear();
            emailEdit.clear();
            cursoEdit.clear();
            senhaEdit.clear();
            confirmaEdit.clear();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Perfil"),
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
                controller: nomeEdit..text = '${user.nome}',
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
              child: TextFormField(
                controller: emailEdit..text = '${user.login}',
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
                keyboardType: TextInputType.text,
                obscureText: true,
                controller: senhaEdit,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock_outline),
                  labelText: 'Nova Senha',
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
                keyboardType: TextInputType.text,
                obscureText: true,
                controller: confirmaEdit,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock_outline),
                  labelText: 'Confirmar Nova Senha',
                  labelStyle: TextStyle(fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: cursoEdit..text = '${user.curso}',
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
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RoundedLoadingButton(
                  controller: buttonSalvaUser,
                  onPressed:_verifica,
                  child: Text("Salvar Mudanças",
                      style: TextStyle(fontSize: 15.0))),
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: FlatButton(onPressed: _cancelar,
                  child: Text("Cancelar")),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RoundedLoadingButton(
                  controller: buttonExcluiUser,
                  onPressed:_excluir,
                  color: Colors.red,
                  child: Text("Excluir Usuário",
                      style: TextStyle(fontSize: 15.0))),
            ),
          ],
        ),
      ),
    );
  }
}
