class UtilizadorC {
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
  String cConducao;
  String classCarta;
  String matricula;
  String seguro;
  String classV;
  int disponivel;
  int emServico;
  int classFraca;
  int classRazoavel;
  int classBom;
  int classExcelente;
  int latA;
  int longA;

  UtilizadorC(
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
      this.cConducao,
      this.classCarta,
      this.matricula,
      this.seguro,
      this.classV,
      this.disponivel,
      this.emServico,
      this.classFraca,
      this.classRazoavel,
      this.classBom,
      this.classExcelente,
      this.latA,
      this.longA,
      );

  factory UtilizadorC.fromJson(Map<String, dynamic> json) => UtilizadorC(

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

    json["cConducao"],
    json["classCarta"],
    json["matricula"],
    json["seguro"],
    json["classV"],
  int.parse(json["disponivel"]),
  int.parse(json["emServico"]),
  int.parse(json["classFraca"]),
  int.parse(json["classRazoavel"]),
  int.parse(json["classBom"]),
  int.parse(json["clasExcelente"]),
  int.parse(json["latA"]),
  int.parse(json["longA"]),
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
    'cConducao': postal,
    'classCarta': classCarta,
    'matricula': matricula,
    'seguro': seguro,
    'classV': classV,
    'disponivel': disponivel.toString(),
    'emServico': emServico.toString(),
    'classFraca': classFraca.toString(),
    'classRazoavel' : classRazoavel.toString(),
    'classBom': classBom.toString(),
    'classExcelente': classExcelente.toString(),
    'latA': latA.toString(),
    'lonA': longA.toString(),
};
}