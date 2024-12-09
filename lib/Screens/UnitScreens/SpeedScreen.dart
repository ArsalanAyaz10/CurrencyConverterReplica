import 'package:currency_converter/Screens/UnitScreens/PowerScreen.dart';
import 'package:currency_converter/Screens/UnitScreens/TemperatureScreen.dart';
import 'package:currency_converter/Screens/UnitScreens/WeightScreen.dart';
import 'package:currency_converter/Screens/UnitScreens/lengthScreen.dart';
import 'package:currency_converter/Screens/UnitScreens/AreaScreen.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import 'PressureScreen.dart';
import 'VolumeScreen.dart';

class SpeedScreen extends StatefulWidget {
  const SpeedScreen({super.key});

  @override
  State<SpeedScreen> createState() => _SpeedScreenState();
}

class _SpeedScreenState extends State<SpeedScreen> {
  String _unit1 = 'Light Speed (c)';
  String _unit2 = 'Mile/hr (mph)';

  final TextEditingController _unitcontroller1 = TextEditingController();
  final TextEditingController _unitcontroller2 = TextEditingController();

  final List<String> _units = [
    'Light Speed (c)',
    'Mach (ma)',
    'Kmeter/hr (km/h)',
    'Kmeter/sec (km/s)',
    'Meter/sec (m/s)',
    'Mile/hr (mph)',
  ];

  final List<String> convertList = [
    'Length',
    'Area',
    'Volume',
    'Speed',
    'Weight',
    'Temperature',
    'Power',
    'Pressure',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 5,
        shadowColor: const Color.fromARGB(255, 192, 163, 163),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 223, 179), // Very light orange
              Color.fromARGB(255, 255, 204, 102), // Lighter orange
              Color.fromARGB(255, 255, 165, 0), // Original orange
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
        ),
        title: const Text(
          'Speed Conversion',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: _buildBodyU(),
    );
  }

  Widget _buildBodyU() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    tileMode: TileMode.decal,
                    colors: [
                      Color.fromARGB(255, 255, 204, 102),
                      Color.fromARGB(255, 255, 240, 210),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                              bottom: 30,
                            ),
                            child: PopupMenuButton<String>(
                              constraints: const BoxConstraints.expand(
                                  width: 150, height: 150),
                              onSelected: (String newValue) {
                                // Navigate to the selected screen
                                switch (newValue) {
                                  case 'Length':
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LengthScreen()),
                                    );
                                    break;
                                  case 'Area':
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AreaScreen()),
                                    );
                                    break;
                                  case 'Volume':
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const VolumeScreen()),
                                    );
                                    break;
                                  case 'Speed':
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SpeedScreen()),
                                    );
                                    break;
                                  case 'Weight':
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const WeightScreen()),
                                    );
                                    break;
                                  case 'Temperature':
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const TemperatureScreen()),
                                    );
                                    break;
                                  case 'Power':
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PowerScreen()),
                                    );
                                    break;
                                  case 'Pressure':
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PressureScreen()),
                                    );
                                    break;
                                  default:
                                    break;
                                }
                              },
                              itemBuilder: (BuildContext context) {
                                return convertList
                                    .where((str) =>
                                        str !=
                                        'Speed') // Filter out the current screen
                                    .map((str) {
                                  return PopupMenuItem<String>(
                                    value: str,
                                    child: Text(
                                      str,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                  );
                                }).toList();
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              color: const Color.fromARGB(255, 245, 233, 178),
                              elevation: 5,
                              offset: const Offset(0, 50),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 5.0),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Speed', // Display the current screen name
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Icon(Icons.arrow_drop_down,
                                        color: Colors.black),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _unitcontroller1,
                                style: const TextStyle(
                                    fontSize: 24, color: Colors.white),
                                keyboardType:
                                    const TextInputType.numberWithOptions(),
                                decoration: const InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(bottom: 8),
                                  hintText: '',
                                  border: InputBorder.none,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            DropdownButton<String>(
                              menuMaxHeight: 230,
                              value: _unit1,
                              dropdownColor:
                                  const Color.fromARGB(255, 245, 233, 178),
                              elevation: 0,
                              isDense: false,
                              focusColor: Colors.white60,
                              itemHeight: 50,
                              autofocus: true,
                              padding: const EdgeInsets.all(5),
                              borderRadius: BorderRadius.circular(10),
                              icon: const SizedBox.shrink(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                              underline:
                                  const SizedBox.shrink(), // Remove underline
                              onChanged: (String? newValue) {
                                setState(() {
                                  _unit1 = newValue!;
                                });
                              },
                              items: _units.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 251, 251, 251),
                      Color.fromARGB(255, 249, 249, 249),
                      Color.fromARGB(255, 255, 255, 255), // white
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _unitcontroller2,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.only(bottom: 8),
                              hintText: '',
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 224, 218, 159),
                                  width: 2.0,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                                fontSize: 24, color: Colors.black),
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                          ),
                        ),
                        const SizedBox(width: 10),
                        DropdownButton<String>(
                          menuMaxHeight: 230,
                          value: _unit2,
                          dropdownColor:
                          const Color.fromARGB(255, 255, 250, 193),
                          elevation: 0,
                          isDense: false,
                          focusColor: Colors.white60,
                          itemHeight: 50,
                          autofocus: true,
                          padding: const EdgeInsets.all(5),
                          borderRadius: BorderRadius.circular(10),
                          icon: const SizedBox.shrink(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                          underline:
                              const SizedBox.shrink(), // Remove underline
                          onChanged: (String? newValue) {
                            setState(() {
                              _unit2 = newValue!;
                            });
                          },
                          items: _units
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 2 -
              75, // Adjust the position
          left:
              MediaQuery.of(context).size.width / 2 - 25, // Adjust the position
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: const Icon(
              Icons.swap_vert, // Replace with your desired icon
              size: 30.0,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}