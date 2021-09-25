import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearcheckBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      divisions: 20,
      value: _valorSlider,
      min: 10,
      max: 400,
      onChanged: (_bloquearCheck)
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://www.lavanguardia.com/files/article_main_microformat/uploads/2014/04/30/5f9c0b5742242.jpeg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  _crearcheckBox() {
    /*
    return Checkbox(
      value: _bloquearCheck,
      onChanged: (value) {
        setState(() {
          _bloquearCheck = value;
        });
      },
    );
    */

    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (value) {
        setState(() {
          _bloquearCheck = value;
        });
      },
    );
  }

  _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (value) {
        setState(() {
          _bloquearCheck = value;
        });
      },
    );
  }
}
