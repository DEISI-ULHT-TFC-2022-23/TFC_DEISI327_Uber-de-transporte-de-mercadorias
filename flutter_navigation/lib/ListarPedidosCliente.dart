import 'package:flutter/material.dart';
import 'package:flutter_navigation/AlterarContaCliente.dart';
import 'package:flutter_navigation/TransporteDetalhesCliente.dart';
import 'AgendarTransporte.dart';
import 'HomepageCliente.dart';
import 'Dados.dart';
import 'Suporte.dart';
import 'Login.dart';
import 'RecuperarConta.dart';

class ListarPedidosCliente extends StatelessWidget {

  const ListarPedidosCliente({super.key});

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


        body: Container(
            padding: EdgeInsets.all(15),
            child:Table(
              border: TableBorder.all(width:1, color:Colors.black45), //table border
              children: [
                TableRow(
                    children: [
                      TableCell(child: Text("Morada Levantamento")),
                      TableCell(child: Text("Data Levantamento")),
                      TableCell(child: Text("Morada Entrega")),
                      TableCell(child: Text("Data Levantamento")),
                      TableCell(child: Text("Detalhes")),
                    ]
                ),

                for (var item in Dados().utilizadorAtivo.listaTransportes)
                TableRow(
                    children: [
                      TableCell(child: Text(item.levantamento)),
                      TableCell(child: Text(item.dataLevantamento)),
                      TableCell(child: Text(item.entrega)),
                      TableCell(child: Text(item.dataEntrega)),
                      TableCell(child: new ElevatedButton(onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TransporteDetalhesCliente(item)
                            )
                        );
                      }, child: Text('+ Detalhes'))),
                    ]
                ),

              ],)
        )
    );

  }
}

