import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_cash/models/user_models.dart';

class UserPerferences extends ChangeNotifier{
  late final SharedPreferences prefs ;

  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("firstName", user.firstName!);
    prefs.setString("lastName", user.lastName!);
    prefs.setString("email", user.email!);
    prefs.setString("phone", user.phone!);
    prefs.setString("token", user.token!);

    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? firstName = prefs.getString("firstName");
    String? lastName = prefs.getString("lastName");
    String? email = prefs.getString("email");
    String? phone = prefs.getString("phone");
    String? token = prefs.getString("token");
    String? renewalToken = prefs.getString("renewalToken");
    return User(
        firstName: firstName!,
        lastName: lastName,
        email: email!,
        phone: phone!,
        token: token!,);
  }

  userInfo () async{
    User userInfo = await getUser();
  }


  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("firstName");
    prefs.remove("lastName");
    prefs.remove("email");
    prefs.remove("phone");
    prefs.remove("token");
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token;
  }
}
