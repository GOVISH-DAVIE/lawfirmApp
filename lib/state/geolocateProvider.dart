import 'package:flutter/cupertino.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hrm_employee/db/db.dart';
import 'package:hrm_employee/models/chekoutModel.dart';
import 'package:hrm_employee/utils/locator.dart';

class GeolocatorProvider extends ChangeNotifier {
  Position? _position;
  Position? get position => _position;
  GeoData? _positionLocation;
  GeoData? get positionLocation => _positionLocation;
  bool _locationBusy = true;
  bool get locationBusy => _locationBusy;
  final DB _db = locator<DB>();
  CheckingData? _checkingData;
  CheckingData? get checkingData => _checkingData;

  GeolocatorProvider() {
    getInitialPosition().then((value) {
      debugPrint(value.toString());
      _position = value;
      getLocationDetails(value.latitude, value.latitude);
    });
    // _checkingData = _db.fetchAllCheckin();
    notifyListeners();
  }

  getLocationDetails(lat, lng) async {
    _locationBusy = true;
    notifyListeners();

    GeoData addresses = await Geocoder2.getDataFromCoordinates(
        latitude: 40.714224,
        longitude: -73.961452,
        googleMapApiKey: "AIzaSyDwC5mBpcztehUHa3Gfjr9m8BtbNAve1LE");
    _positionLocation = addresses;
    _locationBusy = false;
    notifyListeners();
    debugPrint(addresses.address.toString());
  }

  checkIn() {
    // _checkingData = _db.checkin(position: positionLocation);
    notifyListeners();
  }

  checkOut() {
    // _checkingData = _db.checkout();
    notifyListeners();
  }
}

Future<Position> getInitialPosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
