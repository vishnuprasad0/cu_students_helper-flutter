import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'funtion.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feedback Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FeedbackPage(),
    );
  }
}

class FeedbackPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();


  String url = '';
  var data,output="";

  TextEditingController feed = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Form(
        key: _formKey,
        child:
        Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Please provide your feedback below:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 200,
                width:400 ,
                child:
                TextFormField(
                  controller: feed,
                  maxLines: 8,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    /*if (value.isEmpty) {
                  return 'Please enter some feedback';
                }
                return null;*/
                  },
                ),
              ),
              /*SizedBox(height: 20,
              width:400 ,
              child:
            TextFormField (
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email (optional)',
              ),
            ),
            ),
*/
              SizedBox(height: 20),
              RaisedButton.icon(
                onPressed: () async{
                  if (!_formKey.currentState!.validate()) {
                    print("not typed all fields");
                  }
                  else {

                    var feedback = feed.text.toString();
                    SharedPreferences prefs = await SharedPreferences.getInstance();

                    final ipaddress = prefs.getString('ip') ?? '';
                    final lid = prefs.getString('lid') ?? '';
                    url = 'http://' + ipaddress + ':5000/feedback?feed=' + feedback+"&lid="+lid ;
                    print(url);
                    try {
                      data = await fetchdata(url);
                      _showToast(context, data+"===output");
                      print(
                          "================================================================");
                      print(data);
                      //
                      print(data);
                      var decoded = jsonDecode(data.toString());
                      output = decoded['status'].toString();


                      print(
                          "output" +
                              output);


                      if (output == 'ok') {
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (_) => StudentHomePage()));
                      }
                      else {
                        print("invalid");
                        _showToast(context, "invalid ");

                      }
                    }
                    catch(e)
                    {
                      _showToast(context, e.toString()+"catch");
                    }




                  }
                },
                icon: Icon(Icons.send),
                label: Text('Send'),
              ),
            ],
          ),
        ),
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