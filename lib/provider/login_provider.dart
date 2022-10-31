import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginApiProvider with ChangeNotifier {
  //
  bool _loading = false;
  //
  bool get loading => _loading;
  //
  void setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  //login function
  void login(String email, String password) async {
    setLoading(true);
    try {
      Response response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      //
      if (response.statusCode == 200) {
        print('Successfull');
        setLoading(false);
      } else {
        print('Failed');
        setLoading(false);
      }
    } catch (e) {
      setLoading(true);
      print(e.toString());
    }
  }
}
