import 'package:apple_login_app/firebase_manager.dart';
import 'package:flutter/material.dart';
import 'home_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Binds the framework to flutter engine

  await FirebaseManager.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeRoute(),
    );
  }
}
