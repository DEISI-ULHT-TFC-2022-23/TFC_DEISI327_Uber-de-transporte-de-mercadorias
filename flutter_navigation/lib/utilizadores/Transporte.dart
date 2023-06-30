class Transporte{

int id;
int idCliente;
int idCondutor;
String descricao;
int preco;
String levantamento;
String dataL;
String entrega;
String dataE;
int latL;
int longL;
int latE;
int longE;
int latA;
int longA;
int ativo;
int estadoL;
int estadoE;

Transporte(
    this.id,
    this.idCliente,
    this.idCondutor,
    this.descricao,
    this.preco,
    this.levantamento,
    this.dataL,
    this.entrega,
    this.dataE,
    this.latL,
    this.longL,
    this.latE,
    this.longE,
    this.latA,
    this.longA,
    this.ativo,
    this.estadoL,
    this.estadoE,
    );

factory Transporte.fromJson(Map<String, dynamic> json) => Transporte(

int.parse(json["id"]),
  int.parse(json["idCliente"]),
  int.parse(json["idCondutor"]),
json["descricao"],
int.parse(json["preco"]),
json["levantamento"],
json["dataL"],
json["entrega"],
json["dataE"],
  int.parse(json["latL"]),
  int.parse(json["longL"]),
int.parse(json["latE"]),
int.parse(json["longE"]),
int.parse(json["latA"]),
int.parse(json["longA"]),
int.parse(json["ativo"]),
int.parse(json["estadoE"]),
int.parse(json["estadoL"]),

);

Map<String, dynamic> toJson() => {
  'id': id.toString(),
  'idCliente': idCliente.toString(),
  'idCondutor': idCondutor.toString(),
  'descricao': descricao,
  'preco': preco.toString(),
  'levantamento': levantamento,
  'dataL': dataL,
  'entrega': entrega,
  'dataE': dataE,
  'latL': latL.toString(),
  'longL': longL.toString(),
  'latE': latE.toString(),
  'longE': longE.toString(),
  'latA': latA.toString(),
  'longA': longA.toString(),
  'ativo': ativo.toString(),
  'estadoE': estadoE.toString(),
  'estadoL': estadoL.toString(),
};
}