import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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
            padding: EdgeInsets.fromLTRB(17, 1, 7, 1),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: const Color(0xffe68da4),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
