import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences? _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  //GET y SET Genero
  get generoGet {
    return _prefs?.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs!.setInt('genero', value);
  }

//GET y SET Color
  get getColor {
    return _prefs?.getBool('colorSecundario') ?? false;
  }

  set setColor(bool value) {
    _prefs!.setBool('colorSecundario', value);
  }

  //GET y SET Nombre
  get getNombre {
    return _prefs?.getString('nombre') ?? '';
  }

  set settNombre(String value) {
    _prefs!.setString('nombre', value);
  }

  //GET y SET Ultima pagina
  get getUltimaPagina {
    return _prefs?.getString('ultimaPagina') ?? 'home';
  }

  set setUltimaPagina(String value) {
    _prefs!.setString('ultimaPagina', value);
  }
}
