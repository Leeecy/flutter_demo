import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class test1 extends StatefulWidget {
  const test1({Key? key}) : super(key: key);

  @override
  State<test1> createState() => _test1State();
}

class _test1State extends State<test1> {
  String? noteValue;

  void getNotes() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.getString('noteData');
    noteValue = pref.getString('noteData');
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('title'),
        ),
        body: Center(
          child: noteValue == null
              ? Text('is null')
              : Text(
                  noteValue!,
                  style: TextStyle(
                    color: Colors.redAccent,
                  ),
                ),
        ));
  }
}
