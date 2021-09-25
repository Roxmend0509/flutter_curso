import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_componets/src/pages/alert_page.dart';
import 'package:flutter_componets/src/routes/routes.dart';

//import 'package:flutter_componets/src/pages/home_template.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Componentes APP',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'), // English, no country code
          const Locale('es', 'ES'), // Spanish, no country code
        ],
        //home: HomePage(),
        initialRoute: '/',
        routes: getApplicationRoutes(),
        onGenerateRoute: (settings) {
          print('Ruta llamada: ${settings.name}');

          return MaterialPageRoute(builder: (context) => AlertPage());
        });
  }
}
