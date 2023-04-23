
import 'package:flutter/material.dart';
import 'package:flutter_navigation/AlterarContaCondutor.dart';
import 'package:flutter_navigation/ListarTransportesCondutor.dart';
import 'Dados.dart';
import 'HomepageCondutor.dart';
import 'Login.dart';
import 'SuporteCondutor.dart';

class Classificacao extends StatefulWidget {
  const Classificacao({Key? key}) : super(key: key);

  @override
  _Classificacao createState() => _Classificacao();
}

class _Classificacao extends State<Classificacao> {

  var fraca = Dados().utilizadorAtivo.classFraca;
  var razoavel = Dados().utilizadorAtivo.classRazoavel;
  var bom = Dados().utilizadorAtivo.classBom;
  var excelente = Dados().utilizadorAtivo.classExcelente;
  var geral = Dados().utilizadorAtivo.classificacaoGeral();
  var nrAvaliacoes = Dados().utilizadorAtivo.nrAvaliacoes();

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
                title: const Text('Página de Serviço'),
                onTap: () {
                  // Update the state of the app
                  // Then close the drawer
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Classificação'),
                onTap: () {
                  // Update the state of the app
                  // Then close the drawer
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Classificacao()),
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
                    MaterialPageRoute(builder: (context) => ListarTransportesCondutor()),
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
                    MaterialPageRoute(builder: (context) => SuporteCondutor()),
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
                    MaterialPageRoute(builder: (context) => AlterarContaCondutor()),
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
        title: Text('Uber de Mercadorias'),
        actions: [
          Image(image: AssetImage('Images/playstore.png'))
        ],
      ),

      body: Container(
          padding: EdgeInsets.all(15),
          child:Table(
            border: TableBorder.all(width:1, color:Colors.black45), //table border
            children: [
              TableRow(
                  children: [
                    TableCell(child: Image.asset('Images/classificacaoFraca.png')),
                    TableCell(child: Image.asset('Images/classificacaoRazoavel.png')),
                    TableCell(child: Image.asset('Images/classificacaoBom.png')),
                    TableCell(child: Image.asset('Images/classificacaoExcelente.png')),
                  ]
              ),

                TableRow(
                    children: [
                      TableCell(child: Text('$fraca')),
                      TableCell(child: Text('$razoavel')),
                      TableCell(child: Text('$bom')),
                      TableCell(child: Text('$excelente')),

                    ]
                ),
              TableRow(
                  children: [
                    TableCell(child: Text("Classificação Geral:")),
                    TableCell(child: Text('$geral')),
                    TableCell(child: Text('Total de Avaliações:')),
                    TableCell(child: Text('$nrAvaliacoes')),
                  ]
              ),

            ],),
      )
    );
  }
}