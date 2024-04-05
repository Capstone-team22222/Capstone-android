import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'screens/alarm_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MainScreenState();
}

class _MainScreenState extends State<MyApp>{
  int currentIndex = 0;
  final screens = [
    MainPage(),
    AlarmPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sleep Tracker',
      home: Scaffold(backgroundColor: Color(0xffe9edf3),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text("Sleep Tracker",
         style: TextStyle(
          color: Colors.black,),
          ),
        ),
        body: screens[currentIndex],
        bottomNavigationBar:
          BottomNavigationBar(backgroundColor: Colors.grey, selectedItemColor: Colors.white,unselectedItemColor: Colors.black,
          currentIndex: currentIndex, onTap: (index) => setState(() => currentIndex = index), items:[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "홈",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              label: "알람",
            ),
          ],
        ),
      ),
    );
  }
}