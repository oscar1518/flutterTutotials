import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CARDS"),
      ),
      body: ListView(
        //SEPARACION DE CARDS
        padding: EdgeInsets.all(10),
        children: [
          _cardTipo1(),
          SizedBox(height: 10),
          _cardTipo2(),
          SizedBox(height: 10),
          _cardTipo1(),
          SizedBox(height: 10),
          _cardTipo2(),
          SizedBox(height: 10),
          _cardTipo1(),
          SizedBox(height: 10),
          _cardTipo2(),
          SizedBox(height: 10)
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 10,
      child: Column(
        children: [
          ListTile(
            title: Text("Información de empresa"),
            subtitle: Text(
                "Ubicada en Barcelona. Su principal cometido es crear aplicaciones para otras compañias o negocios particulares con al finalidad de hacer mas fácil su día a dia, ya sea con una app para gestionar reservas como una para manejar su contabilidad."),
            leading: Icon(Icons.photo_album, color: Colors.orange),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {},
              ),
              FlatButton(
                child: Text("Ok"),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  _cardTipo2() {
    final card = Container(
      //clipBehavior: Clip.antiAlias,
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //elevation: 10,
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(
                'https://i.pinimg.com/originals/0a/4d/cb/0a4dcb92fa2d3c601b58d72720d6bec4.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 200,
            fit: BoxFit.cover,
            //fit: BoxFit.cover,
          ),
          /*,Image(
            image: NetworkImage(
                'https://i.pinimg.com/originals/0a/4d/cb/0a4dcb92fa2d3c601b58d72720d6bec4.jpg'),
          ),*/
          Container(padding: EdgeInsets.all(10), child: Text("Logo de empresa"))
        ],
      ),
    );

    return Container(
      height: 236,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(3, 3))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
