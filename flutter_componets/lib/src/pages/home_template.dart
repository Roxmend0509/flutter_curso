import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp.'),
      ),
      body: ListView(
        children: _crearItems(),
      ),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();
    print(lista);

    for (var opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt + '!'),
        subtitle: Text('Hola nene'),
        leading: Icon(Icons.accessibility_rounded),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {},
      );

      lista..add(tempWidget)..add(Divider());
    }

    return lista;
  }
}
