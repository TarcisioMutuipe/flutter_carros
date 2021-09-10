import 'package:carros/pages/login_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Adicionei o SafeArea para no menu lateral mostrar os icones de hora wifi e outros ali de cima do celular
    return SafeArea(
      child: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Tarcisio Silva Santos"),
                accountEmail: Text("tarcisiusantos@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  // backgroundImage: AssetImage("assets/images/dog1.png"),
                  backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2012/11/21/17/02/lion-66898_960_720.jpg"),
                ),
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text("Favoritos"),
                subtitle: Text("Mais Informações"),
                trailing: Icon(Icons.arrow_forward),
                onTap: (){
                  print("Item 1");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text("Ajuda"),
                subtitle: Text("Mais Informações"),
                trailing: Icon(Icons.arrow_forward),
                onTap: (){
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
          )
      ),
    );
  }

  _onClickLogout(BuildContext context) {
    Navigator.pop(context);
    pushReplace(context, LoginPage());
  }
}
