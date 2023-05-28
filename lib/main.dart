import 'dart:io';

import 'package:flutter/material.dart';

import 'dart:async';

import 'home.dart';

// ========================================================================== //

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// ========================================================================== //

Future<void> main() async {
  String? error;

  try {
    WidgetsFlutterBinding.ensureInitialized();

    HttpOverrides.global = new MyHttpOverrides();
  } catch (e) {
    error = e.toString();
  }

  runApp(MyApp(error: error));
}

// ========================================================================== //
//ignore: must_be_immutable
class MyApp extends StatefulWidget {
  late String? error;

  MyApp({
    this.error,
  });

  @override
  _MyAppState createState() => _MyAppState(error: error);
}

// ========================================================================== //
//ignore: must_be_immutable
class _MyAppState extends State<MyApp> {
  late String? error;

  _MyAppState({
    this.error,
  });

  // ------------------------------------------------------------------------ //

  @override
  void initState() {
    super.initState();
  }

  // ------------------------------------------------------------------------ //

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: HomePage()),
      themeMode: ThemeMode.system,
    );
  }
}

// ========================================================================== //