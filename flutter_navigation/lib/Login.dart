import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_navigation/Dados.dart';
import 'package:flutter_navigation/HomepageCliente.dart';
import 'package:flutter_navigation/TipoUtilizador.dart';

import 'HomepageCondutor.dart';
import 'RecuperarConta.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uber de Mercadorias"),
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
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _passController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Introduza a password'),
              ),
            ),
            TextButton(
              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => RecuperarConta()));
              },
              child: Text(
                'Recuperar Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  if(Dados().verificarConta(_emailController.text, _passController.text) == 'OK'){
                    if(Dados().utilizadorAtivo.tipo == 'cliente'){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Home()));
                    }
                    if(Dados().utilizadorAtivo.tipo == 'condutor'){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => HomePage()));
                    }
                  }else{
                    showAlertDialog(context, Dados().verificarConta(_emailController.text, _passController.text));
                  }

                },
                child: Text(
                  'Entrar',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            TextButton(

              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => TipoUtilizador()));
              },
              child: Text(
                'Novo Utilizador? Comece por criar uma conta',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
           SizedBox(
             height: 130,
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, var mensagem) async {

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Dados Incorretos:"),
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
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => Login()));
  },
  );

}