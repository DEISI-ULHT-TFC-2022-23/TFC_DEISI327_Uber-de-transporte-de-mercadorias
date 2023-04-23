

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation/UtilizadorCliente.dart';

import 'UtilizadorCondutor.dart';

class TipoUtilizador extends StatefulWidget {
  @override
  _TipoUtilizador createState() => _TipoUtilizador();
}

class _TipoUtilizador extends State<TipoUtilizador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uber de Mercadorias"),
        leading: BackButton(),
        actions: [
          Image(image: AssetImage('Images/playstore.png'))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100,),
            Container(
              alignment: Alignment.topCenter,
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),

              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => UtilizadorCliente()));
                },
                child: Text(
                  'Cliente',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(height: 100,),
            Container(
              height: 50,
              width: 250,
                alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => UtilizadorCondutor()));
                },
                child: Text(
                  'Condutor',
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