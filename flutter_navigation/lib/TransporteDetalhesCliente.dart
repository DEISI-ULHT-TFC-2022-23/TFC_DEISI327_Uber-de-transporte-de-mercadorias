import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AgendarTransporte.dart';
import 'AlterarContaCliente.dart';
import 'Dados.dart';
import 'HomepageCliente.dart';
import 'package:flutter_navigation/ListarPedidosCliente.dart';

import 'Suporte.dart';
import 'Login.dart';
import 'RecuperarConta.dart';



class TransporteDetalhesCliente extends StatelessWidget {

  const TransporteDetalhesCliente(this.item);

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
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 20,),
                        Text('Primeiro Nome Condutor:',style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text(item.condutor?.primeiroNome,style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text('Último Nome Condutor:',style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text(item.condutor?.ultimoNome,style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text('Classe de Veículo:',style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text(item.classeV,style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text('Matricula do Veículo:',style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text(item.condutor?.matricula,style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text('Telefone do Condutor:',style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text(item.condutor?.telefone,style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text('Morada de Levantamento:',style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text(item.levantamento,style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text('Data de Levantamento:',style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text(item.dataLevantamento,style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text('Morada de Entrega:',style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text(item.entrega,style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text('Data de Entrega:',style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text(item.dataEntrega,style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text('Preço do Transporte:',style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 30,),
                        Text('${item.preco}',style: TextStyle(
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
                            if(item.ativo && item.estadoLevantamento == true){
                              Dados().fazerLocalizacao=true;
                              Dados().itemALocalizar=item;
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (_) => Home()));
                            }else{
                              showAlertDialog(context);
                            }
                          },
                          child: Text(
                            'Localizar Transporte',
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