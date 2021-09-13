import 'package:carros/dto/usuario.dart';
import 'package:carros/pages/login_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  UserAccountsDrawerHeader _header(Usuario user) {
    return UserAccountsDrawerHeader(
      accountName: Text(user.nome!),
      accountEmail: Text(user.email!),
      currentAccountPicture: CircleAvatar(
        // backgroundImage: AssetImage("assets/images/dog1.png"),
        backgroundImage: NetworkImage(user.urlFoto!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Adicionei o SafeArea para no menu lateral mostrar os icones de hora wifi e outros ali de cima do celular
    return SafeArea(
      child: Drawer(
          child: ListView(
        children: <Widget>[
          // Sempre que precisar usar um objeto Future criar o FutureBuilder
          FutureBuilder<Usuario?>(
            builder: (context, snapshot) {
              Usuario user = snapshot.data! ;
              return user != null ? _header(user) : Container();
            },
            future: Usuario.get(),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Favoritos"),
            subtitle: Text("Mais Informações"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print("Item 1");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Ajuda"),
            subtitle: Text("Mais Informações"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print("Item 1");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
            subtitle: Text("Mais Informações"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => _onClickLogout(context),
          )
        ],
      )),
    );
  }

  _onClickLogout(BuildContext context) {
    Usuario.Clear();
    Navigator.pop(context);
    pushReplace(context, LoginPage());
  }
}
