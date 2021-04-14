import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final estilotexto = new TextStyle(fontSize: 40);
  final conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text('Titulo'),
        centerTitle: true,
        toolbarOpacity: 0.5,
        elevation: 80,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Numero de clicks", style: estilotexto),
          Text(conteo.toString(), style: estilotexto)
        ],
      )),
      floatingActionButton: FloatingActionButton(
        elevation: 18,
        child: Icon(Icons.add),
        onPressed: () {
          print('Hola MUNDOOOO');
          //conteo = conteo + 1;
        },
      ),
    );
  }
}
