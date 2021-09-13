import 'package:carros/dto/carro.dart';
import 'package:carros/pages/carro_page.dart';
import 'package:carros/pages/carros_api.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class CarrosListView extends StatefulWidget {
  final TipoCarro tipo;

  const CarrosListView(this.tipo);

  @override
  _CarrosListViewState createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView>
    with AutomaticKeepAliveClientMixin<CarrosListView> {
  // isso é pra sobrescrever por usar o AutomaticKeepAliveClientMixin
  bool get wantKeepAlive => true;
  late List<Carro>? carros = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCarros();
  }

  _loadCarros() async {
    List<Carro>? carros = await CarrosApi.getCarros(this.widget.tipo);
    setState(() {
      this.carros = carros;
    });
  }

  @override
  Widget build(BuildContext context) {
    //para garantir que vai ser feito o keepAlive;
    super.build(context);

    if (carros == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return _listViewCarros(carros);
  }

  _listViewCarros(List<Carro>? carros) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: carros != null ? carros.length : 0,
          itemBuilder: (context, index) {
            Carro c = carros![index];

            return Card(
              color: Colors.greenAccent,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: c.urlFoto != ''
                            ? Image.network(c.urlFoto, width: 140, errorBuilder:
                                (BuildContext context, Object exception,
                                    StackTrace? stackTrace) {
                                return Image.asset("imagens/sem-imagem.jpg");
                              })
                            : Image.asset("imagens/sem-imagem.jpg"),
                      ),
                      Text(
                        c.nome,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(
                        c.descricao,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14),
                      ),
                      ButtonBarTheme(
                        data: ButtonBarTheme.of(context),
                        child: ButtonBar(
                          alignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 20),
                                ),
                                onPressed: () => _onClickCarro(c),
                                child: const Text("Detalhe")),
                            TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 20),
                                ),
                                onPressed: () {},
                                child: const Text("Share"))
                          ],
                        ),
                      ),
                    ]),
              ),
            );
          }),
    );
  }

  _onClickCarro(Carro c) {
    push(context, CarroPage(c));
  }
}
