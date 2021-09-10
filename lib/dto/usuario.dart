class Usuario {
    late int id;
    late String login;
    late String nome;
    late String email;
    String? urlFoto;
    late String token;
    late List<String>? roles;

    Usuario.fromJson(Map<dynamic,dynamic> map):
       nome = map["nome"],
       email = map["email"],
       id = map["id"],
       login = map["login"],
       urlFoto = map["urlFoto"],
       token = map["token"],
       roles = map["roles"] != null ?
               map["roles"].map<String>((role) => role.toString()).toList() : null;

    @override
  String toString() {
    return 'Usuario{id: $id, login: $login, nome: $nome, '
        'email: $email, urlFoto: $urlFoto, token: $token, roles: $roles}';
  }
}