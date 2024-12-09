import 'package:currency_converter/Screens/UnitScreens/AreaScreen.dart';
import 'package:currency_converter/Screens/UnitScreens/PowerScreen.dart';
import 'package:currency_converter/Screens/UnitScreens/PressureScreen.dart';
import 'package:currency_converter/Screens/UnitScreens/SpeedScreen.dart';
import 'package:currency_converter/Screens/UnitScreens/TemperatureScreen.dart';
import 'package:currency_converter/Screens/UnitScreens/WeightScreen.dart';
import 'package:currency_converter/Screens/UnitScreens/lengthScreen.dart';
import 'package:currency_converter/Screens/UnitScreens/VolumeScreen.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class Morescreen extends StatefulWidget {
  const Morescreen({super.key});

  @override
  State<Morescreen> createState() => _MorescreenState();
}

class _MorescreenState extends State<Morescreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: const Color.fromARGB(255, 237, 252, 255),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: _buildScreen(),
      ),
    );
  }

  Widget _buildScreen() {
    return GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 50,
        crossAxisSpacing: 15,
        padding: const EdgeInsets.all(16),
        children: [

          screenNavigator(Icons.straighten_sharp, 'Length', const LengthScreen()),
          screenNavigator(Icons.straighten, 'Area', const AreaScreen()),
          screenNavigator(Icons.view_in_ar_sharp, 'Volume', const VolumeScreen()),
          screenNavigator(Icons.speed_sharp, 'Speed', const SpeedScreen()),
          screenNavigator(Icons.scale_sharp, 'Weight', const WeightScreen()),
          screenNavigator(Icons.thermostat_sharp, 'Temperature', const TemperatureScreen()),
          screenNavigator(Icons.bolt, 'Power', const PowerScreen()),
          screenNavigator(Icons.gas_meter_sharp, 'Pressure', const PressureScreen()),

        ]);
  }

  Widget _buildGridItem(IconData icon, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 30,
          color: const Color.fromARGB(255,148, 234, 233),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }

  Widget screenNavigator(IconData icon, String title, Widget destinationScreen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationScreen),
        );
      },
      child: _buildGridItem(icon, title),
    );
  }

}
