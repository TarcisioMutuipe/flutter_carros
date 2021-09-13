
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';
class Usuario {
    late int? id;
    late String? login;
    late String? nome;
    late String? email;
    String? urlFoto;
    late String? token;
    late List<String>? roles;

    Usuario.fromJson(Map<dynamic, dynamic> json) {
      id = json['id'];
      login = json['login'];
      nome = json['nome'];
      email = json['email'];
      urlFoto = json['urlFoto'];
      token = json['token'];
      roles = json['roles'].cast<String>();
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      data['login'] = this.login;
      data['nome'] = this.nome;
      data['email'] = this.email;
      data['urlFoto'] = this.urlFoto;
      data['token'] = this.token;
      data['roles'] = this.roles;
      return data;
    }

    void save() async{
      var prefs = await SharedPreferences.getInstance();
      Map map = toJson();
      String json = convert.json.encode(map);
      prefs.setString("userP", json);
    }

    static Future<Usuario?> get() async{
      var prefs = await SharedPreferences.getInstance();
      Usuario user;
      String json = prefs.getString("userP")!;
      if(json.isEmpty){
        return null;
      }
      Map map = convert.json.decode(json);
      user = Usuario.fromJson(map);
      return user;
    }

    @override
  String toString() {
    return 'Usuario{id: $id, login: $login, nome: $nome, '
        'email: $email, urlFoto: $urlFoto, token: $token, roles: $roles}';
  }

  static void Clear() async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("userP", "");
  }
}