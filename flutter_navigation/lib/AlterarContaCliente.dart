import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_navigation/Login.dart';
import 'package:flutter_navigation/Dados.dart';

import 'AgendarTransporte.dart';
import 'HomepageCliente.dart';
import 'ListarPedidosCliente.dart';
import 'RecuperarConta.dart';
import 'Suporte.dart';
import 'Dados.dart';

class AlterarContaCliente extends StatelessWidget {

  final _pNomeController = TextEditingController();
  final _uNomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _ccController = TextEditingController();
  final _nifController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _diaController = TextEditingController();
  final _mesController = TextEditingController();
  final _anoController = TextEditingController();
  final _moradaController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _codigoPostalController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,

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
        centerTitle: true,
        title: Text('Uber de Mercadorias'),
        leading: BackButton(),
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
                        Text ("Solicitar Alteração de Dados", style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 20,),
                        Text("(Preencha apenas os dados que pretende alterar)",style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                        ),),
                        SizedBox(height: 30,)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 100
                      ),
                      child: Column(
                        children: [

                          Text("Introduza os Dados de Utilizador"),
                          Text("Todos os campos são de preenchimento obrigatório!"),

                          makeInput(_pNomeController,label: "Primeiro Nome",obsureText: true),
                          makeInput(_uNomeController,label: "Último Nome",obsureText: true),
                          makeInput(_emailController,label: "Email",obsureText: true),
                          makeInput(_passController,label: "Password",obsureText: true),
                          makeInput(_ccController,label: "Identificação (Número de Cartão de Cidadão ou Similar):",obsureText: true),
                          makeInput(_nifController,label: "Número de Identificação Fiscal:",obsureText: true),
                          makeInput(_telefoneController,label: "Telefone:",obsureText: true),
                          makeInput(_diaController,label: "Dia de Nascimento:",obsureText: true),
                          makeInput(_mesController,label: "Mês de Nascimento:",obsureText: true),
                          makeInput(_anoController,label: "Ano de Nascimento;",obsureText: true),
                          makeInput(_moradaController,label: "Morada:",obsureText: true),
                          makeInput(_cidadeController,label: "Cidade:",obsureText: true),
                          makeInput(_codigoPostalController,label: "Código Postal:",obsureText: true),
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

                            if(_pNomeController.text.isNotEmpty){
                              Dados().utilizadorAtivo.primeiroNome = _pNomeController.text;
                            }
                            if(_uNomeController.text.isNotEmpty){
                              Dados().utilizadorAtivo.ultimoNome = _uNomeController.text;
                            }
                            if(_emailController.text.isNotEmpty){
                              Dados().utilizadorAtivo.email = _emailController.text;
                            }
                            if(_passController.text.isNotEmpty){
                              Dados().utilizadorAtivo.password = _passController.text;
                            }
                            if(_telefoneController.text.isNotEmpty){
                              Dados().utilizadorAtivo.telefone = _telefoneController.text;
                            }

                              showAlertDialog(context);

                          },
                          child: Text(
                            'Registrar',
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

showAlertDialog(BuildContext context) {

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alteração de Dados"),
    content: Text("Solicitação de Alteração de Dados efetuada com sucesso, obrigado!"),
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

