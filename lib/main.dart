import 'package:flutter/material.dart';
import 'package:flutter_demo/constants.dart';
import 'package:flutter_demo/test1.dart';
import 'package:flutter_demo/test2.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // ignore: invalid_use_of_visible_for_testing_member
  SharedPreferences.setMockInitialValues({});

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
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
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: ElevatedButton(
                child: Text("save"),
                onPressed: () {
                  save();
                  print("************save****************");
                }),
          ),
          Expanded(
            flex: 2,
            child: ElevatedButton(
                child: Text("get"),
                onPressed: () {
                  Future<String?> userName = get();
                  userName.then((String? userName) {
                    // ignore: avoid_print
                    print("************${userName}****************");
                  });
                }),
          ),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
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
                        color: Colors.white,
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
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }

  void getNotes() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.getString('noteData');
    noteValue = pref.getString('noteData');
  }
}
