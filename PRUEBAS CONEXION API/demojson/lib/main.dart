import 'dart:convert';
import 'package:demojson/buscarRegistro.dart';
import 'package:demojson/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      getapi();
    });
  }

  Future getapi() async {
    http.Response response = await http.get(
        //Uri.encodeFull("https://jsonplaceholder.typicode.com/todos/"),
        Uri.encodeFull("http://192.168.0.161:8085/api/oscars"),
        headers: {"Accept": "Application/json"});
    print(jsonDecode(response.body));
    dashboard.data = json.decode(response.body);
    gotodashboard(context);
  }

  gotodashboard(BuildContext context) async {
    Map results = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => dashboard()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
              heroTag: null,
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add)),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BuscarRegistro()));
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
