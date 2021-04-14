import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  createState() {
    return new _ContadorPageState();
  }
}

final _estilotexto = new TextStyle(fontSize: 40);
int _conteo = 0;

class _ContadorPageState extends State<ContadorPage> {
  int variablenueva = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text('Stateful'),
        centerTitle: true,
        toolbarOpacity: 0.5,
        elevation: 80,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Numero de clicks", style: _estilotexto),
          Text(_conteo.toString(), style: _estilotexto)
        ],
      )),
      floatingActionButton: _crearBotones(),
    );
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(width: 4),
        FloatingActionButton(
            onPressed: _cero, child: Icon(Icons.exposure_zero)),
        Expanded(child: SizedBox(width: 5.0)),
        FloatingActionButton(onPressed: _eliminar, child: Icon(Icons.remove)),
        SizedBox(width: 5.0),
        FloatingActionButton(onPressed: _agregar, child: Icon(Icons.add)),
        SizedBox(width: 5.0)
      ],
    );
  }

  void _agregar() {
    _conteo++;
    setState(() {});
  }

  void _eliminar() {
    _conteo--;
    setState(() {});
  }

  void _cero() {
    _conteo = 0;
    setState(() {});
  }
}
