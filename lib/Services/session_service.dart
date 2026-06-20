import 'package:shared_preferences/shared_preferences.dart';

// Menyimpan status session login secara lokal (SharedPreferences)
// dipakai oleh Splash Screen untuk menentukan halaman tujuan
// dan dihapus saat Log Out di Halaman Profile.
class SessionService {
  static const String _keyIsLoggedIn = 'isLoggedIn';

  static Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsLoggedIn, value);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsLoggedIn) ?? false;
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyIsLoggedIn);
  }
}
