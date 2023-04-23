import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation/AlterarContaCondutor.dart';
import 'package:flutter_navigation/HomepageCondutor.dart';
import 'package:flutter_navigation/ListarTransportesCondutor.dart';
import 'Classificacao.dart';
import 'Dados.dart';
import 'Login.dart';
import 'SuporteCondutor.dart';


class TransporteDetalhesCondutor extends StatelessWidget {

  const TransporteDetalhesCondutor(this.item);

  final Transporte item;

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
                        Text ("Detalhes de Serviço de Transporte", style: TextStyle(
                          fontSize: 30,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 20,),
                        Text(item.cliente?.primeiroNome+' '+item.cliente?.ultimoNome,style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text(item.classeV,style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text(item.cliente?.telefone,style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text(item.levantamento,style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text(item.dataLevantamento,style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text(item.entrega,style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text(item.dataEntrega,style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 100
                      ),

                    ),
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

showAlertDialog(BuildContext context) {

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Transporte Inativo"),
    content: Text("Transporte terminado ou em espera para levantamento"),

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