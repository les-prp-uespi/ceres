import 'dart:convert';
import 'modelos/recurso.dart';
import 'package:http/http.dart' as http;
const urlMateriais = "https://uespi-reserva.herokuapp.com/api/materiais";
class Api {

   Future<List<Recurso>> getMateriais() async {
      var request = await http.get(urlMateriais);
      if(request.statusCode == 200){
        var jsonMateriais = json.decode(request.body);
        List<Recurso> materiais = List();
        for (var j in jsonMateriais){
          materiais.add(Recurso(id: j["id"].toString(), nome: j["nome"], tipo: j["tipo"]));
        }
        print(materiais.length);
        return materiais;
        
      }
        return null; 
    
    }

}