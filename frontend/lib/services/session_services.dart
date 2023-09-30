import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SessionServices {
  late SharedPreferences prefs;

  SessionServices(this.prefs);

  Future<bool> setSessionData(String key, Map<String, dynamic> data) async {
    return await prefs.setString(key, json.encode(data));
  }

  Map<String, dynamic>? getSessionData(String key) {
    String? data = prefs.getString(key);
    if (data != null) {
      return json.decode(prefs.getString(key)!);
    }
    return null;
  }

  Future<bool> removeSessionData(String key) async {
    return await prefs.remove(key);
  }
}
