import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String text;
  VoidCallback? onPressed;
  bool showProgress = false;
  //o onpressed entre chaves para ser opcional
  AppButton(this.text, {this.onPressed, this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
          tapTargetSize: MaterialTapTargetSize.padded,
          fixedSize: MaterialStateProperty.all<Size>(Size.infinite),
        ),
        onPressed: onPressed,
        child:
        showProgress ? Center(child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
        )) :
        Text(
          text,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
