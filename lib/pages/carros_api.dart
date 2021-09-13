import 'package:carros/dto/usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carros/dto/carro.dart';

enum TipoCarro { classicos, esportivos, luxo }

class CarrosApi {
  static Future<List<Carro>?> getCarros(TipoCarro tipo) async {
    try {
      Usuario? user = await Usuario.get();
      if (user != null) {
        Map<String, String> headers = {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${user.token}"
        };

        String retorno = tipo.toString().replaceAll("TipoCarro.", "");
        Uri url = Uri.parse(
            'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$retorno');
        var response = await http.get(url, headers: headers);

        //como retorna em colchetes é uma lista então não usa map
        List list = json.decode(response.body);

        /*      final carros = <Carro>[];
              for (Map map in list)
                {
                  Carro c = Carro.fromJson(map);
                  carros.add(c);
                }*/

        final carros = list.map<Carro>((xxx) => Carro.fromJson(xxx)).toList();

        return carros;
      } else {
        return null;
      }
    } catch (error, exception) {
      print("Catch: + $exception");
    }
  }
}

/*
class CarrosApi{
  static Future<List<Carro>> getCarros() async{

    await Future.delayed(Duration(seconds: 2));
    final List<Carro>  carros = [
    Carro(nome: "McLAREN MP4-12C"
      ,urlFoto: "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/McLAREN.png"
      ,desc: "Desc McLAREN MP4-12C"),
    Carro(nome: "Maserati Grancabrio Sport"
       ,urlFoto: "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/Maserati_Grancabrio_Sport.png"
       ,desc: "Desc Maserati Grancabrio Sport"),
    Carro(nome: "BMW M5"
       ,urlFoto: "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/BMW.png"
       ,desc: "Desc BMW M5")];

    return carros;
  }
}*/
