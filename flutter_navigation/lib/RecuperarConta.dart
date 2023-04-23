import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AgendarTransporte.dart';
import 'Dados.dart';
import 'HomepageCliente.dart';
import 'Suporte.dart';
import 'ListarPedidosCliente.dart';

class RecuperarConta extends StatefulWidget {
  @override
  _RecuperarConta createState() => _RecuperarConta();
}

class _RecuperarConta extends State<RecuperarConta> {

  final _emailController = TextEditingController();

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
              child: Text('Menu'),
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
              title: const Text('Informações'),
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
              title: const Text('Recuperação de Conta'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecuperarConta()),
                );
              },
            ),
          ],
        ),
      ),

      appBar: AppBar(
        title: Text("Uber de Mercadorias"),
        leading: BackButton(),
        actions: [
          Image(image: AssetImage('Images/playstore.png'))
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('Images/playstore.png')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Introduza um email válido (Ex.:abc@gmail.com)'),
              ),
            ),

            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  if(Dados().recuperarEmail(_emailController.text)=='OK'){
                    showAlertDialog(context, 'Password reenviada para o seu email!');
                  }else{
                    showAlertDialog(context, Dados().recuperarEmail(_emailController.text));
                  }

                },
                child: Text(
                  'Solicitar Recuperação de Conta',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, var mensagem) {

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Recuperação:"),
    content: Text(mensagem),
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