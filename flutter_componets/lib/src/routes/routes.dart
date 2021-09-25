import 'package:flutter/material.dart';

import 'package:flutter_componets/src/pages/alert_page.dart';
import 'package:flutter_componets/src/pages/animated_container_page.dart';
import 'package:flutter_componets/src/pages/avatar_page.dart';
import 'package:flutter_componets/src/pages/card_page.dart';
import 'package:flutter_componets/src/pages/home_page.dart';
import 'package:flutter_componets/src/pages/input_page.dart';
import 'package:flutter_componets/src/pages/listview_page.dart';
import 'package:flutter_componets/src/pages/slider_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'inputs': (BuildContext context) => InputPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'sliders': (BuildContext context) => SliderPage(),
    'lists': (BuildContext context) => ListaPage(),
  };
}
