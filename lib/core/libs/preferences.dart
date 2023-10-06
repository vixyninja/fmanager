import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    if (_prefs != null) {
      assert(false, 'Preferences already initialized');
      return;
    }
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance {
    assert(_prefs != null, 'Preferences not initialized');
    return _prefs!;
  }

  static bool get isDarkMode => _prefs!.getBool('isDarkMode') ?? false;

  static set isDarkMode(bool value) => _prefs!.setBool('isDarkMode', value);
}
