import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class test2 extends StatefulWidget {
  const test2({Key? key}) : super(key: key);

  @override
  State<test2> createState() => _test1State();
}

class _test1State extends State<test2> {
  Future<void> setNotesData(noteValue) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString('noteData', noteValue);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('title2'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              setNotesData('noteValue save1');
            },
            child: Text(
              'save',
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
          ),
        ));
  }
}
