import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String label = "";
  String hint = "";
  bool password = false;
  TextEditingController? controller;
  FormFieldValidator<String>? validator;
  TextInputAction? textInputAction;
  FocusNode? focusNode;
  FocusNode? nextFocus;

  AppText(this.label, this.hint,
      {this.password = false,
      this.controller,
      this.validator,
      this.textInputAction,
      this.focusNode,
      this.nextFocus});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,

//definir tipo de campo que aceita
//keyboardType: TextInputType.emailAddress,
//defini aparencia não vi nada
//keyboardAppearance: Brightness.dark,
//defini botão seguinte ou concluido passar
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      style: TextStyle(
        fontSize: 15,
        color: Colors.blue,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        hintText: hint,
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 25,
          color: Colors.green,
        ),
      ),
    );
  }
}
