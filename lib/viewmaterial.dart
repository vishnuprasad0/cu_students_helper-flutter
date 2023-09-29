import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (_) => StudentHomePage()));
            // Navigate back to the previous screen
            },
        ),
        title: Text('Search Materials'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            child: Icon(Icons.search),
            onPressed: () {
              // Perform the search action
            },
          ),
        ],
      ),
    );
  }
}