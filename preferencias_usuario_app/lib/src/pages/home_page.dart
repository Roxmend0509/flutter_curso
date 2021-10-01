import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/pages/settings_page.dart';
import 'package:preferencias_usuario_app/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario_app/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.setUltimaPagina = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        backgroundColor: (prefs.getColor) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          (prefs.getColor == true)
              ? Text('Color secundario: Activado')
              : Text('Color secundario: Desactivado'),
          Divider(),
          (prefs.generoGet == 2)
              ? Text('Genero: Femenino')
              : Text('Genero: Masculino'),
          Divider(),
          Text('Nombre Usuario: ${prefs.getNombre}'),
          Divider(),
        ],
      ),
    );
  }
}
