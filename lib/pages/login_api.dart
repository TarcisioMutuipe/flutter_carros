import 'dart:convert';

import 'package:carros/dto/api_response.dart';
import 'package:carros/dto/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String login, String senha) async
  {
    Map params = {
      'login': login,
      'senha': senha
    };

    var url = Uri.parse('http://livrowebservices.com.br/rest/login');
    var response = await http.post(url, body: params);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return true;
  }

  static Future<ApiResponse<Usuario>> loginToken(String login, String senha) async
  {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json"
      };

      Map params = {
        "username": login,
        "password": senha
      };
      String paramsJson = json.encode(params);

      var url = Uri.parse(
          'https://carros-springboot.herokuapp.com/api/v2/login');
      var response = await http.post(url, body: paramsJson, headers: headers);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        Usuario user = Usuario.fromJson(mapResponse);
        return ApiResponse.ok(user);
      }
      else {
        return ApiResponse.error(mapResponse["error"]);
      }
    }
    catch(error, exception){
        print("Erro no login $error . $exception");
        return ApiResponse.error("Não foi possivel fazer login!!");
    }
  }
}
