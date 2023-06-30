import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_navigation/Login.dart';
import 'package:flutter_navigation/Dados.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_navigation/conexao/conexao.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_navigation/utilizadores/UtilizadorC.dart';

class UtilizadorCondutor extends StatelessWidget {

  final _pNomeController = TextEditingController();
  final _uNomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _ccController = TextEditingController();
  final _nifController = TextEditingController();
  final _cConducaoController = TextEditingController();
  final _categoriaCartaController = TextEditingController();
  final _matriculaController = TextEditingController();
  final _seguroController = TextEditingController();
  final _classVController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _nascimentoController = TextEditingController();
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
                        Text ("Registo de Conta: Condutor", style: TextStyle(
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
                        makeInput(_cConducaoController,label: "Número da Carta de Condução:",obsureText: true),
                        makeInput(_categoriaCartaController,label: "Categoria/as da Carta de condução",obsureText: true),
                        makeInput(_matriculaController,label: "Matrícula do Veículo Utilizado em Serviço:",obsureText: true),
                        makeInput(_seguroController,label: "Seguro do Veículo Utilizado em Serviço:",obsureText: true),
                        makeInput(_classVController,label: "Classe do Veículo Utlizado em Serviço:",obsureText: true),
                          makeInput(_telefoneController,label: "Telefone:",obsureText: true),
                          makeInput(_nascimentoController,label: "Data de Nascimento:",obsureText: true),
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
                                _cConducaoController.text.isNotEmpty && _categoriaCartaController.text.isNotEmpty &&
                                _matriculaController.text.isNotEmpty && _seguroController.text.isNotEmpty &&
                                _classVController.text.isNotEmpty && _telefoneController.text.isNotEmpty &&
                                 _moradaController.text.isNotEmpty && _nascimentoController.text.isNotEmpty &&
                                _cidadeController.text.isNotEmpty && _codigoPostalController.text.isNotEmpty ) {

                             // validarEmail();

                              Dados().adicionarCondutor(_pNomeController.text, _uNomeController.text, _emailController.text,
                                  _passController.text, _ccController.text, _nifController.text,
                                  _cConducaoController.text, _categoriaCartaController.text, _matriculaController.text,
                                  _seguroController.text, _classVController.text, _telefoneController.text, _nascimentoController.text,
                                  _moradaController.text, _cidadeController.text, _codigoPostalController.text);


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

  /*
  validarEmail() async{
    try {
      var res = await http.post(
          Uri.parse(conexao.validarEmail),
          body: {
            'email': _emailController.text.trim(),
          }
      );
      if(res.statusCode==200){
        //var resBodyValidarEmail = jsonDecode(res.body);
        // var resBodyValidarEmail =json.decode(json.encode(res.body));
        var resBodyValidarEmail =json.decode(res.body);
        //print(res.body.toString());
        if(resBodyValidarEmail['emailFound'] == true){
          Fluttertoast.showToast(msg: "Email já registado! Utilize outro email.");
        }
        else{
          registarUtilizador();
        }
      }
    }
    catch(e){
      print(e.toString());
    }
  }

  registarUtilizador() async{
    UtilizadorC utilizadorC = UtilizadorC(
      1,
      _pNomeController.text.trim(),
      _uNomeController.text.trim(),
      _emailController.text.trim(),
      _passController.text.trim(),
      _ccController.text.trim(),
      _nifController.text.trim(),
      _telefoneController.text.trim(),
      _nascimentoController.text.trim(),
      _moradaController.text.trim(),
      _cidadeController.text.trim(),
      _codigoPostalController.text.trim(),
            "condutor",
        _cConducaoController.text.trim(),
        _categoriaCartaController.text.trim(),
        _matriculaController.text.trim(),
        _seguroController.text.trim(),
        _classVController.text.trim(),
           0,
            0,
            0,
            0,
            0,
            0,
      0,
      0,

    );

    try{
      var res = await http.post(
        Uri.parse(conexao.signupC),
        body: utilizadorC.toJson(),
      );
      if(res.statusCode == 200){
        var resBodyOfSignUp = jsonDecode(res.body);
        if(resBodyOfSignUp['sucess'] == true){
          ////POSSIVEL POP UP Registado com Sucesso
          Fluttertoast.showToast(msg: "ERRO1-singup");
        }
        else{
          ////POSSIVEL POP UP de N Registado
          Fluttertoast.showToast(msg: "ERRO2-singUp");
        }
      }
    }
    catch(e){
      print(e.toString());
    }
  }*/
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