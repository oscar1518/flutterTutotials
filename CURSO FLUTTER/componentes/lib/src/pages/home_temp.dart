import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  // lista de strings
  final opciones = ['Uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Componentes Temp'),
      ),
      body: ListView(
          children:
              //_crearItems()
              _crearItemsCorta()),
    );
  }

  /*List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      lista.add(tempWidget);
      lista.add(Divider(
        color: Colors.deepOrangeAccent[100],
        indent: 15.0,
        endIndent: 15.0,
        thickness: 1,
        height: 0.1,
        key: null,
      ));
    }
    return lista;
  }*/

  List<Widget> _crearItemsCorta() {
    var widgets = opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Cualquier cosa'),
            leading: Icon(Icons.replay_rounded),
            trailing: Icon(Icons.arrow_right),
            onTap: () {},
          ),
          Divider(
            color: Colors.orangeAccent,
            height: 0.1,
            indent: 15,
            endIndent: 15,
          )
        ],
      );
    }).toList();

    return widgets;
  }
}
