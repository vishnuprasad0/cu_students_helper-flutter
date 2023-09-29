import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart';



import 'package:file_picker/file_picker.dart';
// import 'package:open_file/open_file.dart';
import 'package:image_picker/image_picker.dart';





void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: upload(),
    );
  }
}

class upload extends StatefulWidget {
  @override

  _LoginDemoState createState() => _LoginDemoState();

}

class _LoginDemoState extends State<upload> {
  TextEditingController fnameController = new TextEditingController();
  TextEditingController lnameController = new TextEditingController();

  TextEditingController AddresController = new TextEditingController();
  TextEditingController dobController = new TextEditingController();
  TextEditingController fileController = new TextEditingController();
  DateTime selectedDate = DateTime.now();
  var localmage="";
  var fname="",states="Select";
  var status=0;
  var quali = "";
  var gender = "Male";


  XFile? xfile;
  File? file;
  File _image= File('asset/image/flutter-logo.png');
  _imgFromCamera() async {
    // File image = await ImagePicker.pickImage(
    //     source: ImageSource.camera, imageQuality: 50
    status=1;
    // );
    // XFile? xfile;
    File? file;
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file= File(result.files.single.path.toString());
    } else {
      // User canceled the picker
    }

  }

  _imgFromGallery() async {
    // XFile? xfile;
    status=1;
    // This Line of Code will pick the image from your gallery
    File file;
    // FilePickerResult? result = await FilePicker.platform.pickFiles();

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
    } else {
      print('No file selected');
    }

  }
  var upload_file_path="";
  var upload_file_name="";
  FilePickerResult? result;
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(

              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: ()
                      async{
                        result = await FilePicker.platform.pickFiles(allowMultiple: true );
                        if (result == null) {
                          print("No file selected");
                        } else {
                          setState(() {
                          });
                          result?.files.forEach((element) {
                            print(element.name);
                          });
                        }
                      }
                    // {
                    //   _imgFromGallery();
                    //   Navigator.of(context).pop();
                    // }

                  ),
                ],
              ),
            ),
          );
        }
    );
  }



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


  String url = '';
  var data,output = "";
  String dropdownValue = 'Select';
  List <String>spinnerItems = ["Select","malappuram", "kozhikode"];


  TextEditingController nameController = TextEditingController();
  int _radioValue = 0;

  void _handleRadioValueChange(value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          gender = "Male";
          break;
        case 1:
          gender = "Female";
          break;
      }
    });
  }

  void dropvalue(data) {
    setState(() {
      print("valueeeeeeeeeeeeeeeeeeeee");

      dropdownValue = data;
      states=data;


      print(data);
    });
  }

  // bool valuefirst = false;
  // bool valuesecond = false;
  List cbvalues = [false, false];
  List cbvalues1 = ["sslc", "plus two"];
  int _radioValue1 = 0;

  void _handleRadioValueChange0(value) {
    setState(() {
      print("@@@@@@@@@@@@@@@@@");
      print(value);
      // _radioValue = value;
      if (cbvalues[0]) {
        cbvalues[0] = false;
      }
      else {
        cbvalues[0] = true;
      }
      quali = "";
      for (int i = 0; i < cbvalues.length; i++) {
        if (cbvalues[i]) {
          quali += cbvalues1[i] + ",";
        }
      }
    });
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text("Upload Document"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (_) => StudentHomePage()));// Navigate back to the previous screen
          },
        ),
      ),
      body:
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Colors.white]),
          ),
        child:Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 60.0),

                child:
                Center(
                  child: GestureDetector(
                    onTap: () async{
                      print("started-------------");
                      FilePickerResult? result = await FilePicker.platform.pickFiles();
                      if (result == null) {
                        print("No file selected");
                      } else {
                        print("=================");
                        print(result.files.single.name+"==filename");
                        upload_file_name=result.files.single.name;
                        upload_file_path=result.files.single.path.toString();
                        print(result.files.single.path.toString()+"file path");
                      }

                      // _showPicker(context);
                    },
                    child: ClipOval(
                      /*radius: 55,
                      backgroundColor: Color(0xffdbd8cd),*/
                      child: status != 0
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          _image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                          : Container(

                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50)),
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.file_upload,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ),
                )
            ),
            SizedBox(
              height: 10,
            ),
            Padding(

              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: fnameController,


                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Subject Name',

                    hintText: 'Enter Subject or Paper Name'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                // splashColor: Colors.red,
                color: Colors.blue,
                // textColor: Colors.white,
                child: Text('UPLOAD',),
                onPressed: () {
                  setState(() {
                    print("###################################");
                    print(quali);
                    print("%%%%%%%%%%%%%%%%%%%%%%%%");
                    print(gender);
                    var fname = fnameController.text.toString();



                    chooseImage(fname);
                  });
                },
              ),


            ),
            SizedBox(
              height: 130,
            ),

          ],
        ),

      )
    );
  }

  void chooseImage(var fname)
  async {
    var localmage = await pickImage(fname);
    if (localmage != '') {

      setState(() {});

    }
  }
  Future<String> pickImage(var finame) async {
    if (upload_file_path != "") {
      fname= upload_file_name;   //xfile!.name;
      fileController.text=  fname;// xfile!.name;
      var filepath=upload_file_path;//xfile!.path;


      SharedPreferences prefs = await SharedPreferences.getInstance();


      final ipaddress = prefs.getString('ip') ?? '';
      final uid = prefs.getString('lid') ?? '';

      var request = http.MultipartRequest(
        'POST', Uri.parse("http://"+ipaddress+":5000/addmaterial"),

      );
      Map<String,String> headers={
        // "Authorization":"Bearer testToken",
        "Content-type": "multipart/form-data"
      };
      request.files.add(

          http.MultipartFile.fromBytes(
              'picture',
              File(filepath).readAsBytesSync(),
              filename: fname
          )

      );
      request.headers.addAll(headers);
      request.fields.addAll({
        "det":finame,
        "uid":uid,


      });
      print("request: "+request.toString());
      var res = await request.send();
      final respStr = await res.stream.bytesToString();
      print("This is response: "+respStr);
      var decoded = jsonDecode(respStr.replaceAll("'", "\""));
      print(decoded);
      print("+++++++++++++++++++++");
      // setState(() async {
      output = decoded['task'].toString();

      if(output=="success")
      {
        _showToast(context, "Uploaded");
        print("okkkkkkkkkk");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentHomePage()));

      }
      else
      {
        print("no");
      }
      localmage="";//encode;
      return "";
    } else {
      print('Pick Image First');
      return 'Error';
    }
  }
  void _showToast(BuildContext context,String cnt) {
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

}
