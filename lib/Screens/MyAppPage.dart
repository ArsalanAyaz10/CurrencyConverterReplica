import 'package:currency_converter/Screens/MoreScreen.dart';
import 'package:currency_converter/Screens/calculatorscreen.dart';
import 'package:flutter/material.dart';

class MyAppPage extends StatefulWidget {
  const MyAppPage({super.key});

  @override
  State<MyAppPage> createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
int selectedindex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildItem('Calculator',0),
                _buildItem('Exchange Rate',1),
                _buildItem('More',2),
              ],
            ),
            const SizedBox(height: 10),
            Container(height: 2,color: Colors.grey,)
          ],
        ),
      ),
      body:buildBody(),
    );

  }
  Widget _buildItem(String Title,int index){

    return GestureDetector(
      onTap: (){
        setState(() {
          selectedindex = index;
        });
      },
      child: Text(Title,style: TextStyle(
        color: selectedindex == index ? Colors.lightBlueAccent : Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),),
    );
  }

  Widget buildBody(){
    switch(selectedindex){
      case 0:
        return const CalculatorScreen();
      case 1:
        return const Center(child: Text('DATA')) ;
      case 2:
        return const Morescreen();
      default:
        return const CalculatorScreen();
    }
  }
}



