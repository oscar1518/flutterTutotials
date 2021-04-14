import 'package:flutter/material.dart';

class BuscarRegistro extends StatelessWidget {

  
  final TextEditingController nifController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BUSCADOR"),
      ),
      body: Column(children: [
        TextField(
                    // NIFFFFF
                    maxLength: 8,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon:
                          new Icon(Icons.perm_identity, color: Colors.black),
                      labelText: 'NIF',
                      focusColor: Colors.orange,
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.orange, width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(color: Colors.deepOrangeAccent)),
                    ),
                    controller: nifController,
        ),
      ],),
    );
  }
}
