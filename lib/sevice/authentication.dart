import 'package:hrm_employee/api/api.dart';
import 'package:hrm_employee/db/db.dart';
import 'package:hrm_employee/models/user.dart';
import 'package:hrm_employee/utils/locator.dart';

class AuthenticationService {
  Api _api = locator<Api>();
  DB _db = locator<DB>();
  bool _error = false;
  bool get error => _error;
  User? currentUser;
  bool isLogedIn = false;
}
