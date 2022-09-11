import 'package:get_it/get_it.dart';
import 'package:hrm_employee/api/api.dart';
import 'package:hrm_employee/db/db.dart';
import 'package:hrm_employee/sevice/authentication.dart';
import 'package:hrm_employee/state/Client.dart';
import 'package:hrm_employee/state/auth.dart';
import 'package:hrm_employee/state/geolocateProvider.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerFactory(() => DB());
  locator.registerFactory(() => GeolocatorProvider());
  locator.registerFactory(() => Auth());
  locator.registerFactory(() => AuthenticationService());
  locator.registerFactory(() => ClientsProvider());
  locator.registerFactory(() => Api());
}
