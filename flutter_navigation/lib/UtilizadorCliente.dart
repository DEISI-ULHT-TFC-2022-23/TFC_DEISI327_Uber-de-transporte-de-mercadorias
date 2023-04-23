import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_navigation/Login.dart';
import 'package:flutter_navigation/Dados.dart';

class UtilizadorCliente extends StatelessWidget {

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
                        Text ("Registo de Conta: Cliente", style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 20,),
                        Text("Criar Nova Conta de Utlizador",style: TextStyle(
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
                            if(_pNomeController.text.isNotEmpty && _uNomeController.text.isNotEmpty &&
                            _emailController.text.isNotEmpty && _passController.text.isNotEmpty &&
                            _ccController.text.isNotEmpty && _nifController.text.isNotEmpty &&
                            _telefoneController.text.isNotEmpty && _diaController.text.isNotEmpty &&
                            _mesController.text.isNotEmpty && _anoController.text.isNotEmpty &&
                            _moradaController.text.isNotEmpty && _cidadeController.text.isNotEmpty &&
                            _codigoPostalController.text.isNotEmpty ) {

                              Dados().adicionarCliente(_pNomeController.text, _uNomeController.text, _emailController.text,
                                  _passController.text, _ccController.text, _nifController.text, _telefoneController.text,
                                  _diaController.text, _mesController.text, _anoController.text, _moradaController.text,
                                  _cidadeController.text, _codigoPostalController.text);

                              showAlertDialog2(context);

                              Timer(Duration(seconds: 3), () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => Login()));
                              });
                            }else{
                              showAlertDialog1(context);
                            }
                          },
                          child: Text(
                            'Registar',
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

showAlertDialog1(BuildContext context) {

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Falta de Dados:"),
    content: Text("Todos os campos são de preenchimento obrigatório!"),
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

showAlertDialog2(BuildContext context) {

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Registado Com Sucesso!"),
    content: Text("A sua conta foi criada com sucesso, obrigado!"),
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

