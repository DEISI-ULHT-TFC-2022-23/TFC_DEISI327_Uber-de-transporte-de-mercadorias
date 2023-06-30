import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation/AlterarContaCliente.dart';
import 'package:flutter_navigation/Suporte.dart';
import 'package:flutter_navigation/Login.dart';
import 'Dados.dart';
import 'HomepageCliente.dart';
import 'ListarPedidosCliente.dart';
import 'RecuperarConta.dart';

class AgendarTransporte extends StatefulWidget {
  @override
  _AgendarTransporte createState() => _AgendarTransporte();
}

class _AgendarTransporte extends State<AgendarTransporte> {

  final _classVController = TextEditingController();
  final _levantamentoController = TextEditingController();
  final _entregaController = TextEditingController();
  final _dataLController = TextEditingController();
  final _descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Images/playstore.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text('Menu - Bem-vindo !'),
            ),
            ListTile(
              title: const Text('Solicitar Transporte'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            ListTile(
              title: const Text('Agendar Transporte'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgendarTransporte()),
                );
              },
            ),
            ListTile(
              title: const Text('Listagem de Transportes'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListarPedidosCliente()),
                );
              },
            ),
            ListTile(
              title: const Text('Suporte'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Suporte()),
                );
              },
            ),
            ListTile(
              title: const Text('Definições de Conta'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlterarContaCliente()),
                );
              },
            ),
            ListTile(
              title: const Text('Sair'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Dados().utilizadorAtivo = null;
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
        ),
      ),

      appBar: AppBar(
        title: Text("Uber de Mercadorias"),
        actions: [
          Image(image: AssetImage('Images/playstore.png'))
        ],
      ),
      body:  SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            //height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text ("Agendar Transporte", style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 20,),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 100
                      ),
                      child: Column(
                        children: [

                          Text("Introduza os Dados do Transporte a Agendar"),
                          Text("Todos os campos são de preenchimento obrigatório!"),

                          makeInput(_classVController,label: "Classe de Veículo Pretendida:",obsureText: true),
                          makeInput(_levantamentoController,label: "Morada de Levantamento:",obsureText: true),
                          makeInput(_entregaController,label: "Morada de Entrega:",obsureText: true),
                          makeInput(_dataLController,label: "Data de Levantamento",obsureText: true),
                          makeInput(_descricaoController,label: "Descrição de Mercadoria(Dimensões: largura, comprimento, altura; Peso Bruto; Outras de interesse):",obsureText: true),

                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                          onPressed: (

                              ) {
                            if(_classVController.text.isNotEmpty && _levantamentoController.text.isNotEmpty &&
                                _entregaController.text.isNotEmpty && _dataLController.text.isNotEmpty &&
                                _descricaoController.text.isNotEmpty) {

                              var transporte = new Transporte(Dados().utilizadorAtivo, _classVController.text,
                                    _levantamentoController.text, _entregaController.text,
                                  _descricaoController.text, 38.72819979827545, -9.166406690726156,
                                  38.737471065349105, -9.151172367737065, '');

                              Dados().semCodutor(transporte);

                              var distancia = 100;

                              showAlertDialog2(context, transporte, distancia);

                            }else{
                              showAlertDialog1(context);
                            }
                          },
                          child: Text(
                            'Processar Custo',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

showAlertDialog1(BuildContext context) {

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Falta de Dados:"),
    content: Text("Todos os campos são de preenchimento obrigatório!"),
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );

  Timer(Duration(seconds: 3), () {
    Navigator.of(context, rootNavigator: true).pop();
  });
}



showAlertDialog2(BuildContext context,Transporte transporte, distancia) async {

  //var preco = Dados().getPreco(transporte.classeV, distancia);
  var preco = '200eur';

  Widget aceitarButton = FloatingActionButton(
    child: Text("Sim"),
    onPressed:  () {
      transporte.preco = preco;
      Dados().transportes.add(transporte);
      Dados().utilizadorAtivo.listaTransportes.add(transporte);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => AgendarTransporte()));
    },
  );
  Widget rejeitarButton = FloatingActionButton(
    child: Text("Não"),
    onPressed:  () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Deseja confirmar o agendamento?"),
    content: Text('Custo total de Transporte: $preco'),
    actions: [
      aceitarButton,
      rejeitarButton,
    ],

  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


Widget makeInput(controler,{label,obsureText = false}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,style:TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
      ),),
      SizedBox(height: 5,),
      TextField(
        //  obscureText: obsureText,
        controller: controler,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
          ),
        ),
      ),
      SizedBox(height: 30,)

    ],
  );
}