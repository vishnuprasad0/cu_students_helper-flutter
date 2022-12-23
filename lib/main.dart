import 'package:cu_students_helper/login.dart';
import 'package:flutter/material.dart';

main() {
  runApp(Login());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 0, 0, 0)),
      home: const Homescreen(),
    );
  }
}

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 22, 22, 5),
        // appBar: AppBar(),
        body: SafeArea(
            child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              // ignore: prefer_const_constructors
              Text(
                'Student Home',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 245, 245, 245),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),

              TextButton(
                  onPressed: () async {},
                  child: const Text('View Study Materials'),
                  style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 84, 105, 223),
                    padding: const EdgeInsets.all(20.0),
                    textStyle: const TextStyle(fontSize: 30),
                  )),
              TextButton(
                  onPressed: () async {},
                  style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 84, 105, 223),
                    padding: const EdgeInsets.all(20.0),
                    textStyle: const TextStyle(fontSize: 30),
                  ),
                  child: const Text('Add  Materials')),
              TextButton(
                  onPressed: () async {},
                  style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 84, 105, 223),
                    padding: const EdgeInsets.all(20.0),
                    textStyle: const TextStyle(fontSize: 30),
                  ),
                  child: const Text('Notifications')),
            ],
          ),
        )));
  }
}
