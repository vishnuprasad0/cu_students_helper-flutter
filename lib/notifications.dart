import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatefulWidget {

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<String> _notifications = [    'Notification 1',    'Notification 2',    'Notification 3',  ];

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(
                builder: (_) => StudentHomePage()));// Navigate back to the previous screen
          },
        ),
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_notifications[index]),
          );
        },
      ),
    );
    }
  }



