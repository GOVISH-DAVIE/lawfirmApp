import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hrm_employee/api/api.dart';
import 'package:hrm_employee/models/user.dart';
import 'package:hrm_employee/sevice/authentication.dart';
import 'package:hrm_employee/utils/locator.dart';
import 'package:hrm_employee/db/db.dart';

class Auth extends ChangeNotifier {
  AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  DB _db = locator<DB>();
  AuthenticationService get authenticationService => _authenticationService;
  User? _currentUser;
  User? get currentUser => _currentUser;
  bool _isloggedIn = false;
  bool get isloggedIn => _isloggedIn;
  bool _stateLoading = false;
  bool get stateLoading => _stateLoading;
  final Api _api = locator<Api>();
  // var get user = _authenticationService.user;
  Future<bool> login({username, pass}) async {
    debugPrint(username);
    return await _api.postNoHeaders('account/api/login',
        {'username': username, 'password': pass}).then((value) {
      print(value);
      print('value');
      User _user = User.fromJson(value.data);
      _currentUser = _user;
      _isloggedIn = true;
      notifyListeners();
      return _db.addUser(_user);
    });
  }

  Auth() {
    getuser();
  }

  getuser() {
    _db.getUser().then((value) {
      // print();
      if (value.isEmpty) {
      } else {
        print(value);
        User _u = User.fromJson(jsonDecode(value[0]['ddata']));
        _currentUser = _u;
        _isloggedIn = true;
        notifyListeners();
      }
    });
    //   print(u.token);
    //   _currentUser = u;
    //   if (u != null) {
    //     _isloggedIn = true;
    //   }
    //   notifyListeners();
  }
}
