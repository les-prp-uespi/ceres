import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:uespi_reserva/modelos/reservas.dart';
import 'package:uespi_reserva/modelos/usuario.dart';
import 'modelos/recurso.dart';
import 'package:http/http.dart' as http;
import 'package:date_format/date_format.dart';

const urlMateriais = "https://uespi-reserva.herokuapp.com/api/materiais";
const urlUsuarios = "https://uespi-reserva.herokuapp.com/api/usuario";
const urlReservas = "https://uespi-reserva.herokuapp.com/api/reservar";

Usuario user;

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

    void cadastrarUsuario(String _nome, String _login, String _senha, String _curso) async{
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


   void atualizarUsuario(String _nome, String _login, String _senha, String _curso) async{
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
   }

   void excluirUsuario() async {
     http.Response response = await http.delete(
       urlUsuarios + "/${Usuario.id}",
       headers: {
         HttpHeaders.authorizationHeader: 'Bearer ${Usuario.token}'
       },
     );

     print("${response.statusCode}");
     print("${response.body}");
   }


   //Requisições de Reservas

   Future reservar(DateTime _data, TimeOfDay _hi, TimeOfDay _hf, int _idM, int _idU) async {

     http.Response response = await http.post(
         urlReservas,
         headers: {
           HttpHeaders.authorizationHeader: 'Bearer ${Usuario.token}'
         },
         body:
         {

           "data":"${formatDate(_data, [dd,':',mm,':',yyyy])}",
           "horario_inicio":"${_hi.hour}:${_hi.minute}",
           "horario_final":"${_hf.hour}:${_hf.minute}",
           "id_material": "$_idM",
           "id_usuario": "$_idU"

         }
     );

     print(response.statusCode);
     print(response.body);


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
             idMaterial: j["id_material"]


         ));
       }
       print(reservas.length);
       return reservas;

     }
     return null;

   }

   void editarReserva(DateTime _data, TimeOfDay _hi, TimeOfDay _hf, int _idM, int _idU, int _idReserv) async {
     print("edit");
     http.Response response = await http.put(
         urlReservas + "/$_idReserv",
         headers: {
           HttpHeaders.authorizationHeader: 'Bearer ${Usuario.token}'
         },
         body:
         {

           "data":"${formatDate(_data, [dd,':',mm,':',yyyy])}",
           "horario_inicio":"${_hi.hour}:${_hi.minute}",
           "horario_final":"${_hf.hour}:${_hf.minute}",
           "id_material": "$_idM",
           "id_usuario": "$_idU"

         }
     );

     print(response.statusCode);
     print(response.body);

   }

   void excluirReserva(_idReserva) async {
     http.Response response = await http.delete(
       urlReservas + "/${_idReserva}",
       headers: {
         HttpHeaders.authorizationHeader: 'Bearer ${Usuario.token}'
       },
     );

     print("${response.statusCode}");
     print("${response.body}");
   }

}