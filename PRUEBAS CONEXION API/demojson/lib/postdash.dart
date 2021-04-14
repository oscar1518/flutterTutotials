import 'package:demojson/main.dart';
import 'package:demojson/oscar_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<OscarModel> createOscar(
    String nif, String nombre, String apellido, String edad) async {
  final String apiUrl = "http://192.168.0.161:8085/api/oscars";
  final response = await http.post(apiUrl,
      body: {"NIF": nif, "Nombre": nombre, "Apellido": apellido, "Edad": edad});

  if (response.statusCode == 201) {
    final String responseString = response.body;

    return oscarModelFromJson(responseString);
  } else {
    return null;
  }
}

class PostPageDash extends StatefulWidget {
  @override
  _PostPageDashState createState() => _PostPageDashState();
}

class _PostPageDashState extends State<PostPageDash> {
  OscarModel _user;

  final TextEditingController nifController = TextEditingController();

  final TextEditingController nombreController = TextEditingController();

  final TextEditingController apellidoController = TextEditingController();

  final TextEditingController edadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: Text("POST"),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(32),
              child: Column(
                children: [
                  Text("Introducir Usuario",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w200)),
                  SizedBox(
                    width: 30,
                    height: 30,
                  ),
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
                  TextField(
                    // NOMBRE
                    maxLength: 20,
                    decoration: InputDecoration(
                      prefixIcon:
                          new Icon(Icons.perm_identity, color: Colors.black),
                      labelText: 'Nombre',
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
                    controller: nombreController,
                  ),
                  TextField(
                      maxLength: 20,
                      decoration: InputDecoration(
                        prefixIcon:
                            new Icon(Icons.perm_identity, color: Colors.black),
                        labelText: 'Apellido',
                        focusColor: Colors.orange,
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.orange, width: 2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(color: Colors.deepOrangeAccent)),
                      ),
                      controller: apellidoController),
                  TextField(
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon:
                          new Icon(Icons.perm_identity, color: Colors.black),
                      labelText: 'Edad',
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
                    controller: edadController,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _user == null
                      ? Container()
                      : Column(
                          children: [
                            Text("El registro ${_user.nombre} se ha creado!!")
                          ],
                        )
                ],
              )),
        ),
        floatingActionButton: FloatingActionButton(
          child: Text("POST!"),
          onPressed: () async {
            final String nif = nifController.text;
            final String nombre = nombreController.text;
            final String apellido = apellidoController.text;
            final String edad = edadController.text;

            final OscarModel user =
                await createOscar(nif, nombre, apellido, edad);

            setState(() {
              _user = user;
            });
          },
          backgroundColor: Colors.deepOrangeAccent,
        ));
  }
}
