import 'package:flutter/material.dart';
import 'package:ejercicio/data/helper/shared_preferences_helper.dart';
import 'package:ejercicio/screens/info_screen.dart';
import 'package:ejercicio/screens/configuration_screen.dart'; // Asegúrate de importar la pantalla

class MainScreen extends StatefulWidget {
  static const String routeName = '/';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Image _image = Image.network('https://httpcats.com/404.jpg');
  @override
  void initState() {
    super.initState();
    getStatusNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: FittedBox(
            fit: BoxFit.contain,
            child: _image,
          )),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InfoScreen()),
                    );
                  },
                  child: const Text('Mi Info'),
                ),
                const SizedBox(height: 20), // Espaciado entre los botones
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const ConfigurationScreen()),
                    );
                  },
                  child: const Icon(Icons.settings),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future getStatusNumber() async {
    final SharedPreferencesHelper sharedPreferencesHelper =
        SharedPreferencesHelper();
    final statusNumber = await sharedPreferencesHelper.getStatusNumber();
    String src = 'https://httpcats.com/$statusNumber.jpg';
    setState(() {
      _image = Image.network(src);
    });
  }
}
