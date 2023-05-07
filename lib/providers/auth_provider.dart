import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:tap_cash/models/user_models.dart';
import 'package:tap_cash/utility/shared_preference.dart';

enum Status {
  notLoggedIn,
  notRegistered,
  loggedIn,
  registered,
  authenticating,
  registering,
  loggedOut
}

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.notLoggedIn; // Default Value
  Status _registeredStatus = Status.notRegistered; // Default Value

  Status get getLoggedInStatus => _loggedInStatus;
  Status get getRegisteredStatus => _registeredStatus;

  set setLoggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  set setRegisteredStatus(Status value) {
    _registeredStatus = value;
  }

  Future<Map<String, dynamic>> register(
      String? name, String? email, String? password) async {
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    Uri url = Uri.parse(
        "https://battaria.glowrank.com/api/auth/register?name=$name&email=$email&password=$password");
    print(name);
    print(email);
    print(password);

    http.Response response = await http.post(url, headers: headers);
    Map<String, dynamic> responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(responseData);
      User authUser = User.fromJson(responseData);
      UserPerferences().saveUser(authUser);
      return {
        'status': true,
        'message': "Successfuly registered",
        'data': authUser
      };
    } else {
      return {
        'status': false,
        'message': "UnSuccessfuly registered",
        'data': responseData
      };
    }
  }

  Future<Map<String, dynamic>> login(String? email, String? password) async {
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    _loggedInStatus = Status.authenticating;
    notifyListeners();
    Uri url = Uri.parse(
        "https://battaria.glowrank.com/api/auth/login?email=$email&password=$password");
    http.Response response = await http.post(url, headers: headers);

    final Map<String, dynamic> responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      _loggedInStatus = Status.loggedIn;
      notifyListeners();
      print(responseData);
      // User authUser = User.fromJson(responseData);
      // UserPerferences().saveUser(authUser);
      return {
        'status': true,
        'message': "Successfuly Login",
        'data': responseData
      };
    } else {
      _loggedInStatus = Status.notLoggedIn;
      notifyListeners();
      return {'status': false, 'message': responseData['message']};
    }
  }

  Future<Map<String, dynamic>> verification(String? email) async {
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    Uri url =
        Uri.parse("https://battaria.glowrank.com/api/send-otp?email=$email");
    http.Response response = await http.post(url, headers: headers);

    final Map<String, dynamic> responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      _loggedInStatus = Status.loggedIn;
      notifyListeners();
      print(responseData);
      return {
        'status': true,
        'message': "Successfuly Email verification",
        'data': responseData
      };
    } else {
      _loggedInStatus = Status.notLoggedIn;
      notifyListeners();
      return {'status': false, 'message': responseData['message']};
    }
  }
}
