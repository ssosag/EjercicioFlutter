import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final _statusNumber = '404';

  Future setStatusNumber(String statusNumber) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_statusNumber, statusNumber);
  }

  Future getStatusNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_statusNumber) ?? "404";
  }
}
