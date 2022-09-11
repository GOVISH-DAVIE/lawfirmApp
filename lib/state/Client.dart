import 'package:flutter/cupertino.dart';
import 'package:hrm_employee/api/api.dart';
import 'package:hrm_employee/models/clients.dart';
import 'package:hrm_employee/state/auth.dart';
import 'package:hrm_employee/utils/locator.dart';

class ClientsProvider extends ChangeNotifier {
  List<ClientsModel> _clients = [];
  List<ClientsModel> get clients => _clients;

  final Api _api = locator<Api>();
  final Auth auth = locator<Auth>();
  ClientsProvider() {
    print(auth.currentUser);
    print('_auth.currentUser');

    auth.getuser();
  }
  getClients() {
    _api.getUserData(auth.currentUser?.token).then((value) {
      print(value.data);
      // _clients.
      for (var i = 0; i < value.data!.length; i++) {
        print(i);
        _clients.add(ClientsModel.fromJson(value.data?[i]));
      }

      notifyListeners();
    });
  }
}
