import 'package:cu_students/feedback.dart';
import 'package:cu_students/notifications.dart';
import 'package:cu_students/upload.dart';
import 'upload.dart';
import 'package:cu_students/viewmaterial.dart';
import 'package:flutter/material.dart';
import 'login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: SafeArea(child: StudentHomePage()),
      routes: {
        'home':(context)=>StudentHomePage(),
        'notifications':(context)=>NotificationScreen()
      },

    );
  }
}

class StudentHomePage extends StatefulWidget {

  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  int currentstate=1;
  List pages=[
    SearchScreen(),HomePage(),upload()
  ];
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        /*appBar: AppBar(
            title: Text('Student Home'),
            leading: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (_) => Login()));// Navigate back to the previous screen
              },
            )
        ),*/
        bottomNavigationBar: BottomNavigationBar(
          elevation: 60, enableFeedback:true ,backgroundColor: Colors.blue, iconSize: 30,
          selectedFontSize: 15,unselectedItemColor: Colors.white,selectedItemColor: Colors.black,
          showUnselectedLabels: true,showSelectedLabels: true,
          items: [

          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search')),

          BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home')),

          BottomNavigationBarItem(
              icon: Icon(Icons.upload),
              title: Text('Upload')),

        ],currentIndex:currentstate,
          onTap:(int index){
          setState(() {
            currentstate=index;
          });
          },
        ),
        body:
         Center(
         child:pages.elementAt(currentstate),
         ),
      ),
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 80),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => NotificationScreen()));
            // Navigate to notifications page
          },
          icon: Icon(Icons.notifications),
          label: Text('NOTIFICATIONS',style: TextStyle(fontSize: 19)),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(320, 60)),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => SearchScreen()));
            // Navigate to materials page
          },
          icon: Icon(Icons.menu_book_sharp),
          label: Text('MATERIALS',style: TextStyle(fontSize: 19)),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(320, 60)),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => upload()));
            // Navigate to add materials page
          },
          label: Text('ADD MATERIALS',style: TextStyle(fontSize: 19)),
          icon: Icon(Icons.upload_outlined),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(320, 60)),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => FeedbackPage()));
            // Navigate to add materials page
          },
          icon: Icon(Icons.message),
          label: Text('FEEDBACK',style: TextStyle(fontSize: 19)),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(320, 60)),

          ),
        ),
        SizedBox(height: 40,),

        Image.asset('images/hero-img.jpg',alignment: Alignment.bottomCenter,)
      ],
    );
  }
}