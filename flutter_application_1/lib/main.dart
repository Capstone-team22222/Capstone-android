import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  //TextField의 정보를 가져오기 위한 controller
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: hourController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Hour',
              ),

            ),
            TextField(
              controller: minuteController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Minutes',
              ),
            ),
            ElevatedButton(
              child: const Text(
                '알람 설정',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                FlutterAlarmClock.createAlarm(hour:int.parse(hourController.text), minutes:int.parse(minuteController.text));
              },

            ),
            ElevatedButton(
              onPressed: () {
                // show alarm
                FlutterAlarmClock.showAlarms();
              },
              child: const Text(
                '알람 보기',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
