import 'package:carros/dto/api_response.dart';
import 'package:carros/dto/usuario.dart';
import 'package:carros/pages/home_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:carros/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'login_api.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _tLogin = TextEditingController();

  final _tSenha = TextEditingController();

  final _focusSenha = FocusNode();

  bool _showProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future<Usuario?> future = Usuario.get();
    future.then((Usuario? user) {
      if (user != null) {
        pushReplace(context, HomePage());
        setState(() {
          _tLogin.text = user.login!;
        });
      } else {
        _tLogin.text = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("Carros")),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppText("Login", "Digite o Login", controller: _tLogin,
                validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Campo Obrigatório";
              }
              return null;
            }, textInputAction: TextInputAction.next),
            SizedBox(
              height: 10,
            ),
            AppText("Senha", "Digite a Senha",
                password: true,
                controller: _tSenha, validator: (String? value) {
              if (value == null || value.isEmpty) return "Campo Obrigatório";
              if (value.length < 3)
                return "Senha deve conter no minimo 6 caracteres";
              return null;
            },
                textInputAction: TextInputAction.done,
                focusNode: _focusSenha,
                nextFocus: _focusSenha),
            SizedBox(
              height: 20,
            ),
            AppButton("Login",
                onPressed: _onClickLogin, showProgress: _showProgress),
          ],
        ),
      ),
    );
  }

  _text(
    String label,
    String hint, {
    bool password = false,
    TextEditingController? controller,
    FormFieldValidator<String>? validator,
    TextInputAction? textInputAction,
    FocusNode? focusNode,
    FocusNode? nextFocus,
  }) {}

  _button(String text, VoidCallback onPressed) {}

  _onClickLogin() async {
    bool? formOk = _formKey.currentState?.validate();
    if (!formOk!) {
      return;
    }
    setState(() {
      _showProgress = true;
    });
    String login = _tLogin.text;
    String senha = _tSenha.text;

    print(login + senha);
    ApiResponse apiUser = await LoginApi.loginToken(login, senha);

    if (apiUser.ok) {
      pushReplace(context, HomePage());
      _tSenha.text = "";
      _tLogin.text = "";
    } else {
      Fluttertoast.showToast(
          msg: apiUser.msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 4,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    setState(() {
      _showProgress = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
