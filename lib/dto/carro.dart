class Carro {
  late int? id;
  late String tipo;
  late String nome;
  late String descricao;
  late String urlFoto;
  late String? urlVideo;
  late String? latitude;
  late String? longitude;


  Carro({this.id=0, this.tipo="", required this.nome, required this.descricao,required this.urlFoto, this.urlVideo,
      this.latitude, this.longitude});

  Carro.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    tipo = json['tipo'] != null ? json['tipo']: 'Não informado';
    nome = json['nome'] != null ? json['nome']: 'Não informado';
    descricao = json['descricao'] != null ? json['descricao']: 'Não informado';
    urlFoto = json['urlFoto'] != null ? json['urlFoto']: '';
    urlVideo = json['urlVideo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id != null ? this.id: 0;
    data['tipo'] = this.tipo != null ? this.tipo: '';
    data['nome'] = this.nome != null ? this.nome: '';
    data['descricao'] = this.descricao != null ? this.descricao: '';
    data['urlFoto'] = this.urlFoto != null ? this.urlFoto: '';
    data['urlVideo'] = this.urlVideo != null ? this.urlVideo: '';
    data['latitude'] = this.latitude != null ? this.latitude: '';
    data['longitude'] = this.longitude;
    return data;
  }
}