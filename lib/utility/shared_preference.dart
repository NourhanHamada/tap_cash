import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_cash/models/user_models.dart';

class UserPerferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", user.email!);
    prefs.setString("phone", user.phone!);
    prefs.setString("type", user.type!);
    prefs.setString("token", user.token!);
    prefs.setString("renewalToken", user.renewalToken!);

    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? name = prefs.getString("name");
    String? email = prefs.getString("email");
    String? phone = prefs.getString("phone");
    String? type = prefs.getString("type");
    String? token = prefs.getString("token");
    String? renewalToken = prefs.getString("renewalToken");
    return User(
        name: name!,
        email: email!,
        phone: phone!,
        type: type!,
        token: token!,
        renewalToken: renewalToken!);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("name");
    prefs.remove("email");
    prefs.remove("phone");
    prefs.remove("type");
    prefs.remove("token");
    prefs.remove("renewalToken");
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token;
  }
}
