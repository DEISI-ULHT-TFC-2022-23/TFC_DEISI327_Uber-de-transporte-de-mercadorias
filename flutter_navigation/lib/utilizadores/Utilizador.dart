class Utilizador {
  int id;
  String nome;
  String pronome;
  String email;
  String pass;
  String cc;
  String nif;
  String telefone;
  String nascimento;
  String morada;
  String cidade;
  String postal;
  String tipo;

  Utilizador(
      this.id,
      this.nome,
      this.pronome,
      this.email,
      this.pass,
      this.cc,
      this.nif,
      this.telefone,
      this.nascimento,
      this.morada,
      this.cidade,
      this.postal,
      this.tipo,
      );

  factory Utilizador.fromJson(Map<String, dynamic> json) => Utilizador(

    int.parse(json["id"]),
    json["nome"],
    json["pronome"],
    json["email"],
    json["pass"],
    json["cc"],
    json["nif"],
    json["telefone"],
    json["nascimento"],
    json["morada"],
    json["cidade"],
    json["postal"],
    json["tipo"],

  );

  Map<String, dynamic> toJson() => {
    'id': id.toString(),
  'nome': nome,
  'pronome': pronome,
  'email': email,
  'pass': pass,
  'cc': cc,
  'nif': nif,
  'telefone': telefone,
  'nascimento': nascimento,
  'morada': morada,
  'cidade': cidade,
  'postal': postal,
    'tipo': tipo,
};
}