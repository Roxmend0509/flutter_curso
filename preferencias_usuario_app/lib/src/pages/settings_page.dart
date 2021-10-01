import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario_app/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _colorSecundario;
  late int _genero;
  late String _nombre = 'Pedro';
  TextEditingController? _textController;

  final prefs = PreferenciasUsuario();

  @override
  void initState() {
    super.initState();

    prefs.setUltimaPagina = SettingsPage.routeName;
    _genero = prefs.generoGet;
    _colorSecundario = prefs.getColor;
    _nombre = prefs.getNombre;
    _textController = new TextEditingController(text: prefs.getNombre);
  }

  _setSelectedRadio(int? valor) async {
    prefs.genero = valor ?? 1;
    _genero = valor ?? 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          backgroundColor: (prefs.getColor) ? Colors.teal : Colors.blue,
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
                prefs.setColor = value;
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
                onChanged: (value) {
                  prefs.settNombre = value;
                },
              ),
            ),
          ],
        ));
  }
}
