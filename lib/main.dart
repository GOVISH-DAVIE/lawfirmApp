import 'package:flutter/material.dart';
import 'package:hrm_employee/state/geolocateProvider.dart';
import 'package:hrm_employee/utils/locator.dart';
import 'package:provider/provider.dart';
import 'Screens/Splash Screen/splash_screen.dart';

import 'package:hrm_employee/sevice/authentication.dart';

import 'package:hrm_employee/state/Client.dart';
import 'package:hrm_employee/state/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context) => locator<GeolocatorProvider>()),
      ChangeNotifierProvider(create: (context) => locator<Auth>()),
      ChangeNotifierProvider(create: (context) => locator<ClientsProvider>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    getInitialPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Add the line below to get horizontal sliding transitions for routes.
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
      ),
      title: 'Maan HRM',
      home: const SplashScreen(),
    );
  }
}
