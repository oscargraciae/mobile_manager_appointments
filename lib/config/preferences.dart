import 'package:shared_preferences/shared_preferences.dart';
class Preferences {

  static final Preferences _instancia = new Preferences._internal();

  factory Preferences() {
    return _instancia;
  }

  Preferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get token {
    print('Preferencias ${_prefs.getString("qid")}');
    return _prefs.getString('qid') ?? null;
  }

  set token( String value ) {
    _prefs.setString('qid', value);
  }
}
