import 'package:cu_students/home.dart';
import 'package:cu_students/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'funtion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterPage(),
    );
  }
}



class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  String url = '';
  var data,
      output = "";
  String? gender;

  TextEditingController fname = new TextEditingController();
  TextEditingController lname = new TextEditingController();
  TextEditingController mail = new TextEditingController();
  TextEditingController pswd = new TextEditingController();
  TextEditingController uname = new TextEditingController();
  TextEditingController clg = new TextEditingController();
  TextEditingController plc = new TextEditingController();
  TextEditingController mob = new TextEditingController();
  TextEditingController pst = new TextEditingController();
  TextEditingController dept = new TextEditingController();
  TextEditingController dobController = new TextEditingController();
  DateTime selectedDate = DateTime.now();



  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1980, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var d = selectedDate.toLocal().toString().split(' ')[0];
        dobController.text = d;
      });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                validator: (val) => val!.isEmpty ? 'Enter first name' : null,
                controller: fname,
                decoration: InputDecoration(labelText: 'FirstName'),
              ),
              TextFormField(
                validator: (val) => val!.isEmpty ? 'Enter last name' : null,
                controller: lname,
                decoration: InputDecoration(labelText: 'LastName'),
              ),
              TextFormField(
                validator: (val) => val!.isEmpty ? 'Enter email' : null,
                controller: mail,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                validator: (val) => val!.isEmpty ? 'Enter Username' : null,
                controller: uname,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextFormField(
                validator: (val) => val!.isEmpty ? 'Enter password' : null,
                controller: pswd,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              TextFormField(
                validator: (val) =>
                val!.isEmpty
                    ? ' Enter your Department'
                    : null,
                decoration: InputDecoration(labelText: 'Department'),
                controller: dept,
              ),
              TextFormField(
                controller: plc,
                validator: (val) => val!.isEmpty ? 'place' : null,
                decoration: InputDecoration(labelText: 'place'),
              ),
              TextFormField(
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  LengthLimitingTextInputFormatter(10)
                ],
                keyboardType: TextInputType.number,
                controller: mob,
                validator: (val) => val!.isEmpty ? 'mobile number' : null,
                decoration: InputDecoration(labelText: 'mobile'),
              ),
              TextFormField(
                controller: pst,
                validator: (val) => val!.isEmpty ? 'post' : null,
                decoration: InputDecoration(labelText: 'postoffice'),
              ),
              TextFormField(
                controller: clg,
                validator: (val) => val!.isEmpty ? 'college' : null,
                decoration: InputDecoration(labelText: 'college'),
              ),
          Text('   select gender'),
              RadioListTile(
                title: Text("Female"),
                value: "female",
                groupValue: gender,
                onChanged: (value){
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text("Male"),
                value: "Male",
                groupValue: gender,
                onChanged: (value){
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text("Other"),
                value: "Other",
                groupValue: gender,
                onChanged: (value){
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),


              TextField(controller: dobController,
                  onTap: () {
                    _selectDate(context);
                    var d = selectedDate.toLocal().toString().split(' ')[0];
                    // dobController.text=d;
                    print(d);
                  },
                  onChanged: (d) {
                    // do what you want with the text
                  },

                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'DOB',
                      hintText: 'yyyy-mm-dd')

              ),





              RaisedButton(
                color: Colors.blue,
                  child:Text('REGISTER'),
                  onPressed: () async {
                  print("====================");
                    if (!_formKey.currentState!.validate()) {
                      print("err");
                    }
                    else
                    {
                      var firstname = fname.text.toString();
                      var lastname=lname.text.toString();
                      var password=pswd.text.toString();
                      var college=clg.text.toString();
                      var department=dept.text.toString();
                      var mobile=mob.text.toString();
                      var post=pst.text.toString();
                      var email=mail.text.toString();
                      var username=uname.text.toString();
                      var place=plc.text.toString();
                      var dob=dobController.text.toString();



                      SharedPreferences prefs = await SharedPreferences
                          .getInstance();

                      final ipaddress = prefs.getString('ip') ?? '';

                      url = 'http://' + ipaddress + ':5000/registration?firstname=' + firstname + "&lastname=" + lastname + "&gender="+gender!  +"&password="+password +"&dob="+dob +"&college=" + college + "&department=" + department + "&mobile=" + mobile + "&post=" + post + "&email=" +email +"&username=" + username +"&place=" +place ;
                      print(url);


                      data = await fetchdata(url);
                      print(
                          "================================================================");
                      print(data);
                      print(data);
                      var decoded = jsonDecode(data.toString());
                      output = decoded['status'].toString();


                      print(
                          "output" + output);


                      if (output == 'ok') {
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (_) => Login()));
                      }
                      else {
                        print("invalid");
                      }
                    }
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
