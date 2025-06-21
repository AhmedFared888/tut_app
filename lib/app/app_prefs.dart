import 'package:shared_preferences/shared_preferences.dart';
import 'package:tut_app/presentation/resources/language_manager.dart';

const String PREFS_Key_LANGUAGE = 'PREFS_Key_LANGUAGE';

class AppPrefs {
  AppPrefs(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_Key_LANGUAGE);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue(); // return default lang
    }
  }
}
