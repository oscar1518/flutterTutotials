import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 10.0;
  bool _bloquearCheck = false;
  String _tamano = 'Tamaño de la imagen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slides'),
      ),
      body: Container(
        child: Column(
          children: [
            _crearSlider(),
            _checkbox(),
            _crearSwitc(),
            Expanded(child: _crearImagen())
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigo,
      label: _tamano,
      //divisions: 20,
      value: _valorSlider,
      min: 10,
      max: 400,
      onChanged: (_bloquearCheck)? null : (valor) { //EVALUAMOS SI EL CHECK ES VERDADEO O
        setState(() {
          _valorSlider = valor;
          _tamano = 'Tamaño de la imagen';
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
        image: NetworkImage(
            'https://static8.depositphotos.com/1000459/1036/i/600/depositphotos_10366104-stock-photo-soccer-ball.jpg'),
        width: _valorSlider,
        fit: BoxFit.contain);
  }

  Widget _checkbox() {
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        _bloquearCheck = valor;
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );

/*         return Checkbox(
      value: _bloquearCheck,
      onChanged: (valor) {
        _bloquearCheck = valor;
        setState(() {
          _bloquearCheck = valor;
        });
      },
    ); */
  }

  _crearSwitc() {
    return CheckboxListTile(
      title: Text('Bloquear con Switch'),
      value: _bloquearCheck,
      onChanged: (valor) {
        _bloquearCheck = valor;
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }
}
