

import 'package:carros/dto/carro.dart';
import 'package:flutter/material.dart';

class CarroPage extends StatelessWidget {
  Carro carro;
  CarroPage(this.carro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),

      ),
      body: _body(),
    );
  }

  _body() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Image.network(carro.urlFoto),
    );
  }
}
