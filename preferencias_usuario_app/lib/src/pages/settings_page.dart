import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = true;
  int _genero = 1;
  String _nombre = 'Pedro';
  TextEditingController? _textController;

  @override
  void initState() {
    super.initState();
    _cargarPref();
    _textController = new TextEditingController(text: _nombre);
  }

  _cargarPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _genero = prefs.getInt('genero') ?? 1;
    setState(() {});
  }

  _setSelectedRadio(int? valor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('genero', valor ?? 1);
    _genero = valor ?? 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text('Settings',
                  style:
                      TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
            ),
            Divider(),
            SwitchListTile(
              value: _colorSecundario,
              title: Text('Color secundario'),
              onChanged: (value) {
                _colorSecundario = value;
                setState(() {});
              },
            ),
            RadioListTile(
                value: 1,
                title: Text('Masculino'),
                groupValue: _genero,
                onChanged: _setSelectedRadio),
            RadioListTile(
                value: 2,
                title: Text('Femenino'),
                groupValue: _genero,
                onChanged: _setSelectedRadio),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de la persona usando el teléfono'),
                onChanged: (value) {},
              ),
            ),
          ],
        ));
  }
}
