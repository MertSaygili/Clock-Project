import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { countries, times, titles, clocks }

class SharedManager {
  SharedPreferences? preferences;

  SharedManager();

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> setStringList(SharedKeys key, List<String> list) async {
    _checkPreferences();
    preferences?.setStringList(key.name, list);
  }

  List<String> getStringList(SharedKeys key) {
    return preferences?.getStringList(key.name) ?? [];
  }

  void _checkPreferences() {
    if (preferences == null) throw 'ERROR WHILE DATA LOADING';
  }
}
