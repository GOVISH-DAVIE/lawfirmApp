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
  Api _api = locator<Api>();
  // var get user = _authenticationService.user;
  Future<bool> login({username, pass}) async {
    debugPrint(username);
    return await _api.postNoHeaders('account/api/login',
        {'username': username, 'password': pass}).then((value) {
      print(value);
      User _user = User.fromJson(value.data);
      return _db.addUser(_user);
    });
  }
}
