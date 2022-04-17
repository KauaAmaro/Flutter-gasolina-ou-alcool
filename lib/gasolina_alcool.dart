import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class gasolina_alcool extends StatefulWidget {
  const gasolina_alcool({Key? key}) : super(key: key);

  @override
  State<gasolina_alcool> createState() => _gasolina_alcoolState();
}

class _gasolina_alcoolState extends State<gasolina_alcool> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String resultado = "";

  void _calcular(){

    double? precoalcool = double.tryParse( _controllerAlcool.text );
    double? precogasolina = double.tryParse ( _controllerGasolina.text );

    if( precogasolina == null || precoalcool == null) {
      setState(() {
        resultado = "Numero invalido digite numero maior que 0 e com (.)";
      });
    }
    else{

      if ( precoalcool/precogasolina >= 0.7){
        setState(() {
          resultado = "Melhor abastecer com Gasolina";
        });

      }
      else{
        setState(() {
          resultado = "Melhor abastecer com Alcool";
        });

      }

       limpar();
    }

  }

  void limpar (){
    _controllerGasolina.text="";
    _controllerAlcool.text="";

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title:  Text("Alcool ou Gasolina"),
        backgroundColor: Colors.deepPurple,
      ),
      body:
        Container(
          padding: EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: <Widget> [
                  Padding(
                    padding: EdgeInsets.only( top:36, bottom: 32, ),
                    child:  Image.asset("imagem/logo.png", height: 100, width: 350,),
                  ),


                  Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 10 ),
                      child: Text("Saiba qual é a melhor opção para o abastecimento do seu carro",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )

                  ),

                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        label: Text("Preço Alcool, ex: 1.59")
                    ),
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    controller: _controllerAlcool,
                  ),

                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        label: Text("Preço Gasolina, ex: 2.37")
                    ),
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    controller: _controllerGasolina,

                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: RaisedButton(
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(15),
                      child: Text("Calcular",
                        style: TextStyle(
                          fontSize: 20,
                        ), ),
                      onPressed: _calcular,

                    ),

                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text( resultado,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),),
                  )




                ]
            ),
          ),
        ),

    );
  }
}


