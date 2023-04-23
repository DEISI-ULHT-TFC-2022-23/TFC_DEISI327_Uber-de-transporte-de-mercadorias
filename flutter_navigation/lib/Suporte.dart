import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AgendarTransporte.dart';
import 'AlterarContaCliente.dart';
import 'HomepageCliente.dart';
import 'ListarPedidosCliente.dart';

class Suporte extends StatefulWidget {
  @override
  _Suporte createState() => _Suporte();
}

class _Suporte extends State<Suporte> {

  final _mensagemController = TextEditingController();

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
                  Text ("Contatos para Suporte Técnico", style: TextStyle(
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

                    Text("Email",style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[700],
                    ),),
                    SizedBox(height: 30,),
                    Text("a21503845@alunos.ulusofona.pt",style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),),
                    SizedBox(height: 30,),
                    Text("Telefone",style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[700],
                    ),),
                    SizedBox(height: 30,),
                    Text("213456789",style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),),
                    SizedBox(height: 30,),
                    Text("Whatsupp",style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[700],
                    ),),
                    SizedBox(height: 30,),
                    Text("9123456789",style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),),
                    SizedBox(height: 30,),
                    Text("Informações sobre a Aplicação",style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey[700],
                    ),),
                    SizedBox(height: 30,),
                    Text("Esta aplicação foi desenvolvida no âmbito do Trabalho de Final de Curso, inserido no curso de Licenciatura de Engenharia Informática, pelo seguinte aluno da Universidade Lusófona de Humanidade e Tecnologia: "
                        "António Catarino.",style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),),
                    SizedBox(height: 30,),
                    Text("Contate-nos agora:",style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey[700],
                    ),),
                    SizedBox(height: 30,),

                       TextField(
                         controller: _mensagemController,
                         keyboardType: TextInputType.multiline,
                          minLines: 5,//Normal textInputField will be displayed
                          maxLines: 10,// when user presses enter it will adapt to it
                         decoration: InputDecoration(
                           hintText: 'Escreva aqui...',
                           hintStyle: TextStyle(
                               color: Colors.grey
                           ),
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(20.0)),
                           ),
                         ),
                        ),
                    SizedBox(height: 30,),

                  ],
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    if(_mensagemController.text.isNotEmpty){
                      showAlertDialog(context);
                    }
                  },
                  child: Text(
                    'Enviar',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
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

showAlertDialog(BuildContext context) async {

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Mensagem Enviada!"),
    content: Text('Obrigado pelo seu contato.'),

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



