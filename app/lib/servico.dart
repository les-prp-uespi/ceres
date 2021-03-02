import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:uespi_reserva/modelos/reservas.dart';
import 'package:uespi_reserva/modelos/usuario.dart';
import 'modelos/recurso.dart';
import 'package:http/http.dart' as http;
import 'package:date_format/date_format.dart';
import 'package:uespi_reserva/controllers.dart';


const urlMateriais = "https://uespi-reserva.herokuapp.com/api/materiais";
const urlUsuarios = "https://uespi-reserva.herokuapp.com/api/usuario";
const urlReservas = "https://uespi-reserva.herokuapp.com/api/reservar";
const urlBase = "https://uespi-reserva.herokuapp.com/";


Usuario user;
List<String> horarios = ["8:00", "8:50", "9:40", "10:30", "11:20", "12:00", "14:00",
  "14:50", "15:40", "16:30", "17:20", "18:00", "18:50", "19:40", "20:30",
  "21:20", "22:00"];

var coresI = [Colors.white, Colors.white,Colors.white,Colors.white,Colors.white,
  Colors.white,Colors.white, Colors.white,Colors.white,Colors.white,Colors.white,
  Colors.white,Colors.white, Colors.white,Colors.white,Colors.white,Colors.white];

var coresF = [Colors.white, Colors.white,Colors.white,Colors.white,Colors.white,
  Colors.white,Colors.white, Colors.white,Colors.white,Colors.white,Colors.white,
  Colors.white,Colors.white, Colors.white,Colors.white,Colors.white,Colors.white];

class Api {


  //Requisições de Materiais

   Future<List<Recurso>> getMateriais() async {
      var request = await http.get(urlMateriais);
      if(request.statusCode == 200){
        var jsonMateriais = json.decode(request.body);
        List<Recurso> materiais = List();
        for (var j in jsonMateriais){
          materiais.add(Recurso(id: j["id"], nome: j["nome"], tipo: j["tipo"]));
        }
        print(materiais.length);
        return materiais;
        
      }
        return null;

    }

    //Requisições de Usuário

    Future cadastrarUsuario(String _nome, String _login, String _senha, String _curso) async{
     http.Response response = await http.post(
         urlUsuarios,
       body:
       {

         "nome":"$_nome",
         "login":"$_login",
         "senha":"$_senha",
         "curso":"$_curso"
       }
     );

     print(response.statusCode);
     print(response.body);

     switch(response.statusCode){
       case 500:
         buttonCadastro.error();
         return response.statusCode;
         break;
       case 201:
         buttonCadastro.success();
         return response.statusCode;

     }
    }


    Future login() async{
      http.Response response = await http.post(
          urlBase,
          body:
          {
            "login":"${userlogin.text}",
            "senha": "${senhalogin.text}"
          }
      );

      print(response.statusCode);
        switch (response.statusCode){
          case 200:
            Usuario.token = json.decode(response.body)["token"];
            Usuario.id = json.decode(response.body)["user_id"];
            buttonController.success();
            return response.statusCode;
            break;
          case 500:
            buttonController.error();
            return response.statusCode;
          case 401:
            buttonController.error();
            return response.statusCode;
          case 404:
            buttonController.error();
            return response.statusCode;
        }

    }


   Future getUser() async {
     var request = await http.get(
       urlUsuarios + "/${Usuario.id}",
     headers: {
         HttpHeaders.authorizationHeader: 'Bearer ${Usuario.token}'
     });
     if(request.statusCode == 200){
       var jsonUsuario = json.decode(request.body);
       user = Usuario(
           nome: jsonUsuario["nome"],
           login: jsonUsuario["login"],
           senha: jsonUsuario["senha"],
           curso: jsonUsuario["curso"]
       );
     }

   }


   Future atualizarUsuario(String _nome, String _login, String _senha, String _curso) async{
     http.Response response = await http.put(
         urlUsuarios + "/${Usuario.id}",
         headers: {
           HttpHeaders.authorizationHeader: 'Bearer ${Usuario.token}'
         },
         body:
         {

           "nome":"$_nome",
           "login":"$_login",
           "senha":"$_senha",
           "curso":"$_curso"
         }
     );

     print(response.statusCode);
     print(response.body);

     switch(response.statusCode){
       case 500:
         buttonSalvaUser.error();
         return response.statusCode;
         break;
       case 200:
         buttonSalvaUser.success();
         return response.statusCode;

     }

   }

   Future excluirUsuario() async {
     http.Response response = await http.delete(
       urlUsuarios + "/${Usuario.id}",
       headers: {
         HttpHeaders.authorizationHeader: 'Bearer ${Usuario.token}'
       },
     );

     print("${response.statusCode}");
     print("${response.body}");

      return response.statusCode;
   }


   void logOut() async {
     http.Response response = await http.post(
         urlBase + "logout",
       headers: {
         HttpHeaders.authorizationHeader: 'Bearer ${Usuario.token}'
       },
     );
     print(response.body);
   }

   //Requisições de Reservas

   Future reservar(DateTime _data, String _hi, String _hf, int _idM, int _idU) async {

     http.Response response = await http.post(

         urlReservas,
         headers: {
           HttpHeaders.authorizationHeader: 'Bearer ${Usuario.token}'
         },
         body:
         {

           "data":"${formatDate(_data, [dd,':',mm,':',yyyy])}",
           "horario_inicio":"$_hi",
           "horario_final":"$_hf",
           "id_material": "$_idM",
           "id_usuario": "$_idU"

         }
     );

     print(response.statusCode);
     print(response.body);

     switch(response.statusCode){
       case 500:
         buttonReservar.error();
         return response.statusCode;
         break;
       case 201:
         buttonReservar.success();
         return response.statusCode;

     }
   }

   Future<List<Reserva>> getReservas() async {
     var request = await http.get(urlReservas + "/${Usuario.id}",
       headers: {
         HttpHeaders.authorizationHeader: 'Bearer ${Usuario.token}'
       },);
     if(request.statusCode == 200){
       var jsonReservas = json.decode(request.body);
       List<Reserva> reservas = List();
       for (var j in jsonReservas){
         reservas.add(Reserva(
             idReserva: j["id_reserva"],
             data: j["data"],
             horarioInicio: j["horario inicio"],
             horarioFinal: j["horario final"],
             nomeMaterial: j["nome_material"],
             tipoMAterial: j["tipo"],
             idMaterial: j["id_material"],

         ));
       }
       print(reservas.length);
       return reservas;

     }
     return null;

   }

   Future editarReserva(DateTime _data, String _hi, String _hf, int _idM, int _idU, int _idReserv) async {

     print("edit");
     http.Response response = await http.put(
         urlReservas + "/$_idReserv",
         headers: {
           HttpHeaders.authorizationHeader: 'Bearer ${Usuario.token}'
         },
         body:
         {

           "data":"${formatDate(_data, [dd,':',mm,':',yyyy])}",
           "horario_inicio":"$_hi",
           "horario_final":"$_hf",
           "id_material": "$_idM",
           "id_usuario": "$_idU"

         }
     );

     print(response.statusCode);
     print(response.body);
     switch(response.statusCode){
       case 500:
         buttonReservar.error();
         return response.statusCode;
         break;
       case 200:
         buttonReservar.success();
         return response.statusCode;
     }
   }

   void excluirReserva(_idReserva) async {
     http.Response response = await http.delete(
       urlReservas + "/$_idReserva",
       headers: {
         HttpHeaders.authorizationHeader: 'Bearer ${Usuario.token}'
       },
     );

     print("${response.statusCode}");
     print("${response.body}");
   }

}