import 'package:flutter/material.dart';
import 'package:flutter_navigation/HomepageCliente.dart';
import 'package:flutter/services.dart';
import 'package:flutter_navigation/Login.dart';
import 'package:flutter_navigation/Dados.dart';

void main() async {
  //  concrete binding for applications based on the Widgets framewor
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.black38),
  );
  Dados().init();

  // Firebase initalize
  runApp(MaterialApp(
    title: 'Homepage',
    theme: ThemeData(
        primarySwatch: Colors.blue
    ),
    home: Login(),
  )
  );
}






