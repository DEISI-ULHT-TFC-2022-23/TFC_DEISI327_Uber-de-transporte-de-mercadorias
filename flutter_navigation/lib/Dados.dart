

import 'dart:math';

import 'package:flutter_navigation/UtilizadorCliente.dart';
import 'package:flutter_navigation/UtilizadorCondutor.dart';
import 'package:intl/intl.dart';

class Dados {

  static Dados _instance = new Dados._();

  factory Dados() => _instance ??= new Dados._();

  Dados._();

  var fazerLocalizacao=false;
  var itemALocalizar;

  List<Utilizador> utilizadores = [];
  List<Transporte> transportes = [];

  var utilizadorAtivo;

  init() {

    Dados().adicionarCondutor('Carlos', 'Manuel', 'aa', 'aa', 'aa', 'aa', 'aa',
        'aa', 'aa', 'aa', 'aa', 'aa', 'aa', 'aa', 'aa', 'aa');

    Utilizador cliente = new Utilizador('antonio', 'catarino', 'aaa', 'aaa', 'aaa', 'aaa', 'aaa',
        'aaa', 'aaa', 'aaa', 'aaa');

    utilizadores.add(cliente);

    var transporte = new Transporte(cliente,'B', 'Calçada dos Mestres 36 r/c Campolide', 'Avenida Visconde de Valmor 77 r/c Lisboa',
        '3 caixas, 300kg, 2mx2m',38.72819979827545, -9.166406690726156, 38.737471065349105, -9.151172367737065, '300eur');

    semCodutor(transporte);
   transportes.add(transporte);

  }

  getServicosSolicitados() {
    return utilizadorAtivo.listaTransportes;
  }

  getListaTranspsortes(){
    return transportes;
  }

  getServicosPrestados() {
    return utilizadorAtivo.listaTransportes;
  }

  adicionarTransporteSolicitado(classeV, levantamento,
       entrega, descricao, latL, longL, latE, longE, preco) {
    var transporte = new Transporte(
        utilizadorAtivo, classeV, levantamento,
        entrega, descricao, latL, longL, latE, longE, preco);
        transporte.condutor = utilizadores.first;
        utilizadorAtivo.listaTransportes.add(transporte);
  }

  adicionarCliente(primeiroNome, ultimoNome, email, password, cc, nif, telefone, nascimento, morada,
      cidade, codigoPostal){
    var cliente = Utilizador(primeiroNome, ultimoNome, email, password, cc, nif, telefone, nascimento, morada,
        cidade, codigoPostal);
    utilizadores.add(cliente);
  }

  adicionarCondutor(primeiroNome, ultimoNome, email, password, cc, nif, cConducao, categoriaCarta,
      matricula, seguro, classV, telefone, nascimento, morada, cidade, codigoPostal){

    Utilizador condutor = new Utilizador(primeiroNome, ultimoNome, email, password, cc, nif, telefone, nascimento, morada,
        cidade, codigoPostal);
    condutor.UtilizadorCondutor(cConducao, categoriaCarta, matricula, seguro, classV);
    utilizadores.add(condutor);

  }

  //////////////////////////////
  atribuirTransporte(Utilizador condutor, Transporte transporte){
    transporte.condutor = condutor;
    transporte.ativo = true;

    condutor.listaTransportes.add(transporte);
    condutor.emServico=true;
  }
  ///////////////////////////////
  semCodutor(transporte){
    Utilizador condutor = new Utilizador('', '', '', '', '', '', '', '', '', '', '');
    transporte.condutor=condutor;
  }

  double calcularDistancia(lat1, lon1, lat2, lon2){
      var p = 0.017453292519943295;
      var a = 0.5 - cos((lat2 - lat1) * p)/2 +
          cos(lat1 * p) * cos(lat2 * p) *
              (1 - cos((lon2 - lon1) * p))/2;
      return 12742 * asin(sqrt(a));
  }

  String verificarConta(email, pass) {
    var emailCheck = false;
    var passwordCheck = false;

    for (Utilizador utilizador in utilizadores) {
      if (utilizador.email == email) {
        emailCheck = true;
        if (utilizador.password == pass) {
          passwordCheck = true;
          Dados().utilizadorAtivo = utilizador;
          return 'OK';
        }
      }
    }
    if (emailCheck == true && passwordCheck == true) {
      return 'OK';
    } else if (emailCheck == true && passwordCheck == false) {
      return 'Password Incorreta!';
    } else {
      return 'Email Incorreto ou Conta Inexistente!';
    }
  }

  String recuperarEmail(email) {
    var email = false;

    for (var utilizador in utilizadores) {
      if (utilizador.email == email) {
        email = true;
        ////ENVIAR PASS PARA EMAIL(FUTURO)
      }
    }
    if (email) {
      return 'OK';
    } else {
      return 'Email Incorreto ou Conta Inexistente!';
    }
  }

