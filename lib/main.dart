import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_demo/constants.dart';
import 'package:flutter_demo/test1.dart';
import 'package:flutter_demo/test2.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // ignore: invalid_use_of_visible_for_testing_member
  SharedPreferences.setMockInitialValues({});
  if (Platform.isIOS) {}
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  final String mUserName = "userName";

  String? noteValue;

  save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(mUserName, 'i,m shared');
  }

  Future<String?> get() async {
    String? userName;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString(mUserName);
    return userName;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                child: Text("save"),
                onPressed: () {
                  save();
                  print("************save****************");
                }),
            ElevatedButton(
                child: Text("get"),
                onPressed: () {
                  Future<String?> userName = get();
                  userName.then((String? userName) {
                    // ignore: avoid_print
                    print("************${userName}****************");
                  });
                }),
            ElevatedButton(
                child: Text("showSnackBar"),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Container(
                        padding: EdgeInsets.all(16.0),
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(children: <Widget>[
                          SizedBox(
                            width: 48,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'oh snap,',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                Text(
                                  'Flutter default snack bar isshowing',
                                  style: TextStyle(fontSize: 12),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ])),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ));
                }),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => test2()));
              },
              child: Text(
                '存储',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => test1()));
              },
              child: Text(
                '展示',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getNotes() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.getString('noteData');
    noteValue = pref.getString('noteData');
  }
}
