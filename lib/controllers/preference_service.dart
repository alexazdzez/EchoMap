import 'package:shared_preferences/shared_preferences.dart';
import 'settings_model.dart';

class PreferencesService {
  static const String _keySettings = 'settings';

  Future<void> saveSettings(SettingsModel settings) async {
    final prefs = await SharedPreferences.getInstance();
    final settingsMap = settings.toMap();
    await prefs.setString(_keySettings, settingsMap.toString());
  }

  Future<SettingsModel?> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final settingsString = prefs.getString(_keySettings);
    if (settingsString != null) {
      final settingsMap = Map<String, dynamic>.from(settingsString as Map);
      return SettingsModel.fromMap(settingsMap);
    }
    return null;
  }
}