  getPreco(classV, distancia){
    if(classV == 'B'){
      if(distancia<=20){
        return 60;
      }
      else{
        return (60+(distancia-20));
      }
    }else if(classV == 'BE'){
      if(distancia<=20){
        return 70;
      }
      else{
        return (70+(distancia-20));
      }
    }else if(classV == 'C1'){
      if(distancia<=20){
        return 100;
      }
      else{
        return (100+(distancia-20));
      }
    }else if(classV == 'C'){
      if(distancia<=20){
        return 120;
      }
      else{
        return (120+(distancia-20));
      }
    }else if(classV == 'C1E'){
      if(distancia<=20){
        return 70;
      }
      else{
        return (70+(distancia-20));
      }
    }else if(classV == 'CE'){
      if(distancia<=20){
        return 80;
      }
      else{
        return (80+(distancia-20));
      }
    }

  }
}

class Transporte {
  Utilizador ?cliente;
  Utilizador ?condutor;
  var classeV='';
  var levantamento='';
  var dataLevantamento='';
  var entrega='';
  var dataEntrega='';
  var descricao = '';
  double latL = 0.0;
  double longL = 0.0;
  double latE = 0.0;
  double longE = 0.0;
  var ativo=false;
  var preco;
  double latAtual=0.0;
  double longAtual=0.0;
  var estadoLevantamento=false;
  var estadoEntrega=false;

  Transporte(this.cliente, this.classeV, this.levantamento, this.entrega,
       this.descricao,this.latL, this.longL, this.latE, this.longE, this.preco);

  TransporteCondutor(condutor){
    this.condutor = condutor;
  }
}

class Utilizador{
  var primeiroNome;
  var ultimoNome;
  var email;
  var password;
  var cc;
  var nif;
  /////SO CONDUTOR
  var cConducao;
  var categoriaCarta;
  var matricula;
  var seguro;
  var classV;
  var disponivel=false;
  var emServico=false;
  /////
  var telefone;
  var nascimento;
  var morada;
  var cidade;
  var codigoPostal;
  var listaTransportes = [];
  var tipo;
  var classFraca=0;
  var classRazoavel=0;
  var classBom=0;
  var classExcelente=0;
  double latAtual=0.0;
  double lonAtual=0.0;

  Utilizador(primeiroNome, ultimoNome, email, password, cc, nif, telefone, nascimento, morada,
      cidade, codigoPostal) {

    this.primeiroNome = primeiroNome;
    this.ultimoNome = ultimoNome;
    this.email = email;
    this.password = password;
    this.cc = cc;
    this.nif = nif;
    this.telefone = telefone;
    this.nascimento = nascimento;
    this.morada = morada;
    this.cidade = cidade;
    this.matricula = "";
    this.codigoPostal = codigoPostal;
    this.tipo = 'cliente';
  }
  UtilizadorCondutor(cConducao, categoriaCarta, matricula, seguro, classV) {

    this.cConducao = cConducao;
    this.categoriaCarta = categoriaCarta;
    this.matricula = matricula;
    this.seguro = seguro;
    this.classV = classV;
    this.tipo = 'condutor';
    this.disponivel = false;
    this.emServico = false;

  }

  classificacaoGeral(){
    return ((classFraca+classRazoavel+classBom+classExcelente)/4);
  }
  nrAvaliacoes(){
    return  (classFraca+classRazoavel+classBom+classExcelente);
  }

  atualizarLocalizacao(lat, lon){
    Dados().utilizadorAtivo.latAtual = lat;
    Dados().utilizadorAtivo.lonAtual = lon;
  }

  atualizarDisponibilidade(){
    if(Dados().utilizadorAtivo.disponivel==false){
      Dados().utilizadorAtivo.disponivel=true;
    }else{
      Dados().utilizadorAtivo.disponivel=false;
    }
  }
 String getDisponibilidade(){
    if(Dados().utilizadorAtivo.disponivel == true){
      return "Disponível a receber solicitações de transporte!";
    }else{
      return "Indisponível a receber solicitações de transporte!";
    }
  }

  String fazerLevantamento(){
    for(var item in listaTransportes){
      if(item.ativo==true){

        //item.latAtual = Dados().utilizadorAtivo.latAtual;
       // item.longAtual = Dados().utilizadorAtivo.lonAtual;
        item.estadoLevantamento = true;

        final now = new DateTime.now();
        String data = DateFormat.yMd().add_jm().format(now);

        item.dataLevantamento = data;

        return "Levantamento Confirmado!";
      }
    }
    return "Sem transporte ativo!";
  }

  String fazerEntrega(){
    for(var item in listaTransportes){
      if(item.ativo==true && item.estadoLevantamento == true){

       // item.latAtual= Dados().utilizadorAtivo.latAtual;
       // item.longAtual= Dados().utilizadorAtivo.lonAtual;
        Dados().utilizadorAtivo.emServio=false;
        item.estadoEntrega = true;
        item.ativo = false;

        final now = new DateTime.now();
        String data = DateFormat.yMd().add_jm().format(now);

        item.dataLentrega = data;

        return "Entrega Confirmada!";
      }
      return 'Entrega Indisponível';
    }
    return "Sem transporte ativo ou não levantado!";
  }

  getServicoEmTransporte(){
    for(var item in listaTransportes){
      if(item.ativo==true){
        return item;
      }
    }
  }
}



