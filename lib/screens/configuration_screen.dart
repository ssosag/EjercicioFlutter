import 'package:flutter/material.dart';
import 'package:ejercicio/data/helper/shared_preferences_helper.dart';
import 'package:ejercicio/screens/main_screen.dart';
import 'package:ejercicio/http_status_codes.dart';

class ConfigurationScreen extends StatefulWidget {
  static const String route = '/configuracion';
  const ConfigurationScreen({super.key});

  @override
  State<ConfigurationScreen> createState() {
    return _ConfigurationScreenState();
  }
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  final SharedPreferencesHelper sharedPreferencesHelper =
      SharedPreferencesHelper();
  final List<String> _statusNumbers = httpStatusCodes;
  String _currentStatusNumber = "404";

  @override
  void initState() {
    super.initState();
    getStatusNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configuración')),
      body: Center(
        child: Column(children: [
          const Text(
              'Selecciona un código de estado http para cambiar al gato :)'),
          DropdownButton<String>(
            value: _currentStatusNumber,
            items: _statusNumbers.map((String name) {
              return DropdownMenuItem(
                value: name,
                child: Text(name),
              );
            }).toList(), // Fix: Properly convert to List
            onChanged: (newValue) async {
              setState(() {
                _currentStatusNumber = newValue!;
              });
              await changeStatusNumber();
            },
          ),
        ]),
      ),
    );
  }

  Future changeStatusNumber() async {
    await sharedPreferencesHelper.setStatusNumber(_currentStatusNumber);
    //Navigator.pop(context);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
  }

  Future getStatusNumber() async {
    String name = await sharedPreferencesHelper.getStatusNumber();
    setState(() {
      _currentStatusNumber = name;
    });
  }
}
