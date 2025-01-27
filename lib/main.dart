import 'package:ejercicio/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:ejercicio/screens/info_screen.dart';
import 'package:ejercicio/screens/configuration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
      routes: <String, WidgetBuilder>{
        ConfigurationScreen.route: (context) => ConfigurationScreen(),
      },
    );
  }
}
