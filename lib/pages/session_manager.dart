import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String _sessionKey = 'session';
  static const String _usernameKey = 'username';
  static const String _SESSION_KEY = 'session_key';

  static Future<void> setSession(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_SESSION_KEY, token);
  }

  static Future<String?> getSession() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_SESSION_KEY);
  }

  static Future<void> setUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, username);
  }



  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_SESSION_KEY);
  }
}