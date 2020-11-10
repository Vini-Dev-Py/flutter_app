import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

// Page
import 'package:flutter_app/Pages/AdicionarItens/AddPagamentos.dart';

class MyListaDePagamentos extends StatefulWidget {
  @override
  _MyListaDePagamentosState createState() => _MyListaDePagamentosState();
}

class _MyListaDePagamentosState extends State<MyListaDePagamentos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 50,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: const Color(0xffff0042))
                      ),
                      child: Text(
                          "Add Pagamentos"
                      ),
                      color: const Color(0xffe68da4),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddPagamentos())
                        );
                      },
                      onLongPress: () {
                        print("Opaa");
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
