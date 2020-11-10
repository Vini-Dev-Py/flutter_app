import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class AddPagamentos extends StatefulWidget {
  @override
  _AddPagamentosState createState() => _AddPagamentosState();
}

class _AddPagamentosState extends State<AddPagamentos> {

  final _text = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Adicionar Pagamentos"
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffe68da4),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                "Informe Os Dados",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  letterSpacing: 1.5,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              TextField(
                controller: null,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(0)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(0)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(0)
                  ),
                  labelText: 'Nome do Cliente',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              TextField(
                controller: null,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(0)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(0)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(0)
                  ),
                  labelText: 'Valor',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              TextField(
                controller: null,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(0)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(0)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(0)
                  ),
                  labelText: 'Numero',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              TextField(
                controller: null,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(0)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(0)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(0)
                  ),
                  labelText: 'Email',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              TextField(
                controller: null,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(0)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(0)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(0)
                  ),
                  labelText: 'Endereço',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _text.text.isEmpty ? _validate = true : _validate = false;
                  });
                },
                child: Text('Criar Pagamento'),
                textColor: Colors.white,
                color: Colors.blueAccent,
              )
            ],
          ),
        )
      )
    );
  }
}

