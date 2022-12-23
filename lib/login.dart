import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student_Registration',
      theme: ThemeData(primaryColor: Color.fromARGB(255, 65, 55, 55)),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: reg(),
      backgroundColor: Color.fromARGB(255, 12, 12, 12),
    );
  }
}

class reg extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<reg> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.black,
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                          controller: usernameController,
                          onTap: () {
                            // dobController.text=d;
                            // chooseImage();

                            print("!!!!!!!!!!!!!!!!!!!!");
                          },
                          onChanged: (d) {
                            // do what you want with the text
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter  your username';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'username',
                              hintText: 'enter your username')),

                      SizedBox(
                        height: 20.0,
                      ),
                      // RaisedButton(
                      //   onPressed: () => _selectDate(context),
                      //   child: Text('Select date'),
                      // ),
                    ],
                  ),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        cursorColor: Colors.red,
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              labelText: 'password',
                              hintText: 'enter your password')),

                      SizedBox(
                        height: 20.0,
                      ),
                      // RaisedButton(
                      //   onPressed: () => _selectDate(context),
                      //   child: Text('Select date'),
                      // ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        print("vvvvvvvvvvvvvvvvvvvvvvvvvvvv");
                      } else {
                        var uname = usernameController.text.toString();
                        var passd = passwordController.text.toString();
/*                      var college=collegeController.text.toString();
                        var department=departmentController.text.toString();*/

                      }
                    },
                    child: Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: ElevatedButton(
                      onPressed: () => {},
                      child: Text(
                        'REGISTER',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ))
              ],
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 218, 218, 218),
        drawerScrimColor: Colors.blue,
      ),
    );
  }
}

void _showToast(BuildContext context, String cnt) {
  final scaffold = ScaffoldMessenger.of(context);
  String mycnt = cnt;
  scaffold.showSnackBar(
    SnackBar(
      content: Text(mycnt.toString()),
      action: SnackBarAction(
          label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
