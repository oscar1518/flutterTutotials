import 'package:demojson/postdash.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class dashboard extends StatelessWidget {
  static List data;


  @override
  Widget build(BuildContext context) {
    return Scaffold( 
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PostPageDash()));
          },
          focusColor: Colors.yellow,
          child: (Icon(Icons.add)),
          focusElevation: 40,
          backgroundColor: Colors.greenAccent,
        ),
        appBar: AppBar(
          title: Text("Base de datos Oscar"),
          backgroundColor: Colors.orange,
        ),
        body: ListView.builder(
            itemCount: data.length == 0 ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              //return Text(data[index]["Nombre"]);
              return new Card(
                child: Column(children: [
                  new Text(
                    data[index]["NIF"].toString(),
                  ),
                  new Text(
                    data[index]["Nombre"],
                  ),
                  new Text(
                    data[index]["Apellido"],
                  ),
                  new Text(
                    data[index]["Edad"].toString(),
                  ),
                ]),
                color: Colors.orange.shade100,
              );
            })
            );
  }
}
